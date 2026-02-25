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

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/quiz_question_options.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/question_option_tile.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';

class FakeQuizExecutionBloc extends Bloc<QuizExecutionEvent, QuizExecutionState>
    implements QuizExecutionBloc {
  FakeQuizExecutionBloc(super.initialState);
}

void main() {
  testWidgets('QuizQuestionOptions renders options correctly', (
    WidgetTester tester,
  ) async {
    // Setup data
    const question = Question(
      type: QuestionType.singleChoice,
      text: 'Test Question',
      options: ['Option A', 'Option B'],
      correctAnswers: [0],
      explanation: 'Explanation',
    );

    final state = QuizExecutionInProgress(
      questions: [question],
      currentQuestionIndex: 0,
      userAnswers: {},
      quizConfig: const QuizConfig(questionCount: 1, isStudyMode: false),
    );

    final bloc = FakeQuizExecutionBloc(state);

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en')],
        home: BlocProvider<QuizExecutionBloc>.value(
          value: bloc,
          child: Material(child: QuizQuestionOptions(state: state)),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify QuestionOptionTile are present
    expect(find.byType(QuestionOptionTile), findsNWidgets(2));
    expect(find.text('Option A'), findsOneWidget);
    expect(find.text('Option B'), findsOneWidget);
  });
}
