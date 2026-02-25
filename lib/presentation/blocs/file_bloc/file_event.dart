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

import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';

/// Abstract class representing the base event for file operations.
abstract class FileEvent {}

/// Event triggered when a file is dropped into the application.
class FileDropped extends FileEvent {
  final String filePath; // Path of the dropped file
  FileDropped(this.filePath);
}

/// Event triggered when a file save is requested, with the file path and data.
class QuizFileSaveRequested extends FileEvent {
  QuizFile quizFile; // The QuizFile object to be saved
  final String dialogTitle;
  final String fileName;
  QuizFileSaveRequested(this.quizFile, this.dialogTitle, this.fileName);
}

/// Event triggered when a file is requested to be picked.
/// This event can be used to initiate the file selection process.
class QuizFilePickRequested extends FileEvent {}

/// Event triggered when a file is requested to be picked.
/// This event can be used to initiate the file selection process.
class CreateQuizMetadata extends FileEvent {
  final String name;
  final String version;
  final String description;
  final String author;
  CreateQuizMetadata({
    required this.name,
    required this.version,
    required this.description,
    required this.author,
  });
}

/// Event triggered to create a new quiz file with initial questions.
class CreateQuizWithQuestions extends FileEvent {
  final String name;
  final String version;
  final String description;
  final String author;
  final List<Question> questions;

  CreateQuizWithQuestions({
    required this.name,
    required this.version,
    required this.description,
    required this.author,
    required this.questions,
  });
}

/// Event triggered to confirm file replacement.
class ConfirmFileReplacement extends FileEvent {}

/// Event triggered to cancel file replacement.
class CancelFileReplacement extends FileEvent {}

/// Event triggered to reset the file state.
/// This event can be used to clear any file-related data or state.
class QuizFileReset extends FileEvent {}
