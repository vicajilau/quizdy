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
import 'package:quizlab_ai/domain/models/custom_exceptions/question_error_type.dart';
import 'package:quizlab_ai/domain/models/custom_exceptions/process_error.dart';

/// Implementation of [ProcessError] for question-specific validation issues.
class QuestionError implements ProcessError {
  /// The specific category of the error.
  final QuestionErrorType errorType;

  /// Optional parameters to provide context for the error message.
  final Object? param1;

  /// Optional parameters to provide context for the error message.
  final Object? param2;

  /// Optional parameters to provide context for the error message.
  final Object? param3;

  @override
  final bool success;

  /// Creates a [QuestionError] with the specified [errorType] and metadata.
  QuestionError({
    required this.errorType,
    this.param1,
    this.param2,
    this.param3,
    this.success = false,
  });

  /// Creates a successful [QuestionError] instance.
  QuestionError.success()
    : this(success: true, errorType: QuestionErrorType.emptyText);

  @override
  String getDescriptionForInputError(BuildContext context) {
    switch (errorType) {
      case QuestionErrorType.emptyText:
        return 'Question text cannot be empty';
      case QuestionErrorType.duplicatedText:
        return 'Question text already exists';
      case QuestionErrorType.insufficientOptions:
        return 'Question must have at least 2 options';
      case QuestionErrorType.invalidCorrectAnswers:
        return 'Invalid correct answer indices';
      case QuestionErrorType.emptyOption:
        return 'Option text cannot be empty';
    }
  }

  @override
  String getDescriptionForFileError(BuildContext context) {
    return getDescriptionForInputError(context);
  }
}
