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
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_metadata.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';

void main() {
  test('QuizFile deepCopy equality test', () {
    final metadata = const QuizMetadata(
      title: 'Test Quiz',
      description: 'Description',
      version: '1.0',
      author: 'Author',
    );

    final question = const Question(
      type: QuestionType.multipleChoice,
      text: 'Question 1',
      options: ['A', 'B'],
      correctAnswers: [0],
      explanation: 'Exp',
      isEnabled: true,
    );

    final file = QuizFile(
      metadata: metadata,
      questions: [question],
      filePath: '/path/to/file.quiz',
    );

    final copy = file.deepCopy();

    expect(
      file == copy,
      isTrue,
      reason: 'File and its deep copy should be equal',
    );
    expect(
      file.hashCode == copy.hashCode,
      isTrue,
      reason: 'HashCodes should be equal',
    );

    // Test with modified copy
    final modified = copy.copyWith(filePath: '/path/to/other.quiz');
    expect(
      file == modified,
      isFalse,
      reason: 'Modified file should not be equal',
    );
  });

  test('Question equality test', () {
    final q1 = const Question(
      type: QuestionType.multipleChoice,
      text: 'Q',
      options: ['A'],
      correctAnswers: [0],
      explanation: 'E',
    );

    final q2 = const Question(
      type: QuestionType.multipleChoice,
      text: 'Q',
      options: ['A'],
      correctAnswers: [0],
      explanation: 'E',
    );

    expect(q1 == q2, isTrue);
    expect(q1.hashCode == q2.hashCode, isTrue);
  });
}
