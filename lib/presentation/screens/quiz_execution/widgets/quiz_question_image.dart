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
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';

/// A widget that handles the display of an image in a quiz question.
///
/// It supports decoding base64 image data and provides error handling
/// in case the image cannot be loaded or decoded.
class QuizQuestionImage extends StatelessWidget {
  /// The base64 encoded image string or URL.
  final String? imageData;

  /// Creates a [QuizQuestionImage] widget.
  const QuizQuestionImage({super.key, required this.imageData});

  /// Extracts image data from base64 string for preview.
  ///
  /// Returns `null` if the data is invalid or extraction fails.
  Uint8List? _getImageBytes(String? imageData) {
    if (imageData == null) return null;

    try {
      // Extract base64 data after the comma if present
      final base64Data = imageData.contains(',')
          ? imageData.split(',').last
          : imageData;
      return base64Decode(base64Data);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (imageData == null) return const SizedBox.shrink();

    final imageBytes = _getImageBytes(imageData);

    if (imageBytes == null) return const SizedBox.shrink();

    return Column(
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxHeight: 200),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.memory(
              imageBytes,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                        size: 32,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppLocalizations.of(context)!.imageLoadError,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
