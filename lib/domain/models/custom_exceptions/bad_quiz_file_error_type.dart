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

/// Enumeration representing different types of errors that can occur when processing a Quiz file.
enum BadQuizFileErrorType {
  /// Indicates that the extension file is not .quiz.
  invalidExtension,

  /// Indicates that the format of the Quiz file is invalid.
  invalidFormat,

  /// Indicates that the Quiz file version is not supported.
  unsupportedVersion,

  /// Indicates that the Quiz file contains invalid question data.
  invalidQuestionData,
}
