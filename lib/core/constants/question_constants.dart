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

/// Constants for question-related functionality
class QuestionConstants {
  // Default options for true/false questions
  // These are used in the data layer and should remain consistent for file compatibility
  static const String defaultTrueOption = 'True';
  static const String defaultFalseOption = 'False';

  static const List<String> defaultTrueFalseOptions = [
    defaultTrueOption,
    defaultFalseOption,
  ];
}
