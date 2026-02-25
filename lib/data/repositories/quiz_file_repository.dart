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

import 'package:quizlab_ai/core/debug_print.dart';
import 'package:quizlab_ai/core/service_locator.dart';
import 'package:quizlab_ai/data/services/file_service/i_file_service.dart';

import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_metadata.dart';

/// The `QuizFileRepository` class manages file-related operations such as loading, saving,
/// and selecting quiz files. It delegates these tasks to an instance of `FileService`.
class QuizFileRepository {
  /// Instance of `IFileService` to handle file operations.
  final IFileService _fileService;

  /// Constructor to initialize `QuizFileRepository` with a `FileService` instance.
  /// This allows for the delegation of file-related tasks.
  ///
  /// - [fileService]: The `FileService` instance that handles file operations.
  QuizFileRepository({required IFileService fileService})
    : _fileService = fileService;

  /// Loads a `QuizFile` from a file at the specified [filePath].
  /// This method calls `readQuizFile` from `QuizFileService` to read the file,
  /// and then registers the loaded file in the service locator.
  ///
  /// - [filePath]: The path to the file to load.
  /// - Returns: A `Future<QuizFile>` containing the loaded `QuizFile`.
  /// - Throws: An exception if there is an error loading the file.
  Future<QuizFile> loadQuizFile(String filePath) async {
    final quizFile = await _fileService.readQuizFile(filePath);
    ServiceLocator.instance.registerQuizFile(quizFile);
    return quizFile;
  }

  /// Creates a new `QuizFile` with the specified metadata.
  /// The method generates a new `QuizFile` with the provided metadata.
  ///
  /// - [title]: The title for the new `QuizFile`.
  /// - [description]: The description for the new `QuizFile`.
  /// - [version]: The version for the new `QuizFile`.
  /// - [author]: The author for the new `QuizFile`.
  /// - Returns: A `Future<QuizFile>` containing the created `QuizFile`.
  Future<QuizFile> createQuizFile({
    required String title,
    required String description,
    required String version,
    required String author,
    List<Question>? questions,
  }) async {
    final metadata = QuizMetadata(
      title: title,
      description: description,
      version: version,
      author: author,
    );

    final quizFile = QuizFile(
      metadata: metadata,
      questions: questions ?? [], // Start with empty questions or provided ones
    );

    ServiceLocator.instance.registerQuizFile(quizFile);
    return quizFile;
  }

  /// Saves a `QuizFile` to the file system.
  /// This method calls `saveQuizFile` from `QuizFileService` to save the file.
  ///
  /// - [quizFile]: The `QuizFile` to save.
  /// - [dialogTitle]: The title for the save dialog.
  /// - [fileName]: The name of the file.
  /// - Returns: A `Future<QuizFile?>` containing the saved `QuizFile` with updated path, or `null` if cancelled.
  Future<QuizFile?> saveQuizFile(
    QuizFile quizFile,
    String dialogTitle,
    String fileName,
  ) async {
    final savedFile = await _fileService.saveQuizFile(
      quizFile,
      dialogTitle,
      fileName,
    );
    if (savedFile != null) {
      ServiceLocator.instance.registerQuizFile(savedFile);
    }
    return savedFile;
  }

  /// Opens a file picker for the user to select a quiz file.
  /// This method calls `pickFile` from `QuizFileService` to open the file picker.
  ///
  /// - Returns: A `Future<QuizFile?>` containing the selected `QuizFile`, or `null` if no file is selected.
  Future<QuizFile?> pickFile() async {
    final quizFile = await _fileService.pickFile();
    if (quizFile != null) {
      ServiceLocator.instance.registerQuizFile(quizFile);
    }
    return quizFile;
  }

  /// Picks a file manually using the file picker dialog.
  /// This method delegates the task of selecting a file to the `_fileService`'s
  /// `pickFile` method, and registers the selected file in the service locator.
  ///
  /// - Returns: A `Future<QuizFile?>` containing the selected `QuizFile`, or `null` if no file was selected.
  /// Loads a `QuizFile` from a file at the specified [filePath] WITHOUT registering it.
  ///
  /// - [filePath]: The path to the file to load.
  /// - Returns: A `Future<QuizFile>` containing the loaded `QuizFile`.
  Future<QuizFile> loadQuizFileContent(String filePath) async {
    return await _fileService.readQuizFileContent(filePath);
  }

  /// Registers a `QuizFile` as the active file in the system.
  void registerQuizFile(QuizFile quizFile) {
    ServiceLocator.instance.registerQuizFile(quizFile);
    // Also update the originalFile in fileService to match this new file
    // This is crucial because readQuizFileContent doesn't update it.
    _fileService.originalFile = quizFile.deepCopy();
  }

  /// Picks a file manually using the file picker dialog WITHOUT registering it.
  ///
  /// - Returns: A `Future<QuizFile?>` containing the selected `QuizFile`, or `null`.
  Future<QuizFile?> pickFileContent() async {
    // We need to access pickFile from service but service.pickFile() calls readQuizFile() which has side effects?
    // Wait, service.pickFile calls readQuizFile.
    // I need to update service.pickFile to use readQuizFileContent if possible?
    // Or just let pickFile have side effects and refactor service.pickFile?
    // Let's look at service.pickFile implementation again.
    // IT CALLS readQuizFile. So it has side effects.

    // I should refactor service.pickFile to NOT have side effects?
    // But pickFile is "open file".
    // I need a pickFileContent in service too?
    return await _fileService.pickFileContent();
  }

  /// Picks a file manually using the file picker dialog.
  ///
  /// - Returns: A `Future<QuizFile?>` containing the selected `QuizFile`, or `null` if no file was selected.
  Future<QuizFile?> pickFileManually() async {
    final quizFile = await _fileService.pickFile();
    if (quizFile != null) {
      ServiceLocator.instance.registerQuizFile(quizFile);
    }
    return quizFile;
  }

  /// Checks if a `QuizFile` has changed by comparing the current file content
  /// with the cached version of the file. This method reads the original file
  /// content from [filePath] and compares it with the [cachedQuizFile].
  ///
  /// - [filePath]: The path to the file to check.
  /// - [cachedQuizFile]: The cached version of the `QuizFile` for comparison.
  /// - Returns: A `Future<bool>` indicating whether the file content has changed (`true`) or not (`false`).
  bool hasQuizFileChanged(QuizFile cachedQuizFile) {
    if (cachedQuizFile.filePath == null) return true;

    final originalFile = _fileService.originalFile;
    if (originalFile == null) return true;

    final hasChanged = originalFile != cachedQuizFile;
    printInDebug(
      'File changed: $hasChanged (Original questions: ${originalFile.questions.length}, Cached questions: ${cachedQuizFile.questions.length})',
    );

    return hasChanged;
  }
}
