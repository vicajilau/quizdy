import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/repositories/quiz_file_repository.dart';
import 'package:quiz_app/presentation/blocs/file_bloc/file_event.dart';
import 'package:quiz_app/presentation/blocs/file_bloc/file_state.dart';
import 'package:quiz_app/domain/models/quiz/quiz_file.dart';

/// The `FileBloc` class handles file operations such as loading, saving, and picking files.
/// It listens for file-related events and emits the corresponding states based on the outcome of those events.
class FileBloc extends Bloc<FileEvent, FileState> {
  /// The repository responsible for handling file-related operations.
  final QuizFileRepository _fileRepository;

  /// Constructor for `FileBloc` that initializes the state and event handlers.
  ///
  /// - [fileRepository]: An instance of `FileRepository` used to manage file operations.
  FileBloc({required QuizFileRepository fileRepository})
    : _fileRepository = fileRepository,
      super(FileInitial()) {
    // Handling the FileDropped event
    on<FileDropped>((event, emit) async {
      // Check if a file is already loaded
      if (state is FileReplacementRequest) {
        return;
      }

      if (state is FileLoaded || state is FileSaved) {
        try {
          // Identify the current file
          QuizFile currentFile;
          if (state is FileLoaded) {
            currentFile = (state as FileLoaded).quizFile;
          } else {
            currentFile = (state as FileSaved).quizFile;
          }

          // Load the new file to get its metadata/content but DONT emit FileLoaded yet
          emit(FileLoading());
          final newQuizFile = await _fileRepository.loadQuizFileContent(
            event.filePath,
          );

          // Emit replacement request
          emit(
            FileReplacementRequest(
              newFile: newQuizFile,
              currentFile: currentFile,
            ),
          );
        } catch (e) {
          emit(FileError(reason: FileErrorType.errorOpeningFile, error: e));
        }
        return;
      }

      emit(
        FileLoading(),
      ); // Emit loading state while the file is being processed
      try {
        final quizFile = await _fileRepository.loadQuizFile(event.filePath);
        emit(FileLoaded(quizFile)); // Emit the loaded file state
      } catch (e) {
        emit(FileError(reason: FileErrorType.errorOpeningFile, error: e));
      }
    });

    // Handling the CreateQuizMetadata event
    on<CreateQuizMetadata>((event, emit) async {
      emit(
        FileLoading(),
      ); // Emit loading state while the file is being processed
      try {
        final quizFile = await _fileRepository.createQuizFile(
          title: event.name,
          version: event.version,
          author: event.author,
          description: event.description,
        );
        emit(FileLoaded(quizFile)); // Emit the loaded file state after creation
      } catch (e) {
        emit(FileError(reason: FileErrorType.errorOpeningFile, error: e));
      }
    });

    // Handling the CreateQuizWithQuestions event
    on<CreateQuizWithQuestions>((event, emit) async {
      emit(
        FileLoading(),
      ); // Emit loading state while the file is being processed
      try {
        final quizFile = await _fileRepository.createQuizFile(
          title: event.name,
          version: event.version,
          author: event.author,
          description: event.description,
          questions: event.questions,
        );
        emit(FileLoaded(quizFile)); // Emit the loaded file state
      } catch (e) {
        emit(FileError(reason: FileErrorType.errorOpeningFile, error: e));
      }
    });

    // Handling the QuizFileSaveRequested event
    on<QuizFileSaveRequested>((event, emit) async {
      emit(FileLoading()); // Emit loading state while saving the file
      try {
        // Save the `QuizFile` and update the state with the saved file
        final quizFile = await _fileRepository.saveQuizFile(
          event.quizFile,
          event.dialogTitle,
          event.fileName,
        );
        if (quizFile != null) {
          // Use the returned quizFile with updated path instead of modifying the event
          emit(FileSaved(quizFile));
        }
      } catch (e) {
        emit(FileError(reason: FileErrorType.errorSavingQuizFile, error: e));
      }
    });

    // Handling the QuizFileReset event
    on<QuizFileReset>((event, emit) async {
      emit(FileInitial()); // Emit initial state after reset
    });

    // Handling the QuizFilePickRequested event
    on<QuizFilePickRequested>((event, emit) async {
      // Check if a file is already loaded
      if (state is FileLoaded || state is FileSaved) {
        try {
          QuizFile currentFile;
          if (state is FileLoaded) {
            currentFile = (state as FileLoaded).quizFile;
          } else {
            currentFile = (state as FileSaved).quizFile;
          }

          final newQuizFile = await _fileRepository.pickFileContent();
          if (newQuizFile != null) {
            emit(
              FileReplacementRequest(
                newFile: newQuizFile,
                currentFile: currentFile,
              ),
            );
          }
        } catch (e) {
          emit(FileError(reason: FileErrorType.errorOpeningFile, error: e));
        }
        return;
      }

      emit(FileLoading()); // Emit loading state while picking the file
      try {
        final quizFile = await _fileRepository.pickFileManually();
        if (quizFile != null) {
          emit(FileLoaded(quizFile)); // Emit the loaded file state if picked
        } else {
          emit(FileInitial()); // Emit initial state if no file is picked
        }
      } catch (e) {
        emit(FileError(reason: FileErrorType.errorOpeningFile, error: e));
      }
    });

    on<ConfirmFileReplacement>((event, emit) {
      debugPrint('FileBloc: ConfirmFileReplacement received');
      if (state is FileReplacementRequest) {
        final newFile = (state as FileReplacementRequest).newFile;
        _fileRepository.registerQuizFile(newFile);
        emit(FileLoaded(newFile));
      } else {
        debugPrint('FileBloc: ConfirmFileReplacement ignored (state: $state)');
      }
    });

    on<CancelFileReplacement>((event, emit) {
      debugPrint('FileBloc: CancelFileReplacement received');
      if (state is FileReplacementRequest) {
        emit(FileLoaded((state as FileReplacementRequest).currentFile));
      } else {
        debugPrint('FileBloc: CancelFileReplacement ignored (state: $state)');
      }
    });
  }
}
