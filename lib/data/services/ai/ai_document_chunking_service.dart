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

import 'dart:convert';
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/data/services/ai/gemini_service.dart';
import 'package:quizdy/domain/models/quiz/source_reference.dart';

class _TextBatch {
  final String text;
  final int baseOffset;

  const _TextBatch({required this.text, required this.baseOffset});
}

/// Service responsible for parsing documents into semantic chunks using AI.
class AiDocumentChunkingService {
  static AiDocumentChunkingService? _instance;

  /// Singleton instance
  static AiDocumentChunkingService get instance =>
      _instance ??= AiDocumentChunkingService._();

  AiDocumentChunkingService._();

  /// Identifies semantic chunks within a document using Gemini.
  ///
  /// The AI processes the full [documentText] iteratively in ~15K character bursts
  /// to avoid output tokens limitations when parsing big files like PDFs.
  ///
  /// - [documentText]: The full text extracted from the document.
  /// - [documentId]: A unique identifier for the document.
  /// - [localizations]: Localization bundle for error messages.
  /// - Returns: A mapped global list of `SourceReference` indicating the text slices.
  Future<List<SourceReference>> chunkDocument(
    String documentText,
    String documentId,
    AppLocalizations localizations,
  ) async {
    const maxCharsPerBatch = 15000;
    final batches = _splitTextIntoLocalBatches(documentText, maxCharsPerBatch);

    List<SourceReference> allReferences = [];

    for (final batch in batches) {
      final prompt = _buildSystemPrompt(batch.text);

      try {
        final responseBody = await GeminiService.instance.getChatResponse(
          prompt,
          localizations,
          responseMimeType: 'application/json',
        );

        final cleanJsonString = _extractJsonFromResponse(responseBody);
        final parsedReferences = _parseJsonToSourceReferences(
          cleanJsonString,
          documentId,
          localizations,
        );

        // Map the relative chunk offsets back to the global document offsets
        for (final ref in parsedReferences) {
          allReferences.add(
            ref.copyWith(
              startOffset: ref.startOffset + batch.baseOffset,
              endOffset: ref.endOffset + batch.baseOffset,
            ),
          );
        }
      } catch (e) {
        if (e is FormatException) {
          throw Exception(
            '${localizations.aiErrorResponse}: $e\n${localizations.documentTooLongForProcessing}',
          );
        }
        throw Exception('Failed to chunk document: ${e.toString()}');
      }
    }

    return allReferences;
  }

  /// Splits [text] into sequential batches respecting paragraph/sentence boundaries
  /// up to roughly [maxChars] characters per chunk to prevent semantic breakdown.
  List<_TextBatch> _splitTextIntoLocalBatches(String text, int maxChars) {
    List<_TextBatch> batches = [];
    int currentOffset = 0;
    final int textLength = text.length;

    while (currentOffset < textLength) {
      if (textLength - currentOffset <= maxChars) {
        // The remaining text fits exactly within the limit
        batches.add(
          _TextBatch(
            text: text.substring(currentOffset),
            baseOffset: currentOffset,
          ),
        );
        break;
      }

      int end = currentOffset + maxChars;

      // Ensure we do not slice words or paragraphs aggressively if feasible
      int breakIndex = text.lastIndexOf('\n\n', end);
      if (breakIndex <= currentOffset) {
        breakIndex = text.lastIndexOf('\n', end);
      }
      if (breakIndex <= currentOffset) {
        breakIndex = text.lastIndexOf('. ', end);
      }

      // If we couldn't find a semantic boundary, fall back to a hard slice at the nearest space
      if (breakIndex <= currentOffset) {
        breakIndex = text.lastIndexOf(' ', end);
      }
      if (breakIndex <= currentOffset) {
        breakIndex = end; // Last resort hard-cut limit
      }

      // In the case of paragraphs/sentences dot, we want to include the separator itself
      if (breakIndex != end &&
          text[breakIndex] == '.' &&
          text.length > breakIndex + 1 &&
          text[breakIndex + 1] == ' ') {
        breakIndex += 1; // Include the period
      } else if (breakIndex != end && text[breakIndex] == '\n') {
        breakIndex += 1; // Include newline
      }

      final chunkText = text.substring(currentOffset, breakIndex).trim();

      if (chunkText.isNotEmpty) {
        batches.add(_TextBatch(text: chunkText, baseOffset: currentOffset));
      }
      currentOffset = breakIndex;
    }

    return batches;
  }

  /// Builds the instruction set and appends the document text.
  String _buildSystemPrompt(String text) {
    return '''
You are an expert document parser. Your task is to divide the provided text into logical, semantic chunks suitable for generating interactive study material.
Each chunk should represent a distinct concept, topic, or section.
You must return the result ONLY as a JSON array of objects. Do not include any other text, markdown formatting (like ```json), or explanations.

Each object in the JSON array must have the following exact schema:
{
  "start_offset": <integer, the character index where the chunk begins>,
  "end_offset": <integer, the character index where the chunk ends>,
  "block_type": <string, a short descriptor of the content (e.g., "introduction", "definition", "concept", "summary")>
}

Ensure that the chunks cover the important parts of the text sequentially without unnecessary overlapping, although minor overlaps for context are acceptable. The offsets refer to the character indices in the provided text.

Document Text:
"""
$text
"""
''';
  }

  /// Extracts the JSON array string from the LLM response, stripping markdown if present.
  String _extractJsonFromResponse(String response) {
    String cleanResponse = response.trim();
    if (cleanResponse.startsWith('```json')) {
      cleanResponse = cleanResponse.substring('```json'.length);
    } else if (cleanResponse.startsWith('```')) {
      cleanResponse = cleanResponse.substring('```'.length);
    }

    if (cleanResponse.endsWith('```')) {
      cleanResponse = cleanResponse.substring(0, cleanResponse.length - 3);
    }

    return cleanResponse.trim();
  }

  /// Parses the raw JSON array string into `SourceReference` models.
  List<SourceReference> _parseJsonToSourceReferences(
    String jsonString,
    String documentId,
    AppLocalizations localizations,
  ) {
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is! List) {
        throw const FormatException('Expected a JSON array.');
      }

      return decoded.map((item) {
        final map = item as Map<String, dynamic>;

        // startPage and endPage are unknown at this pure-text chunking stage.
        // Defaulting to 1, capable of being mapped later if PDF layout context is integrated.
        return SourceReference(
          documentId: documentId,
          startPage: (map['start_page'] as num?)?.toInt() ?? 1,
          endPage: (map['end_page'] as num?)?.toInt() ?? 1,
          startOffset: (map['start_offset'] as num?)?.toInt() ?? 0,
          endOffset: (map['end_offset'] as num?)?.toInt() ?? 0,
          blockType: map['block_type'] as String? ?? 'unknown',
        );
      }).toList();
    } catch (e) {
      throw FormatException(
        'Failed to parse AI JSON array response: $e\nResponse String: $jsonString',
      );
    }
  }
}
