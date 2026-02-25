// Copyright (C) 2026 Víctor Carreras
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';
import 'package:quizlab_ai/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_scoring_helper.dart';

/// Abstract class representing the base state for quiz execution.
abstract class QuizExecutionState {
  Map<int, EssayAiEvaluation> get aiEvaluations => {};

  /// Get the number of pending AI evaluations
  int get pendingAiEvaluationsCount =>
      aiEvaluations.values.where((e) => e.isPending).length;

  /// Whether any AI evaluation is currently pending
  bool get hasPendingAiEvaluations =>
      aiEvaluations.values.any((e) => e.isPending);
}

/// Initial state when no quiz execution is in progress.
class QuizExecutionInitial extends QuizExecutionState {}

/// State representing a quiz in progress.
class QuizExecutionInProgress extends QuizExecutionState {
  final List<Question> questions;
  final int currentQuestionIndex;
  final Map<int, List<int>>
  userAnswers; // questionIndex -> selected option indices
  final Map<int, String> essayAnswers; // questionIndex -> essay text
  final int totalQuestions;
  final Set<int>
  validatedQuestions; // Indices of questions that have been checked in Study Mode
  final bool isStudyMode;
  final QuizConfig quizConfig;
  final int incorrectAnswersCount;
  @override
  final Map<int, EssayAiEvaluation> aiEvaluations; // questionIndex -> evaluation data
  final bool isAiEvaluating;
  final bool wasLimitReached;

  QuizExecutionInProgress({
    required this.questions,
    required this.currentQuestionIndex,
    required this.userAnswers,
    required this.quizConfig,
    this.incorrectAnswersCount = 0,
    this.isAiEvaluating = false,
    this.wasLimitReached = false,
    Map<int, String>? essayAnswers,
    Set<int>? validatedQuestions,
    Map<int, EssayAiEvaluation>? aiEvaluations,
  }) : totalQuestions = questions.length,
       essayAnswers = essayAnswers ?? {},
       validatedQuestions = validatedQuestions ?? {},
       aiEvaluations = aiEvaluations ?? {},
       isStudyMode = quizConfig.isStudyMode;

  /// Get the current question
  Question get currentQuestion => questions[currentQuestionIndex];

  /// Check if this is the first question
  bool get isFirstQuestion => currentQuestionIndex == 0;

  /// Check if this is the last question
  bool get isLastQuestion => currentQuestionIndex == totalQuestions - 1;

  /// Get selected answers for current question
  List<int> get currentQuestionAnswers =>
      userAnswers[currentQuestionIndex] ?? [];

  /// Check if current question has been validated (checked)
  bool get isCurrentQuestionValidated =>
      validatedQuestions.contains(currentQuestionIndex);

  /// Check if an AI evaluation already exists for the current question
  EssayAiEvaluation? get currentAiEvaluation =>
      aiEvaluations[currentQuestionIndex];

  /// Check if an option is selected for current question
  bool isOptionSelected(int optionIndex) {
    return currentQuestionAnswers.contains(optionIndex);
  }

  /// Check if current question has been answered
  bool get hasCurrentQuestionAnswered {
    // For essay questions, check if there's text
    if (currentQuestion.type == QuestionType.essay) {
      final essayText = essayAnswers[currentQuestionIndex];
      return essayText != null && essayText.trim().isNotEmpty;
    }
    // For other questions, check if there are selected options
    return currentQuestionAnswers.isNotEmpty;
  }

  /// Get total answered questions count
  int get answeredQuestionsCount {
    int count = 0;
    for (int i = 0; i < totalQuestions; i++) {
      if (userAnswers.containsKey(i) && userAnswers[i]!.isNotEmpty) {
        count++;
      } else if (essayAnswers.containsKey(i) &&
          essayAnswers[i]!.trim().isNotEmpty) {
        count++;
      }
    }
    return count;
  }

  /// Get progress percentage based on answered questions
  double get progress =>
      totalQuestions > 0 ? answeredQuestionsCount / totalQuestions : 0.0;

