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

/// Represents a reference to a specific section within a source document.
///
/// This provides precise location tracking for the study content, allowing
/// the app to link back or correlate AI-generated summaries with the original material.
class SourceReference {
  /// The unique identifier of the source document.
  final String documentId;

  /// The starting page number in the document.
  final int startPage;

  /// The ending page number in the document.
  final int endPage;

  /// The estimated starting character or token offset.
  final int startOffset;

  /// The estimated ending character or token offset.
  final int endOffset;

  /// The type of block being referenced (e.g., 'formula_summary').
  final String blockType;

  /// Constructor for a `SourceReference`.
  const SourceReference({
    required this.documentId,
    required this.startPage,
    required this.endPage,
    required this.startOffset,
    required this.endOffset,
    required this.blockType,
  });

  /// Creates a `SourceReference` instance from a JSON map.
  ///
  /// - [json]: The JSON map containing the reference data.
  /// - Returns: A populated `SourceReference` instance.
  factory SourceReference.fromJson(Map<String, dynamic> json) {
    return SourceReference(
      documentId: json['document_id'] as String? ?? '',
      startPage: json['start_page'] as int? ?? 0,
      endPage: json['end_page'] as int? ?? 0,
      startOffset: json['start_offset'] as int? ?? 0,
      endOffset: json['end_offset'] as int? ?? 0,
      blockType: json['block_type'] as String? ?? 'Unknown',
    );
  }

  /// Converts the `SourceReference` instance to a JSON map.
  ///
  /// - Returns: A JSON map representation.
  Map<String, dynamic> toJson() {
    return {
      'document_id': documentId,
      'start_page': startPage,
      'end_page': endPage,
      'start_offset': startOffset,
      'end_offset': endOffset,
      'block_type': blockType,
    };
  }

  /// Creates a copy of the `SourceReference` with optional parameter modifications.
  SourceReference copyWith({
    String? documentId,
    int? startPage,
    int? endPage,
    int? startOffset,
    int? endOffset,
    String? blockType,
  }) {
    return SourceReference(
      documentId: documentId ?? this.documentId,
      startPage: startPage ?? this.startPage,
      endPage: endPage ?? this.endPage,
      startOffset: startOffset ?? this.startOffset,
      endOffset: endOffset ?? this.endOffset,
      blockType: blockType ?? this.blockType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SourceReference &&
        other.documentId == documentId &&
        other.startPage == startPage &&
        other.endPage == endPage &&
        other.startOffset == startOffset &&
        other.endOffset == endOffset &&
        other.blockType == blockType;
  }

  @override
  int get hashCode {
    return documentId.hashCode ^
        startPage.hashCode ^
        endPage.hashCode ^
        startOffset.hashCode ^
        endOffset.hashCode ^
        blockType.hashCode;
  }

  @override
  String toString() {
    return 'SourceReference(documentId: $documentId, pages: $startPage-$endPage, offsets: $startOffset-$endOffset, blockType: $blockType)';
  }
}
