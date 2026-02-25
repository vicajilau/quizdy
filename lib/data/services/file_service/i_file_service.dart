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

import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';

/// Interface for file handling services, defining methods for reading,
/// saving, and exporting `.quiz` files across different platforms.
abstract class IFileService {
  /// Stores an original copy of the `QuizFile` to track changes.
  QuizFile? originalFile;

  /// Reads a `.quiz` file from the specified [filePath] and returns a `QuizFile` object.
  ///
  /// - Throws a [FileInvalidException] if the file does not have a `.quiz` extension.
  /// - [filePath]: The path to the `.quiz` file.
  /// - Returns: A `QuizFile` object containing the parsed data from the file.
  Future<QuizFile> readQuizFile(String filePath);

  /// Reads a `.quiz` file from the specified [filePath] WITHOUT updating the original file state.
  ///
  /// This is useful for previewing files without committing them as the "active" file.
  ///
  /// - [filePath]: The path to the `.quiz` file.
  /// - Returns: A `QuizFile` object containing the parsed data from the file.
  Future<QuizFile> readQuizFileContent(String filePath);

  /// Saves a `QuizFile` object to the file system.
  ///
  /// Opens a save dialog for the user to choose the file path and writes
  /// the `QuizFile` data in JSON format to the selected file.
  ///
  /// - [quizFile]: The `QuizFile` object to save.
  /// - [dialogTitle]: The title for the save dialog window.
  /// - [fileName]: The name of the file.
  /// - Returns: The `QuizFile` object with an updated file path if the user selects a path.
  Future<QuizFile?> saveQuizFile(
    QuizFile quizFile,
    String dialogTitle,
    String fileName,
  );

  /// Opens a file picker dialog for the user to select a `.quiz` file.
  ///
  /// If a valid file is selected, it reads and parses the file into a `QuizFile` object.
  ///
  /// - Returns: A `QuizFile` object if a valid file is selected, or `null` if no file is selected.
  Future<QuizFile?> pickFile();

  /// Opens a file picker dialog for the user to select a `.quiz` file WITHOUT updating original file state.
  ///
  /// - Returns: A `QuizFile` object if a valid file is selected, or `null` if no file is selected.
  Future<QuizFile?> pickFileContent();
}
