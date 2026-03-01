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

import 'package:flutter/foundation.dart';
import 'package:quizdy/domain/models/quiz/source_reference.dart';
import 'package:quizdy/domain/models/quiz/slide.dart';
import 'package:quizdy/domain/models/quiz/study_chunk_state.dart';

/// Represents a distinct chunk of study material, often derived from a source document.
///
/// It holds the semantic essence of a specific section (via `aiSummary`) and
/// provides UI-ready sequences (`slides`) for the user to consume interactively.
class StudyChunk {
  /// The sequential index or ordering of this chunk.
  final int chunkIndex;

  /// The current processing state of the chunk.
  final StudyChunkState status;

  /// Linking back to the specific part of the source document this chunk originated from.
  final SourceReference sourceReference;

  /// An AI-generated textual summary of the source section.
  final String? aiSummary;

  /// The UI views to present to the user representing this chunk.
  final List<Slide>? slides;

  /// Constructor for a `StudyChunk`.
  const StudyChunk({
    required this.chunkIndex,
    required this.status,
    required this.sourceReference,
    this.aiSummary,
    this.slides,
  });

  /// Creates a `StudyChunk` instance from a JSON map.
  ///
  /// - [json]: The JSON map containing the study chunk data.
  /// - Returns: A populated `StudyChunk` instance.
  factory StudyChunk.fromJson(Map<String, dynamic> json) {
    List<Slide>? parsedSlides;
    if (json['slides'] != null) {
      final slidesJson = json['slides'] as List<dynamic>;
      parsedSlides = slidesJson
          .map((slideJson) => Slide.fromJson(slideJson as Map<String, dynamic>))
          .toList();
    }

    return StudyChunk(
      chunkIndex: json['chunk_index'] as int? ?? 0,
      status: StudyChunkState.fromString(
        json['status'] as String? ?? 'created',
      ),
      sourceReference: SourceReference.fromJson(
        json['source_reference'] as Map<String, dynamic>? ?? {},
      ),
      aiSummary: json['ai_summary'] as String?,
      slides: parsedSlides,
    );
  }

  /// Converts the `StudyChunk` instance to a JSON map.
  ///
  /// - Returns: A JSON map representation.
  Map<String, dynamic> toJson() {
    return {
      'chunk_index': chunkIndex,
      'status': status.toJson(),
      'source_reference': sourceReference.toJson(),
      if (aiSummary != null) 'ai_summary': aiSummary,
      if (slides != null)
        'slides': slides!.map((slide) => slide.toJson()).toList(),
    };
  }

  /// Creates a copy of the `StudyChunk` with optional parameter modifications.
  StudyChunk copyWith({
    int? chunkIndex,
    StudyChunkState? status,
    SourceReference? sourceReference,
    String? aiSummary,
    List<Slide>? slides,
  }) {
    return StudyChunk(
      chunkIndex: chunkIndex ?? this.chunkIndex,
      status: status ?? this.status,
      sourceReference: sourceReference ?? this.sourceReference.copyWith(),
      aiSummary: aiSummary ?? this.aiSummary,
      slides: slides ?? this.slides?.map((s) => s.copyWith()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudyChunk &&
        other.chunkIndex == chunkIndex &&
        other.status == status &&
        other.sourceReference == sourceReference &&
        other.aiSummary == aiSummary &&
        listEquals(other.slides, slides);
  }

  @override
  int get hashCode {
    return chunkIndex.hashCode ^
        status.hashCode ^
        sourceReference.hashCode ^
        aiSummary.hashCode ^
        (slides == null ? 0 : Object.hashAll(slides!));
  }

  @override
  String toString() {
    return 'StudyChunk(chunkIndex: $chunkIndex, status: ${status.name}, slides: ${slides?.length ?? 0})';
  }
}
