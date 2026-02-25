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
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';

void main() {
  group('QuizExecutionBloc User Scenario', () {
    late QuizExecutionBloc quizExecutionBloc;

    setUp(() {
      quizExecutionBloc = QuizExecutionBloc();
    });

    tearDown(() {
      quizExecutionBloc.close();
    });

    final testQuestion = const Question(
      text: 'Question',
      type: QuestionType.singleChoice,
      options: ['A', 'B'],
      correctAnswers: [0],
      explanation: 'Explanation',
    );

    blocTest<QuizExecutionBloc, QuizExecutionState>(
      'reproduces user scenario: 10 questions, 3 correct, 3 incorrect, 0.1 penalty',
      build: () => quizExecutionBloc,
      act: (bloc) {
        final questions = List.generate(10, (_) => testQuestion);
        bloc.add(
          QuizExecutionStarted(
            questions,
            quizConfig: const QuizConfig(
              questionCount: 10,
              isStudyMode: false,
              subtractPoints: true,
              penaltyAmount: 0.1,
            ),
          ),
        );

        // 3 correct (Indices 0, 1, 2)
        for (int i = 0; i < 3; i++) {
          bloc.add(JumpToQuestionRequested(i));
          bloc.add(AnswerSelected(0, true)); // Correct
        }

        // 3 incorrect (Indices 3, 4, 5)
        for (int i = 3; i < 6; i++) {
          bloc.add(JumpToQuestionRequested(i));
          bloc.add(AnswerSelected(1, true)); // Incorrect
        }

        // 4 skipped (Indices 6, 7, 8, 9) - no actions needed

        bloc.add(QuizSubmitted());
      },
      expect: () => [
        // Using a more flexible expectation to avoid exact count of intermediate states
        ...List.generate(13, (_) => isA<QuizExecutionInProgress>()),
        isA<QuizExecutionCompleted>()
            .having((s) => s.correctAnswers, 'correctAnswers', 3)
            .having((s) => s.score, 'score', 27.0),
      ],
      verify: (bloc) {
        final state = bloc.state;
        expect(state, isA<QuizExecutionCompleted>());
        final completed = state as QuizExecutionCompleted;
        expect(completed.correctAnswers, 3);
        // score is (3 - 3 * 0.1) / 10 * 100 = 2.7 / 10 * 100 = 27.0
        expect(completed.score, 27.0);
      },
    );
  });
}
