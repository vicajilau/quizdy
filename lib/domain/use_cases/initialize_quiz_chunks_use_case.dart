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

import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/data/services/ai/ai_document_chunking_service.dart';
import 'package:quizdy/domain/models/quiz/quiz_file.dart';
import 'package:quizdy/domain/models/quiz/study.dart';
import 'package:quizdy/domain/models/quiz/study_content.dart';
import 'package:quizdy/domain/models/quiz/study_chunk.dart';
import 'package:quizdy/domain/models/quiz/study_chunk_state.dart';

/// Use case that configures the `.quiz` file with chunk boundaries identified by AI.
class InitializeQuizChunksUseCase {
  final AiDocumentChunkingService _chunkingService;

  InitializeQuizChunksUseCase([AiDocumentChunkingService? chunkingService])
    : _chunkingService = chunkingService ?? AiDocumentChunkingService.instance;

  /// Executes the AI chunking and returns a new [QuizFile] updated with the `study` mapping.
  Future<QuizFile> execute(
    QuizFile quizFile,
    String documentText,
    String documentId,
    AppLocalizations localizations,
  ) async {
    final references = await _chunkingService.chunkDocument(
      documentText,
      documentId,
      localizations,
    );

    final chunks = references.asMap().entries.map((entry) {
      return StudyChunk(
        chunkIndex: entry.key,
        status: StudyChunkState.created,
        sourceReference: entry.value,
        aiSummary: null,
        slides: null,
      );
    }).toList();

    final studyContent = StudyContent(
      coveragePercentage: 0.0,
      totalChunks: chunks.length,
      processedChunks: 0,
      cache: chunks,
    );

    final study = Study(content: studyContent);

    return quizFile.copyWith(study: study);
  }
}
