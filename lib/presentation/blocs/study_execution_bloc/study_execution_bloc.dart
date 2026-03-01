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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/data/services/ai/ai_jit_processing_service.dart';
import 'package:quizdy/domain/models/quiz/study_chunk.dart';
import 'package:quizdy/domain/models/quiz/study_chunk_state.dart';
import 'package:quizdy/presentation/blocs/study_execution_bloc/study_execution_event.dart';
import 'package:quizdy/presentation/blocs/study_execution_bloc/study_execution_state.dart';

class StudyExecutionBloc
    extends Bloc<StudyExecutionEvent, StudyExecutionState> {
  final AiJitProcessingService _jitProcessingService;
  final AppLocalizations _localizations;

  StudyExecutionBloc({
    required AiJitProcessingService jitProcessingService,
    required AppLocalizations localizations,
    required List<StudyChunk> initialChunks,
    required String documentText,
    required String documentTitle,
  }) : _jitProcessingService = jitProcessingService,
       _localizations = localizations,
       super(
         StudyExecutionState(
           chunks: initialChunks,
           documentText: documentText,
           documentTitle: documentTitle,
         ),
       ) {
    on<StudyChunkRequested>(_onStudyChunkRequested);
    on<NextStudyChunkRequested>(_onNextStudyChunkRequested);
    on<PreviousStudyChunkRequested>(_onPreviousStudyChunkRequested);
  }

  Future<void> _onStudyChunkRequested(
    StudyChunkRequested event,
    Emitter<StudyExecutionState> emit,
  ) async {
    if (event.chunkIndex < 0 || event.chunkIndex >= state.chunks.length) {
      return;
    }

    // Set the current chunk
    emit(state.copyWith(currentChunkIndex: event.chunkIndex));

    final chunk = state.chunks[event.chunkIndex];

    // Only process if it's created or encountered an error. If it's already completed or processing, do nothing.
    if (chunk.status == StudyChunkState.completed ||
        chunk.status == StudyChunkState.processing) {
      return;
    }

    // Mark as processing
    final processingChunk = chunk.copyWith(status: StudyChunkState.processing);
    final chunksProcessing = List<StudyChunk>.from(state.chunks);
    chunksProcessing[event.chunkIndex] = processingChunk;
    emit(state.copyWith(chunks: chunksProcessing));

    // Wait for the JIT Processing Service
    final processedChunk = await _jitProcessingService.processChunk(
      processingChunk,
      state.documentText,
      _localizations,
    );

    // Update the state with the finished chunk (either completed or error)
    final chunksFinished = List<StudyChunk>.from(state.chunks);
    chunksFinished[event.chunkIndex] = processedChunk;
    emit(state.copyWith(chunks: chunksFinished));
  }

  void _onNextStudyChunkRequested(
    NextStudyChunkRequested event,
    Emitter<StudyExecutionState> emit,
  ) {
    if (state.hasNext) {
      add(StudyChunkRequested(state.currentChunkIndex + 1));
    }
  }

  void _onPreviousStudyChunkRequested(
    PreviousStudyChunkRequested event,
    Emitter<StudyExecutionState> emit,
  ) {
    if (state.hasPrevious) {
      add(StudyChunkRequested(state.currentChunkIndex - 1));
    }
  }
}
