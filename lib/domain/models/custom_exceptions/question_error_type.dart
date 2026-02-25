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

/// Types of validation errors that can occur within a question.
enum QuestionErrorType {
  /// The question text is empty or only contains whitespace.
  emptyText,

  /// The question text is exactly the same as another question's text.
  duplicatedText,

  /// The question does not have enough options to be valid.
  insufficientOptions,

  /// The selected correct answer indices are out of range or inconsistent.
  invalidCorrectAnswers,

  /// One or more option texts are empty.
  emptyOption,
}
