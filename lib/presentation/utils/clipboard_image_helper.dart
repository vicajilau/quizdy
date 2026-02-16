import 'dart:convert';
import 'dart:typed_data';

import 'package:pasteboard/pasteboard.dart';
import 'package:quiz_app/domain/models/ai/ai_file_attachment.dart';

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
