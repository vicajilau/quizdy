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
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/submit_quiz_dialog.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';

class MockQuizExecutionBloc
    extends MockBloc<QuizExecutionEvent, QuizExecutionState>
    implements QuizExecutionBloc {}

void main() {
  late MockQuizExecutionBloc mockBloc;

  setUp(() {
    mockBloc = MockQuizExecutionBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () => SubmitQuizDialog.show(context, mockBloc),
              child: const Text('Show Dialog'),
            ),
          ),
        ),
      ),
    );
  }

  final testQuestion = const Question(
    text: 'Test Question',
    type: QuestionType.singleChoice,
    options: ['Option A', 'Option B'],
    correctAnswers: [0],
    explanation: 'Explanation',
  );

  testWidgets('shows standard confirmation when all questions are answered', (
    tester,
  ) async {
    final state = QuizExecutionInProgress(
      questions: [testQuestion],
      currentQuestionIndex: 0,
      userAnswers: {
        0: [0],
      }, // Answered
      quizConfig: const QuizConfig(questionCount: 1, isStudyMode: false),
    );
    when(() => mockBloc.state).thenReturn(state);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Are you sure you want to finish the quiz? You won\'t be able to change your answers afterwards.',
      ),
      findsOneWidget,
    );
    expect(find.textContaining('unanswered'), findsNothing);
  });

  testWidgets('shows warning when there are unanswered questions', (
    tester,
  ) async {
    final state = QuizExecutionInProgress(
      questions: [testQuestion, testQuestion], // 2 questions
      currentQuestionIndex: 0,
      userAnswers: {
        0: [0],
      }, // Only 1 answered
      quizConfig: const QuizConfig(questionCount: 2, isStudyMode: false),
    );
    when(() => mockBloc.state).thenReturn(state);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // "You have 1 unanswered question. Are you sure..."
    expect(
      find.textContaining('You have 1 unanswered question'),
      findsOneWidget,
    );
  });

  testWidgets('shows warning with plural when multiple unanswered questions', (
    tester,
  ) async {
    final state = QuizExecutionInProgress(
      questions: [testQuestion, testQuestion, testQuestion], // 3 questions
      currentQuestionIndex: 0,
      userAnswers: {}, // 0 answered
      quizConfig: const QuizConfig(questionCount: 3, isStudyMode: false),
    );
    when(() => mockBloc.state).thenReturn(state);

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // "You have 3 unanswered questions. Are you sure..."
    expect(
      find.textContaining('You have 3 unanswered questions'),
      findsOneWidget,
    );
  });
}
