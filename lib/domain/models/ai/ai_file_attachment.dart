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

import 'dart:typed_data';

/// Represents a file attached to an AI request.
class AiFileAttachment {
  /// The raw byte content of the file.
  final Uint8List bytes;

  /// The MIME type of the file (e.g., 'image/png', 'application/pdf').
  final String mimeType;

  /// The original name of the file.
  final String name;

  /// Creates an [AiFileAttachment] with the given [bytes], [mimeType], and [name].
  const AiFileAttachment({
    required this.bytes,
    required this.mimeType,
    required this.name,
  });

  /// Whether the attached file is an image.
  bool get isImage => mimeType.startsWith('image/');
}
