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

/// Interface defining error reporting capabilities for quiz-related processes.
abstract class ProcessError {
  /// Whether the operation that produced this error was successful.
  bool get success;

  /// Returns a descriptive error message suitable for direct input validation feedback.
  String getDescriptionForInputError(BuildContext context);

  /// Returns a descriptive error message suitable for file-wide validation reports.
  String getDescriptionForFileError(BuildContext context);
}
