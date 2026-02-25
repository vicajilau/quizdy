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

import 'package:pasteboard/pasteboard.dart';
import 'package:quizlab_ai/domain/models/ai/ai_file_attachment.dart';

class ClipboardImageHelper {
  ClipboardImageHelper._();

  static Future<Uint8List?> getClipboardImage() async {
    return Pasteboard.image;
  }

  static Future<String?> getClipboardImageAsBase64() async {
    final bytes = await getClipboardImage();
    if (bytes == null || bytes.isEmpty) return null;
    final base64String = base64Encode(bytes);
    return 'data:image/png;base64,$base64String';
  }

  static Future<AiFileAttachment?> getClipboardImageAsAttachment() async {
    final bytes = await getClipboardImage();
    if (bytes == null || bytes.isEmpty) return null;
    return AiFileAttachment(
      bytes: bytes,
      mimeType: 'image/png',
      name: 'clipboard_image.png',
    );
  }
}
