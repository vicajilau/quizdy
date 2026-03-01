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

/// The possible states for a `StudyChunk`.
enum StudyChunkState {
  /// The chunk has been created but not yet processed.
  created,

  /// The chunk is currently being processed by the AI.
  processing,

  /// The chunk has been successfully processed.
  completed,

  /// An error occurred while processing the chunk.
  error;

  /// Parses a string representation into a `StudyChunkState`.
  ///
  /// - [value]: The string representation of the state.
  /// - Returns: The parsed `StudyChunkState`, defaulting to [StudyChunkState.created] if invalid.
  static StudyChunkState fromString(String value) {
    switch (value.toLowerCase()) {
      case 'created':
        return StudyChunkState.created;
      case 'processing':
        return StudyChunkState.processing;
      case 'completed':
        return StudyChunkState.completed;
      case 'error':
        return StudyChunkState.error;
      default:
        return StudyChunkState.created; // Fallback or handle invalid state
    }
  }

  /// Converts the enum value to its string representation suitable for JSON.
  ///
  /// - Returns: The string representation of the state (lowercase).
  String toJson() {
    return name;
  }
}
