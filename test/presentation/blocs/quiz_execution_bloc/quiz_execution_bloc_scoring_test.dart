import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/domain/models/quiz/quiz_config.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('QuizExecutionBloc Scoring', () {
    late QuizExecutionBloc quizExecutionBloc;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      quizExecutionBloc = QuizExecutionBloc();
    });

    tearDown(() {
      quizExecutionBloc.close();
    });

    final testQuestion = const Question(
      text: 'Question 1',
      type: QuestionType.singleChoice,
      options: ['A', 'B'],
      correctAnswers: [0],
      explanation: 'Explanation',
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'calculates score correctly with NO penalty',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion],
            quizConfig: const QuizConfig(
              questionCount: 1,
              isStudyMode: false,
              subtractPoints: false,
            ),
          ),
        );
        // Answer incorrectly
        bloc.add(AnswerSelected(1, true)); // Option B (index 1) is wrong
        bloc.add(QuizSubmitted());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(),
        isA<QuizExecutionInProgress>(), // After AnswerSelected
        isA<QuizExecutionCompleted>().having((s) => s.score, 'score', 0.0),
      ],
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'calculates score correctly WITH penalty',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion],
            quizConfig: const QuizConfig(
              questionCount: 1,
              isStudyMode: false,
              subtractPoints: true,
              penaltyAmount: 0.5,
            ),
          ),
        );
        // Answer incorrectly
        bloc.add(AnswerSelected(1, true)); // Option B (index 1) is wrong
        bloc.add(QuizSubmitted());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(),
        isA<QuizExecutionInProgress>(),
        isA<QuizExecutionCompleted>().having(
          (s) => s.score,
          'score',
          -50.0,
        ), // -0.5 / 1 * 100 = -50%
      ],
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'calculates score correctly with mixed results and penalty',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion, testQuestion], // 2 questions
            quizConfig: const QuizConfig(
              questionCount: 2,
              isStudyMode: false,
              subtractPoints: true,
              penaltyAmount: 0.5,
            ),
          ),
        );
        // Question 1: Correct
        bloc.add(AnswerSelected(0, true));
        // Question 2: Incorrect
        // We probably need to move to next question first?
        // Or if we just add answer, does it affect current question?
        // Wait, AnswerSelected takes optionIndex. It operates on `currentQuestionIndex`.
        // So I must move to next question!
        bloc.add(NextQuestionRequested());
        bloc.add(AnswerSelected(1, true));
        bloc.add(QuizSubmitted());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(),
        isA<QuizExecutionInProgress>(), // Answer 1
        isA<QuizExecutionInProgress>(), // Next Question
        isA<QuizExecutionInProgress>(), // Answer 2
        isA<QuizExecutionCompleted>().having(
          (s) => s.score,
          'score',
          25.0,
        ), // (1 - 0.5) / 2 * 100 = 0.5 / 2 * 100 = 25%
      ],
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'calculates score correctly with unanswered questions (no penalty for unanswered)',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion, testQuestion], // 2 questions
            quizConfig: const QuizConfig(
              questionCount: 2,
              isStudyMode: false,
              subtractPoints: true,
              penaltyAmount: 0.5,
            ),
          ),
        );
        // Question 1: Incorrect
        bloc.add(AnswerSelected(1, true));
        // Question 2: Unanswered
        // Just submit. But wait, if we are at Q1, and submit, does it count Q2?
        // Yes, the loop iterates over all questions.
        bloc.add(QuizSubmitted());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(),
        isA<QuizExecutionInProgress>(), // Answer 1
        isA<QuizExecutionCompleted>().having(
          (s) => s.score,
          'score',
          -25.0,
        ), // (0 - 0.5) / 2 * 100 = -25%
      ],
    );
    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'calculates score correctly WITH penalty in STUDY MODE (penalty should be ignored)',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion],
            quizConfig: const QuizConfig(
              questionCount: 1,
              isStudyMode: true,
              subtractPoints: true,
              penaltyAmount: 0.5,
            ),
          ),
        );
        // Answer incorrectly
        bloc.add(AnswerSelected(1, true)); // Option B (index 1) is wrong
        bloc.add(QuizSubmitted());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(),
        isA<QuizExecutionInProgress>(),
        isA<QuizExecutionCompleted>().having(
          (s) => s.score,
          'score',
          0.0,
        ), // Score should be 0.0, not -50.0
      ],
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'ends quiz when max incorrect answers limit is reached AFTER navigating (EXAM MODE)',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion, testQuestion], // 2 questions
            quizConfig: const QuizConfig(
              questionCount: 2,
              isStudyMode: false,
              enableMaxIncorrectAnswers: true,
              maxIncorrectAnswers: 1,
            ),
          ),
        );
        // Answer incorrectly (limit is 1)
        bloc.add(AnswerSelected(1, true));
        // Should NOT end yet, just update state
        bloc.add(NextQuestionRequested());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(), // Started
        isA<QuizExecutionInProgress>(), // Answered (still in progress)
        isA<QuizExecutionCompleted>().having(
          (s) => s.wasLimitReached,
          'wasLimitReached',
          true,
        ), // Completed after navigation attempt
      ],
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'does NOT end quiz if answer is corrected before navigating (EXAM MODE)',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion, testQuestion], // 2 questions
            quizConfig: const QuizConfig(
              questionCount: 2,
              isStudyMode: false,
              enableMaxIncorrectAnswers: true,
              maxIncorrectAnswers: 1,
            ),
          ),
        );
        // Answer incorrectly (limit is 1)
        bloc.add(AnswerSelected(1, true));

        // Correct the answer (Option A is correct)
        bloc.add(AnswerSelected(0, true));

        // Navigate
        bloc.add(NextQuestionRequested());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(), // Started
        isA<QuizExecutionInProgress>(), // Answered Incorrectly
        isA<QuizExecutionInProgress>(), // Answered Correctly
        isA<QuizExecutionInProgress>(), // Next Question (Success)
      ],
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'does NOT end quiz even if max incorrect answers is reached in STUDY MODE',
      build: () => quizExecutionBloc,
      act: (bloc) {
        bloc.add(
          QuizExecutionStarted(
            [testQuestion, testQuestion], // 2 questions
            quizConfig: const QuizConfig(
              questionCount: 2,
              isStudyMode: true,
              enableMaxIncorrectAnswers: true,
              maxIncorrectAnswers: 1,
            ),
          ),
        );
        // Answer incorrectly
        bloc.add(AnswerSelected(1, true));
        // Verify we are still in progress
        bloc.add(NextQuestionRequested());
      },
      expect: () => [
        isA<QuizExecutionInProgress>(), // Started
        isA<QuizExecutionInProgress>(), // Answered (but still in progress)
        isA<QuizExecutionInProgress>(), // Next question
      ],
    );
  });
}
