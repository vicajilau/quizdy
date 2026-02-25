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

import 'package:flutter_test/flutter_test.dart';
import 'package:quizlab_ai/data/services/quiz_service.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';

void main() {
  group('QuizService Randomization Tests', () {
    test(
      'randomizeAnswerOptions preserves correct answers with duplicate texts',
      () {
        final question = const Question(
          type: QuestionType.multipleChoice,
          text: 'Test question with duplicate options',
          options: ['A', 'A', 'B', 'B'],
          correctAnswers: [0, 2], // First 'A' and first 'B' are correct
          explanation: 'Some explanation',
        );

        // Run multiple times to ensure we hit different shuffles
        for (int i = 0; i < 10; i++) {
          final randomized = QuizService.randomizeAnswerOptions(question);

          expect(randomized.options.length, 4);
          expect(randomized.correctAnswers.length, 2);

          // Verify that the text at the new correct indices matches the expected text
          for (final correctIndex in randomized.correctAnswers) {
            final optionText = randomized.options[correctIndex];
            // Either it's 'A' or 'B', and it should match an originally correct one
            expect(['A', 'B'].contains(optionText), true);
          }

          // Verify that the mapping is consistent
          // Since we had two As and two Bs, and one of each was correct,
          // we should still have one correct A and one correct B.
          final correctTexts = randomized.correctAnswers
              .map((idx) => randomized.options[idx])
              .toList();
          expect(correctTexts.where((t) => t == 'A').length, 1);
          expect(correctTexts.where((t) => t == 'B').length, 1);
        }
      },
    );

    test(
      'randomizeAnswerOptions preserves correct answers for simple case',
      () {
        final question = const Question(
          type: QuestionType.singleChoice,
          text: 'What is 1+1?',
          options: ['1', '2', '3', '4'],
          correctAnswers: [1], // '2' is correct
          explanation: 'Basic math',
        );

        for (int i = 0; i < 10; i++) {
          final randomized = QuizService.randomizeAnswerOptions(question);
          final correctIndex = randomized.correctAnswers.first;
          expect(randomized.options[correctIndex], '2');
        }
      },
    );
  });
}
