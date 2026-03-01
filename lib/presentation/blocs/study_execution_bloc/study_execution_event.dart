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

abstract class StudyExecutionEvent {
  const StudyExecutionEvent();
}

/// Dispatched when the study mode view is ready and wants to process the actual chunk.
class StudyChunkRequested extends StudyExecutionEvent {
  final int chunkIndex;

  const StudyChunkRequested(this.chunkIndex);
}

/// Dispatched to move to the next chunk.
class NextStudyChunkRequested extends StudyExecutionEvent {}

/// Dispatched to move to the previous chunk.
class PreviousStudyChunkRequested extends StudyExecutionEvent {}
