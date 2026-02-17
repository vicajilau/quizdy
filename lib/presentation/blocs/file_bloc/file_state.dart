import 'package:flutter/material.dart';
import 'package:quiz_app/domain/models/quiz/quiz_file.dart';

import 'package:quiz_app/core/l10n/app_localizations.dart';

/// Abstract class representing the base state for file operations.
abstract class FileState {}

/// Initial state when no file operation is in progress.
class FileInitial extends FileState {}

/// State representing that a file operation is currently loading.
class FileLoading extends FileState {}

/// State representing a successfully loaded file, containing the file data and path.
class FileLoaded extends FileState {
  final QuizFile quizFile; // The loaded QuizFile object

  FileLoaded(this.quizFile);
}

/// State representing a successfully saved file, containing the saved file data.
class FileSaved extends FileState {
  final QuizFile quizFile; // The saved QuizFile object

  FileSaved(this.quizFile);
}

/// State when a file replacement is requested (user tries to open a new file while one is loaded).
class FileReplacementRequest extends FileState {
  final QuizFile newFile; // The new file attempting to be loaded
  final QuizFile currentFile; // The currently loaded file

  FileReplacementRequest({required this.newFile, required this.currentFile});
}

/// State representing an error during file operation, with an error message.
class FileError extends FileState {
  final FileErrorType reason; // The specific reason for the error
  final Object error; // The underlying error object

  FileError({required this.reason, required this.error});

  String getDescription(BuildContext context) {
    switch (reason) {
      case FileErrorType.errorOpeningFile:
        return AppLocalizations.of(context)!.errorOpeningFile;
      case FileErrorType.errorSavingQuizFile:
        return AppLocalizations.of(context)!.errorSavingFile;
      case FileErrorType.invalidExtension:
        return AppLocalizations.of(context)!.errorInvalidFile;
      case FileErrorType.errorSavingExportedFile:
        return AppLocalizations.of(
          context,
        )!.errorExportingFile(error.toString());
      case FileErrorType.errorPickingFileManually:
        return AppLocalizations.of(context)!.errorLoadingFile(error.toString());
    }
  }
}

/// Enumeration representing specific reasons for file-related errors.
enum FileErrorType {
  /// The file has an unsupported or incorrect extension.
  invalidExtension,

  /// There was an error while trying to open the file.
  errorOpeningFile,

  /// There was an error while trying to save the Quiz file.
  errorSavingQuizFile,

  /// There was an error while trying to save the exported file.
  errorSavingExportedFile,

  /// There was an error while trying to pick the file.
  errorPickingFileManually,
}
