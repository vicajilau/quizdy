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

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/quiz_progress_indicator.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';

class MockQuizExecutionBloc
    extends MockBloc<QuizExecutionEvent, QuizExecutionState>
    implements QuizExecutionBloc {}

void main() {
  late MockQuizExecutionBloc mockBloc;

  setUp(() {
    mockBloc = MockQuizExecutionBloc();
  });

  Widget createWidgetUnderTest(QuizExecutionInProgress state) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<QuizExecutionBloc>.value(
        value: mockBloc,
        child: Scaffold(body: QuizProgressIndicator(state: state)),
      ),
    );
  }

  final testQuestion = const Question(
    text: 'Test Question',
    type: QuestionType.singleChoice,
    options: ['Option 1', 'Option 2'],
    correctAnswers: [0],
    explanation: 'Test Explanation',
  );

  group('QuizProgressIndicator', () {
    testWidgets('is tappable and shows tooltip in Exam Mode', (tester) async {
      final state = QuizExecutionInProgress(
        questions: [testQuestion],
        currentQuestionIndex: 0,
        userAnswers: {},
        quizConfig: const QuizConfig(questionCount: 1, isStudyMode: false),
      );

      await tester.pumpWidget(createWidgetUnderTest(state));

      // Find the GestureDetector
      final gestureDetectorFinder = find.descendant(
        of: find.byType(Tooltip),
        matching: find.byType(GestureDetector),
      );
      expect(gestureDetectorFinder, findsOneWidget);

      final GestureDetector gestureDetector = tester.widget(
        gestureDetectorFinder,
      );
      expect(
        gestureDetector.onTap,
        isNotNull,
        reason: 'onTap should not be null in Exam Mode',
      );

      // Verify Tooltip message
      final tooltipFinder = find.byType(Tooltip);
      final Tooltip tooltip = tester.widget(tooltipFinder);
      expect(
        tooltip.message,
        equals('Questions Map'),
      ); // Hardcoded english string 'Questions Overview' -> 'Questions Map' in localizations?
      // Wait, let's check AppLocalizations. 'Questions Map' is the EN string for questionsOverview.
      // But we are running with context, so it should resolve.
    });

    testWidgets('progress bar reflects answered questions count', (
      tester,
    ) async {
      // Create state with 10 questions, 3 answered
      final questions = List.generate(10, (_) => testQuestion);
      final userAnswers = {
        0: [0], // Answered
        1: [0], // Answered
        2: [0], // Answered
      };

      final state = QuizExecutionInProgress(
        questions: questions,
        currentQuestionIndex: 5, // Currently at question 6
        userAnswers: userAnswers,
        quizConfig: const QuizConfig(questionCount: 10, isStudyMode: false),
      );

      await tester.pumpWidget(createWidgetUnderTest(state));

      // Verify progress value
      final progressIndicatorFinder = find.byType(LinearProgressIndicator);
      final LinearProgressIndicator progressIndicator = tester.widget(
        progressIndicatorFinder,
      );

      // Should be 3/10 = 0.3
      expect(progressIndicator.value, closeTo(0.3, 0.001));

      // Verify text says "Question 6 of 10" (current index + 1)
      expect(find.text('Question 6 of 10'), findsOneWidget);
    });
  });
}
