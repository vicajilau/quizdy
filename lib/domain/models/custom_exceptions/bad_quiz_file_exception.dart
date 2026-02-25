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

import 'package:quizlab_ai/domain/models/custom_exceptions/bad_quiz_file_error_type.dart';

/// Exception thrown when there are issues with a Quiz file.
class BadQuizFileException implements Exception {
  /// The type of error that occurred.
  final BadQuizFileErrorType type;

  /// Additional error message providing more details.
  final String? message;

  /// Constructor for creating a `BadQuizFileException`.
  ///
  /// - [type]: The type of error that occurred.
  /// - [message]: Optional additional error message.
  const BadQuizFileException({required this.type, this.message});

  @override
  String toString() {
    String baseMessage;
    switch (type) {
      case BadQuizFileErrorType.invalidExtension:
        baseMessage =
            'Invalid file extension. The file must have a .quiz extension.';
        break;
      case BadQuizFileErrorType.invalidFormat:
        baseMessage =
            'Invalid Quiz file format. The file structure is incorrect.';
        break;
      case BadQuizFileErrorType.unsupportedVersion:
        baseMessage = 'Unsupported Quiz file version.';
        break;
      case BadQuizFileErrorType.invalidQuestionData:
        baseMessage = 'Invalid question data in the Quiz file.';
        break;
    }

    if (message != null) {
      return '$baseMessage Details: $message';
    }
    return baseMessage;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BadQuizFileException &&
        other.type == type &&
        other.message == message;
  }

  @override
  int get hashCode => type.hashCode ^ message.hashCode;
}
