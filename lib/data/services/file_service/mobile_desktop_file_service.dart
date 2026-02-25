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

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:platform_detail/platform_detail.dart';
import 'package:quizlab_ai/data/services/file_service/i_file_service.dart';
import 'package:quizlab_ai/domain/models/custom_exceptions/bad_quiz_file_exception.dart';

import 'package:quizlab_ai/domain/models/custom_exceptions/bad_quiz_file_error_type.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';

/// The `QuizFileService` class provides functionalities for managing `.quiz` files.
/// This includes reading a `.quiz` file, saving a `QuizFile` object to the file system,
/// and interacting with the user for file selection.
class QuizFileService implements IFileService {
  @override
  QuizFile? originalFile;

  /// Reads a `.quiz` file from the specified [filePath] and parses it into a `QuizFile` object.
  ///
  /// Throws a [BadQuizFileException] if the file does not have a `.quiz` extension.
  ///
  /// - [filePath]: The path to the `.quiz` file.
  /// - Returns: A `QuizFile` object containing the parsed data from the file.
  /// - Throws: [BadQuizFileException] if the file extension is invalid.
  @override
  @override
  Future<QuizFile> readQuizFile(String filePath) async {
    final quizFile = await readQuizFileContent(filePath);
    originalFile = quizFile.deepCopy();
    return quizFile;
  }

  /// Reads a `.quiz` file from the specified [filePath] and parses it into a `QuizFile` object.
  ///
  /// Throws a [BadQuizFileException] if the file does not have a `.quiz` extension.
  ///
  /// - [filePath]: The path to the `.quiz` file.
  /// - Returns: A `QuizFile` object containing the parsed data from the file.
  /// - Throws: [BadQuizFileException] if the file extension is invalid.
  @override
  Future<QuizFile> readQuizFileContent(String filePath) async {
    if (!filePath.endsWith('.quiz')) {
      throw const BadQuizFileException(
        type: BadQuizFileErrorType.invalidExtension,
      );
    }
    // Create a File object for the provided file path
    final file = File(filePath);
    // Read the file content as a string
    final content = await file.readAsString();

    // Decode the string content into a Map and convert it to a QuizFile object
    final json = jsonDecode(content) as Map<String, dynamic>;
    final quizFile = QuizFile.fromJson(json, filePath: filePath);
    return quizFile;
  }

  /// Saves a `QuizFile` object to the file system.
  ///
  /// This method opens a save dialog for the user to choose the file path
  /// and writes the `QuizFile` data in JSON format to the selected file.
  ///
  /// - [quizFile]: The `QuizFile` object to save.
  /// - [dialogTitle]: The title for the save dialog.
  /// - [fileName]: The name of the file.
  /// - Returns: The `QuizFile` object with the updated file path, or `null` if the user cancels.
  @override
  Future<QuizFile?> saveQuizFile(
    QuizFile quizFile,
    String dialogTitle,
    String fileName,
  ) async {
    final content = jsonEncode(quizFile.toJson());
    final bytes = Uint8List.fromList(utf8.encode(content));

    final String sanitizedFileName = fileName
        .split(Platform.pathSeparator)
        .last;

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: dialogTitle,
      fileName: sanitizedFileName,
      allowedExtensions: ['quiz'],
      type: FileType.custom,
      bytes: bytes,
    );

    if (outputFile != null) {
      // On mobile platforms (Android/iOS), FilePicker.saveFile() with bytes parameter
      // already saves the file, so we don't need to write it manually.
      // On desktop platforms, we need to write the file manually.
      if (PlatformDetail.isDesktop) {
        final file = File(outputFile);
        await file.writeAsString(content);
      }

      // Create updated quiz file with new path
      final updatedQuizFile = quizFile.copyWith(filePath: outputFile);

      // Update the original file reference to be the newly saved file
      // This ensures that the saved file becomes the new baseline for change detection
      originalFile = updatedQuizFile.deepCopy();

      return updatedQuizFile;
    }
    return null;
  }

  /// Opens a file picker dialog for the user to select a `.quiz` file.
  ///
  /// If a valid file is selected, it reads and parses the file into a `QuizFile` object.
  ///
  /// - Returns: A `QuizFile` object if a valid file is selected, or `null` if no file is selected.
  @override
  Future<QuizFile?> pickFile() async {
    final file = await pickFileContent();
    if (file != null) {
      originalFile = file.deepCopy();
    }
    return file;
  }

  /// Opens a file picker dialog for the user to select a `.quiz` file WITHOUT updating original file state.
  ///
  /// - Returns: A `QuizFile` object if a valid file is selected, or `null` if no file is selected.
  @override
  Future<QuizFile?> pickFileContent() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['quiz'],
      allowMultiple: false,
    );

    if (result != null) {
      final platformFile = result.files.first;

      if (platformFile.path != null) {
        return await readQuizFileContent(platformFile.path!);
      }
    }
    return null;
  }
}
