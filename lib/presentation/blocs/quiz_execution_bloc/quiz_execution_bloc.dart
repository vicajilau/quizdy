import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_scoring_helper.dart';
import 'package:quiz_app/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quiz_app/data/services/ai/ai_service_selector.dart';
import 'package:quiz_app/data/services/ai/ai_question_generation_service.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';
import 'package:quiz_app/core/extensions/string_extensions.dart';

/// BLoC for managing quiz execution state and logic.
class QuizExecutionBloc extends Bloc<QuizExecutionEvent, QuizExecutionState> {
  QuizExecutionBloc() : super(QuizExecutionInitial()) {
    // Handle quiz start
    on<QuizExecutionStarted>((event, emit) {
      emit(
        QuizExecutionInProgress(
          questions: event.questions,
          currentQuestionIndex: 0,
          userAnswers: {},
          quizConfig: event.quizConfig,
        ),
      );
    });

    // Handle answer selection
    on<AnswerSelected>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final currentQuestionIndex = currentState.currentQuestionIndex;
        final currentQuestion = currentState.currentQuestion;
        final newUserAnswers = Map<int, List<int>>.from(
          currentState.userAnswers,
        );

        // Get current answers for this question
        final currentAnswers = List<int>.from(
          newUserAnswers[currentQuestionIndex] ?? [],
        );

        // Handle different question types
        if (currentQuestion.type == QuestionType.multipleChoice) {
          // Multiple choice: allow multiple selections
          if (event.isSelected) {
            // Add answer if not already present
            if (!currentAnswers.contains(event.optionIndex)) {
              currentAnswers.add(event.optionIndex);
            }
          } else {
            // Remove answer if present
            currentAnswers.remove(event.optionIndex);
          }
        } else {
          // Single choice, true/false, essay: allow only one selection
          if (event.isSelected) {
            // Clear all previous answers and set only the selected one
            currentAnswers.clear();
            currentAnswers.add(event.optionIndex);
          } else {
            // Allow deselecting if trying to select the currently selected one
            currentAnswers.remove(event.optionIndex);
          }
        }

        // Update the answers map
        if (currentAnswers.isEmpty) {
          newUserAnswers.remove(currentQuestionIndex);
        } else {
          newUserAnswers[currentQuestionIndex] = currentAnswers;
        }

        // Calculate current incorrect count
        final incorrectCount = QuizScoringHelper.calculateResults(
          currentState.questions,
          newUserAnswers,
          currentState.essayAnswers,
          currentState.quizConfig,
        ).incorrectAnswers;

        final wasLimitReached =
            currentState.quizConfig.enableMaxIncorrectAnswers &&
            currentState.quizConfig.maxIncorrectAnswers != null &&
            incorrectCount >= currentState.quizConfig.maxIncorrectAnswers!;

        final newState = currentState.copyWith(
          userAnswers: newUserAnswers,
          incorrectAnswersCount: incorrectCount,
          wasLimitReached: wasLimitReached,
        );

        emit(newState);
      }
    });

    // Handle essay answer changes
    on<EssayAnswerChanged>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final currentQuestionIndex = currentState.currentQuestionIndex;
        final newEssayAnswers = Map<int, String>.from(
          currentState.essayAnswers,
        );

        // Update the essay answer for current question
        newEssayAnswers[currentQuestionIndex] = event.text;

        // Calculate current incorrect count
        final incorrectCount = QuizScoringHelper.calculateResults(
          currentState.questions,
          currentState.userAnswers,
          newEssayAnswers,
          currentState.quizConfig,
        ).incorrectAnswers;

        final wasLimitReached =
            currentState.quizConfig.enableMaxIncorrectAnswers &&
            currentState.quizConfig.maxIncorrectAnswers != null &&
            incorrectCount >= currentState.quizConfig.maxIncorrectAnswers!;

        final newState = currentState.copyWith(
          essayAnswers: newEssayAnswers,
          incorrectAnswersCount: incorrectCount,
          wasLimitReached: wasLimitReached,
        );

        emit(newState);
      }
    });

    // Handle Check Answer (Study Mode)
    on<CheckAnswerRequested>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final currentQuestionIndex = currentState.currentQuestionIndex;

        // Add current question to validated set
        final newValidatedQuestions = Set<int>.from(
          currentState.validatedQuestions,
        )..add(currentQuestionIndex);

        emit(currentState.copyWith(validatedQuestions: newValidatedQuestions));
      }
    });

    // Handle jump to question
    on<JumpToQuestionRequested>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        if (event.index >= 0 && event.index < currentState.questions.length) {
          emit(currentState.copyWith(currentQuestionIndex: event.index));
        }
      }
    });

    // Handle essay AI evaluation requested
    on<EssayAiEvaluationRequested>((event, emit) async {
      await _triggerAiEvaluation(
        event.questionIndex,
        event.localizations,
        state,
        emit,
      );
    });

    // Handle essay AI evaluation received
    on<EssayAiEvaluationReceived>((event, emit) {
      final currentState = state;
      final newAiEvaluations = Map<int, EssayAiEvaluation>.from(
        currentState.aiEvaluations,
      );

      newAiEvaluations[event.questionIndex] = event.evaluation;

      if (currentState is QuizExecutionInProgress) {
        emit(
          currentState.copyWith(
            aiEvaluations: newAiEvaluations,
            isAiEvaluating: false,
          ),
        );
      } else if (currentState is QuizExecutionCompleted) {
        // Recalculate score with updated AI evaluations
        final results = QuizScoringHelper.calculateResults(
          currentState.questions,
          currentState.userAnswers,
          currentState.essayAnswers,
          currentState.quizConfig,
          aiEvaluations: newAiEvaluations,
        );

        emit(
          currentState.copyWith(
            aiEvaluations: newAiEvaluations,
            correctAnswers: results.correctPoints,
            score: results.score,
          ),
        );
      }
    });

    // Handle retry for specific AI evaluation
    on<EssayAiEvaluationRetryRequested>((event, emit) async {
      final currentState = state;
      final newAiEvaluations = Map<int, EssayAiEvaluation>.from(
        currentState is QuizExecutionInProgress
            ? currentState.aiEvaluations
            : (currentState as QuizExecutionCompleted).aiEvaluations,
      );

      newAiEvaluations[event.questionIndex] = EssayAiEvaluation.pending();

      if (currentState is QuizExecutionInProgress) {
        emit(currentState.copyWith(aiEvaluations: newAiEvaluations));
      } else if (currentState is QuizExecutionCompleted) {
        emit(currentState.copyWith(aiEvaluations: newAiEvaluations));
      }

      await _triggerAiEvaluation(
        event.questionIndex,
        event.localizations,
        state,
        emit,
      );
    });

    // Handle next question
    on<NextQuestionRequested>((event, emit) async {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;

        // In Exam Mode, check if the limit was reached before allowing navigation
        if (!currentState.quizConfig.isStudyMode &&
            currentState.wasLimitReached) {
          _emitQuizCompleted(
            emit,
            currentState,
            isAiAvailable: await ConfigurationService.instance
                .getIsAiAvailable(),
          );
          return;
        }

        final nextIndex = currentState.currentQuestionIndex + 1;

        if (nextIndex < currentState.questions.length) {
          emit(currentState.copyWith(currentQuestionIndex: nextIndex));
        }
      }
    });

    // Handle previous question
    on<PreviousQuestionRequested>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        final prevIndex = currentState.currentQuestionIndex - 1;

        if (prevIndex >= 0) {
          emit(currentState.copyWith(currentQuestionIndex: prevIndex));
        }
      }
    });

    // Handle quiz submission
    on<QuizSubmitted>((event, emit) {
      if (state is QuizExecutionInProgress) {
        final currentState = state as QuizExecutionInProgress;
        _emitQuizCompleted(
          emit,
          currentState,
          isAiAvailable: event.isAiAvailable,
        );
      }
    });

    // Handle quiz restart
    on<QuizRestarted>((event, emit) {
      if (state is QuizExecutionCompleted) {
        final currentState = state as QuizExecutionCompleted;
        emit(
          QuizExecutionInProgress(
            questions: currentState.questions,
            currentQuestionIndex: 0,
            userAnswers: {},
            quizConfig: currentState.quizConfig,
          ),
        );
      }
    });

    // Handle retry failed questions
    on<RetryFailedQuestionsRequested>((event, emit) {
      if (state is QuizExecutionCompleted) {
        final currentState = state as QuizExecutionCompleted;
        final results = QuizScoringHelper.calculateResults(
          currentState.questions,
          currentState.userAnswers,
          currentState.essayAnswers,
          currentState.quizConfig,
        );

        if (results.failedQuestions.isNotEmpty) {
          emit(
            QuizExecutionInProgress(
              questions: results.failedQuestions,
              currentQuestionIndex: 0,
              userAnswers: {},
              quizConfig: currentState.quizConfig,
            ),
          );
        }
      }
    });
  }

  void _emitQuizCompleted(
    Emitter<QuizExecutionState> emit,
    QuizExecutionInProgress currentState, {
    bool isAiAvailable = false,
  }) {
    // Initialize AI evaluations map for essay questions,
    // preserving any evaluations already completed during Study Mode
    final aiEvaluations = <int, EssayAiEvaluation>{};
    for (int i = 0; i < currentState.questions.length; i++) {
      if (currentState.questions[i].type == QuestionType.essay) {
        final answer = currentState.essayAnswers[i];
        if (answer != null && answer.trim().isNotEmpty) {
          final existingEvaluation = currentState.aiEvaluations[i];
          if (existingEvaluation != null && existingEvaluation.isCompleted) {
            // Preserve already-completed evaluations from Study Mode
            aiEvaluations[i] = existingEvaluation;
          } else if (isAiAvailable) {
            aiEvaluations[i] = EssayAiEvaluation.pending();
          } else {
            aiEvaluations[i] = EssayAiEvaluation.notEvaluated();
          }
        }
      }
    }

    // Calculate results using the AI evaluations so completed essays
    // contribute their proportional score instead of a full point
    final results = QuizScoringHelper.calculateResults(
      currentState.questions,
      currentState.userAnswers,
      currentState.essayAnswers,
      currentState.quizConfig,
      aiEvaluations: aiEvaluations,
    );

    emit(
      QuizExecutionCompleted(
        questions: currentState.questions,
        userAnswers: currentState.userAnswers,
        essayAnswers: currentState.essayAnswers,
        aiEvaluations: aiEvaluations,
        correctAnswers: results.correctPoints,
        totalQuestions: currentState.questions.length,
        score: results.score,
        quizConfig: currentState.quizConfig,
        wasLimitReached: currentState.wasLimitReached,
      ),
    );
  }

  Future<void> _triggerAiEvaluation(
    int questionIndex,
    AppLocalizations localizations,
    QuizExecutionState currentState,
    Emitter<QuizExecutionState> emit,
  ) async {
    // Extract question and answer from the current state securely
    Question? question;
    String? answer;

    if (currentState is QuizExecutionInProgress) {
      if (questionIndex >= 0 && questionIndex < currentState.questions.length) {
        question = currentState.questions[questionIndex];
        answer = currentState.essayAnswers[questionIndex];
      }
    } else if (currentState is QuizExecutionCompleted) {
      if (questionIndex >= 0 && questionIndex < currentState.questions.length) {
        question = currentState.questions[questionIndex];
        answer = currentState.essayAnswers[questionIndex];
      }
    }

    if (question == null || answer == null || answer.trim().isEmpty) {
      add(
        EssayAiEvaluationReceived(
          questionIndex,
          EssayAiEvaluation.notEvaluated(),
        ),
      );
      return;
    }

    try {
      final availableServices = await AIServiceSelector.instance
          .getAvailableServices();
      if (availableServices.isEmpty) {
        add(
          EssayAiEvaluationReceived(
            questionIndex,
            EssayAiEvaluation.error(
              localizations.aiAssistantRequiresApiKeyError,
            ),
          ),
        );
        return;
      }

      final savedServiceName = await ConfigurationService.instance
          .getDefaultAIService();
      final savedModel = await ConfigurationService.instance
          .getDefaultAIModel();

      AIService? service;
      if (savedServiceName != null &&
          availableServices.any((s) => s.serviceName == savedServiceName)) {
        service = availableServices.firstWhere(
          (s) => s.serviceName == savedServiceName,
        );
      } else {
        service = availableServices.first;
      }

      String? model;
      if (savedModel != null && service.availableModels.contains(savedModel)) {
        model = savedModel;
      } else {
        model = service.defaultModel;
      }

      final prompt = AiQuestionGenerationService.buildEvaluationPrompt(
        question.text,
        answer,
        question.explanation,
        localizations,
      );

      final evaluationResponse = await service.getChatResponse(
        prompt,
        localizations,
        model: model,
      );

      String feedback = evaluationResponse;
      int? parsedScore;

      try {
        // Attempt to parse the structured JSON response
        String cleanContent = evaluationResponse.trim();
        final startIndex = cleanContent.indexOf('{');
        final endIndex = cleanContent.lastIndexOf('}');

        if (startIndex != -1 && endIndex != -1) {
          cleanContent = cleanContent.substring(startIndex, endIndex + 1);
          final json = jsonDecode(cleanContent) as Map<String, dynamic>;

          if (json.containsKey('score')) {
            parsedScore = (json['score'] as num?)?.toInt();
            // Normalize score to 0-100 scale: if the AI returned a value
            // in the 0-10 range, convert it to 0-100.
            if (parsedScore != null && parsedScore <= 10) {
              parsedScore = parsedScore * 10;
            }
          }
          if (json.containsKey('feedback')) {
            feedback = json['feedback'].toString();
          }
        }
      } catch (e) {
        // Fallback if the AI fails to return proper JSON, we'll keep the full response as feedback.
      }

      add(
        EssayAiEvaluationReceived(
          questionIndex,
          EssayAiEvaluation(evaluation: feedback, score: parsedScore),
        ),
      );
    } catch (e) {
      add(
        EssayAiEvaluationReceived(
          questionIndex,
          EssayAiEvaluation.error(
            localizations.aiEvaluationError(e.toString().cleanErrorMessage()),
          ),
        ),
      );
    }
  }
}
