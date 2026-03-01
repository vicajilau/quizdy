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
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
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
    AppLocalizations localizations, {
    void Function(int currentChunk, int totalChunks)? onProgress,
  }) async {
    const maxCharsPerBatch = 15000;
    List<SourceReference> allReferences = [];
    int currentGlobalOffset = 0;
    final int textLength = documentText.length;

    // Pre-calculate the total possible chunks for progress visualization
    final totalEstimatedChunks = (textLength / maxCharsPerBatch).ceil();
    int currentIteration = 0;

    while (currentGlobalOffset < textLength) {
      currentIteration++;
      debugPrint(
        'Chunking Iteration: $currentIteration / ~$totalEstimatedChunks (Global Offset: $currentGlobalOffset / $textLength)',
      );
      if (onProgress != null) {
        onProgress(currentIteration, totalEstimatedChunks);
      }

      final batch = _getNextBatch(
        documentText,
        currentGlobalOffset,
        maxCharsPerBatch,
      );
      final prompt = _buildSystemPrompt(batch.text);

      try {
        final responseBody = await GeminiService.instance.getChatResponse(
          prompt,
          localizations,
          responseMimeType: 'application/json',
        );

        final cleanJsonString = _extractJsonFromResponse(responseBody);
        List<SourceReference> parsedReferences = [];

        try {
          parsedReferences = _parseJsonToSourceReferences(
            cleanJsonString,
            documentId,
            localizations,
          );
        } catch (parseError) {
          if (parseError is FormatException) {
            // Attempt to repair truncated JSON arrays returned by LM limits
            final repairedJson = _repairTruncatedJsonArray(cleanJsonString);
            try {
              parsedReferences = _parseJsonToSourceReferences(
                repairedJson,
                documentId,
                localizations,
              );
            } catch (e) {
              // If we cannot salvage anything, we gracefully skip to avoid infinite loops
              debugPrint('Failed to salvage truncated JSON: $e');
            }
          } else {
            rethrow;
          }
        }

        if (parsedReferences.isEmpty) {
          // AI returned nothing parsable, force advance to avoid infinite loop
          currentGlobalOffset = batch.baseOffset + batch.text.length;
          continue;
        }

        // Map the relative chunk offsets back to the global document offsets
        for (final ref in parsedReferences) {
          allReferences.add(
            ref.copyWith(
              startOffset: ref.startOffset + batch.baseOffset,
              endOffset: ref.endOffset + batch.baseOffset,
            ),
          );
        }

        // The AI might have truncated the payload. Advance our global pointer
        // only up to the last SUCCESSFULLY mapped offset so we ask AI for the remainder in the next loop.
        final lastRefOffset = parsedReferences.last.endOffset;

        if (lastRefOffset <= 0) {
          currentGlobalOffset = batch.baseOffset + batch.text.length;
        } else {
          // Ensure we don't jump further than the batch itself if the AI hallucinates larger offsets
          final safeJump = math.min(lastRefOffset, batch.text.length);
          currentGlobalOffset = batch.baseOffset + safeJump;
        }
      } catch (e) {
        throw Exception('${localizations.aiErrorResponse}: $e');
      }
    }

    return allReferences;
  }

  String _repairTruncatedJsonArray(String jsonString) {
    int lastBrace = jsonString.lastIndexOf('}');
    if (lastBrace != -1) {
      return '${jsonString.substring(0, lastBrace + 1)}]';
    }
    return '[]';
  }

  _TextBatch _getNextBatch(String text, int startOffset, int maxChars) {
    final textLength = text.length;

    if (textLength - startOffset <= maxChars) {
      return _TextBatch(
        text: text.substring(startOffset),
        baseOffset: startOffset,
      );
    }

    int end = startOffset + maxChars;

    // Ensure we do not slice words or paragraphs aggressively if feasible
    int breakIndex = text.lastIndexOf('\n\n', end);
    if (breakIndex <= startOffset) breakIndex = text.lastIndexOf('\n', end);
    if (breakIndex <= startOffset) breakIndex = text.lastIndexOf('. ', end);
    if (breakIndex <= startOffset) breakIndex = text.lastIndexOf(' ', end);
    if (breakIndex <= startOffset) {
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

    // Do NOT trim here. Trimming the front alters the relative offset index!
    return _TextBatch(
      text: text.substring(startOffset, breakIndex),
      baseOffset: startOffset,
    );
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
