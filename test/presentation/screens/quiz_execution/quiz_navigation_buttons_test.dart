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
import 'package:mocktail/mocktail.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/quiz_navigation_buttons.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';

class MockQuizExecutionBloc
    extends MockBloc<QuizExecutionEvent, QuizExecutionState>
    implements QuizExecutionBloc {}

class FakeQuizExecutionEvent extends Fake implements QuizExecutionEvent {}

void main() {
  late MockQuizExecutionBloc mockBloc;

  setUp(() {
    mockBloc = MockQuizExecutionBloc();
    registerFallbackValue(FakeQuizExecutionEvent());
  });

  Widget createWidgetUnderTest(QuizExecutionInProgress state) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider<QuizExecutionBloc>.value(
        value: mockBloc,
        child: Scaffold(
          body: QuizNavigationButtons(
            state: state,
            isStudyMode: state.isStudyMode,
          ),
        ),
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

  group('QuizNavigationButtons - Exam Mode', () {
    testWidgets('shows Skip button when question is NOT answered', (
      tester,
    ) async {
      final state = QuizExecutionInProgress(
        questions: [testQuestion, testQuestion],
        currentQuestionIndex: 0,
        userAnswers: {},
        quizConfig: const QuizConfig(questionCount: 2, isStudyMode: false),
      );

      await tester.pumpWidget(createWidgetUnderTest(state));
      await tester.pumpAndSettle();

      // Verify "Skip" icon first (easier to match than text if localization issues)
      expect(
        find.byIcon(Icons.skip_next),
        findsOneWidget,
        reason: 'Skip icon not found',
      );
      expect(find.text('Skip'), findsOneWidget, reason: 'Skip text not found');

      // Verify functionality
      await tester.tap(find.text('Skip'));
      verify(
        () => mockBloc.add(any(that: isA<NextQuestionRequested>())),
      ).called(1);
    });

    testWidgets('shows Next button when question IS answered', (tester) async {
      final state = QuizExecutionInProgress(
        questions: [testQuestion, testQuestion],
        currentQuestionIndex: 0,
        userAnswers: {
          0: [0],
        },
        quizConfig: const QuizConfig(questionCount: 2, isStudyMode: false),
      );

      expect(
        state.hasCurrentQuestionAnswered,
        isTrue,
        reason: 'State should be answered',
      );

      await tester.pumpWidget(createWidgetUnderTest(state));
      await tester.pumpAndSettle();

      // Verify "Next" icon first
      expect(
        find.byIcon(Icons.chevron_right),
        findsOneWidget,
        reason: 'Next icon not found',
      );
      expect(find.text('Next'), findsOneWidget, reason: 'Next text not found');

      // Verify functionality
      await tester.tap(find.text('Next'));
      verify(
        () => mockBloc.add(any(that: isA<NextQuestionRequested>())),
      ).called(1);
    });
  });
}
