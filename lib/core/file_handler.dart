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

import 'package:flutter/services.dart';

/// Handles file interactions through platform channels.
class FileHandler {
  /// The platform method channel for handling file operations.
  static const _channel = MethodChannel('quiz.file');

  /// Initializes the file handler by setting up a method call listener.
  ///
  /// - [onFileOpened]: Callback function triggered when a file is opened.
  static void initialize(Function(String filePath) onFileOpened) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'openFile') {
        final filePath = call.arguments as String;
        onFileOpened(filePath);
      }
    });
  }
}
