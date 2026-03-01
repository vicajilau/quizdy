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
import 'package:flutter/foundation.dart';
import 'package:quizdy/domain/models/ai/ai_file_attachment.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

/// Helper utility for extracting text content from supported file types securely locally
class DocumentTextExtractor {
  /// Extracts the readable text given an [AiFileAttachment] locally without blocking the UI thread.
  ///
  /// - Extracts raw UTF-8 decoded strings from `.txt`.
  /// - Computes and extracts native characters from vectors inside `.pdf` files.
  /// - Throws standard format exception for unsupported file formats.
  static Future<String> extractText(AiFileAttachment file) async {
    final fileName = file.name.toLowerCase();

    if (fileName.endsWith('.txt')) {
      return await compute(_extractTxtString, file.bytes);
    } else if (fileName.endsWith('.pdf')) {
      return await compute(_extractPdfString, file.bytes);
    } else {
      throw Exception(
        'Format not supported. Only .txt and .pdf files are supported for AI generation.',
      );
    }
  }
}

// Top-level isolates to prevent UI Jank
String _extractTxtString(List<int> bytes) {
  return utf8.decode(bytes);
}

String _extractPdfString(List<int> bytes) {
  PdfDocument document = PdfDocument(inputBytes: bytes);
  String text = PdfTextExtractor(document).extractText();
  document.dispose();
  return text;
}