  /// Copy with method for state updates
  QuizExecutionInProgress copyWith({
    List<Question>? questions,
    int? currentQuestionIndex,
    Map<int, List<int>>? userAnswers,
    Map<int, String>? essayAnswers,
    Set<int>? validatedQuestions,
    QuizConfig? quizConfig,
    int? incorrectAnswersCount,
    Map<int, EssayAiEvaluation>? aiEvaluations,
    bool? isAiEvaluating,
    bool? wasLimitReached,
  }) {
    return QuizExecutionInProgress(
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      userAnswers: userAnswers ?? this.userAnswers,
      essayAnswers: essayAnswers ?? this.essayAnswers,
      validatedQuestions: validatedQuestions ?? this.validatedQuestions,
      quizConfig: quizConfig ?? this.quizConfig,
      incorrectAnswersCount:
          incorrectAnswersCount ?? this.incorrectAnswersCount,
      aiEvaluations: aiEvaluations ?? this.aiEvaluations,
      isAiEvaluating: isAiEvaluating ?? this.isAiEvaluating,
      wasLimitReached: wasLimitReached ?? this.wasLimitReached,
    );
  }
}

/// State representing quiz completion with results.
class QuizExecutionCompleted extends QuizExecutionState {
  final List<Question> questions;
  final Map<int, List<int>> userAnswers;
  final Map<int, String> essayAnswers;
  @override
  final Map<int, EssayAiEvaluation> aiEvaluations;
  final double correctAnswers;
  final int totalQuestions;
  final double score; // percentage
  final bool isStudyMode;
  final QuizConfig quizConfig;
  final bool wasLimitReached;

  QuizExecutionCompleted({
    required this.questions,
    required this.userAnswers,
    required this.essayAnswers,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.quizConfig,
    required this.score,
    this.wasLimitReached = false,
    Map<int, EssayAiEvaluation>? aiEvaluations,
  }) : isStudyMode = quizConfig.isStudyMode,
       aiEvaluations = aiEvaluations ?? {};

  /// Get details for each question
  List<QuestionResult> get questionResults {
    return questions.asMap().entries.map((entry) {
      final index = entry.key;
      final question = entry.value;
      final userAnswer = userAnswers[index] ?? [];
      final essayAnswer = essayAnswers[index] ?? '';
      final aiEvaluation = aiEvaluations[index];

      final isCorrect = QuizScoringHelper.isAnswerCorrect(
        question,
        userAnswer,
        essayAnswer,
        aiEvaluation: aiEvaluation,
      );

      final isAnswered =
          (userAnswers.containsKey(index) && userAnswers[index]!.isNotEmpty) ||
          essayAnswers[index]?.trim().isNotEmpty == true;

      return QuestionResult(
        question: question,
        userAnswers: userAnswer,
        essayAnswer: essayAnswer,
        correctAnswers: question.correctAnswers,
        isCorrect: isCorrect,
        isAnswered: isAnswered,
        aiEvaluation: aiEvaluation,
      );
    }).toList();
  }

  @override
  int get pendingAiEvaluationsCount =>
      aiEvaluations.values.where((e) => e.isPending).length;

  @override
  bool get hasPendingAiEvaluations =>
      aiEvaluations.values.any((e) => e.isPending);

  /// Copy with method for state updates
  QuizExecutionCompleted copyWith({
    List<Question>? questions,
    Map<int, List<int>>? userAnswers,
    Map<int, String>? essayAnswers,
    Map<int, EssayAiEvaluation>? aiEvaluations,
    double? correctAnswers,
    int? totalQuestions,
    double? score,
    QuizConfig? quizConfig,
    bool? wasLimitReached,
  }) {
    return QuizExecutionCompleted(
      questions: questions ?? this.questions,
      userAnswers: userAnswers ?? this.userAnswers,
      essayAnswers: essayAnswers ?? this.essayAnswers,
      aiEvaluations: aiEvaluations ?? this.aiEvaluations,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      score: score ?? this.score,
      quizConfig: quizConfig ?? this.quizConfig,
      wasLimitReached: wasLimitReached ?? this.wasLimitReached,
    );
  }
}

/// Class to represent individual question results
class QuestionResult {
  final Question question;
  final List<int> userAnswers;
  final String essayAnswer;
  final List<int> correctAnswers;
  final bool isCorrect;
  final bool isAnswered;
  final EssayAiEvaluation? aiEvaluation;

  QuestionResult({
    required this.question,
    required this.userAnswers,
    required this.essayAnswer,
    required this.correctAnswers,
    required this.isCorrect,
    required this.isAnswered,
    this.aiEvaluation,
  });
}
