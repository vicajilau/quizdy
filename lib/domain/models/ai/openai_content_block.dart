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

import 'package:quizlab_ai/domain/models/ai/ai_file_attachment.dart';

/// Represents a block of content in an OpenAI chat message.
///
/// Content blocks can be text, image URLs, or file references.
sealed class OpenAIContentBlock {
  /// Converts the content block to a JSON map for the OpenAI API.
  Map<String, dynamic> toJson();

  /// Helper method to create a list of content blocks from a text prompt and an [AiFileAttachment].
  ///
  /// This automatically determines whether the file should be handled as an image
  /// or a generic file block.
  static List<OpenAIContentBlock> fromPromptAndFile(
    String prompt,
    AiFileAttachment file,
  ) {
    final base64Data = base64Encode(file.bytes);
    final dataUri = 'data:${file.mimeType};base64,$base64Data';

    return [
      OpenAITextBlock(prompt),
      if (file.isImage)
        OpenAIImageUrlBlock(dataUri)
      else
        OpenAIFileBlock(fileName: file.name, fileData: dataUri),
    ];
  }
}

/// A content block containing plain text.
class OpenAITextBlock extends OpenAIContentBlock {
  /// The text content of the block.
  final String text;

  /// Creates an [OpenAITextBlock] with the specified [text].
  OpenAITextBlock(this.text);

  @override
  Map<String, dynamic> toJson() => {'type': 'text', 'text': text};
}

/// A content block containing a reference to an image URL (often a data URI).
class OpenAIImageUrlBlock extends OpenAIContentBlock {
  /// The URL or data URI of the image.
  final String url;

  /// Creates an [OpenAIImageUrlBlock] with the specified [url].
  OpenAIImageUrlBlock(this.url);

  @override
  Map<String, dynamic> toJson() => {
    'type': 'image_url',
    'image_url': {'url': url},
  };
}

/// A content block containing file data for processing.
class OpenAIFileBlock extends OpenAIContentBlock {
  /// The name of the file.
  final String fileName;

  /// The encoded file data (usually a data URI).
  final String fileData;

  /// Creates an [OpenAIFileBlock] with the specified [fileName] and [fileData].
  OpenAIFileBlock({required this.fileName, required this.fileData});

  @override
  Map<String, dynamic> toJson() => {
    'type': 'file',
    'file': {'filename': fileName, 'file_data': fileData},
  };
}
