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
import 'package:flutter/widgets.dart';

/// Extension on [FocusNode] to provide reusable keyboard shortcut handlers
/// for the AI Chat functionality.
extension AiChatFocusNodeExtension on FocusNode {
  /// Sets up a keyboard key handler that distinguishes between Enter and Shift+Enter.
  ///
  /// - [onSend]: Callback triggered when the Enter key is pressed without Shift.
  /// - Shift+Enter will propagate normally, allowing the [TextField] to insert a new line.
  void setupAiChatKeyHandler(VoidCallback onSend) {
    onKeyEvent = (node, event) {
      if (event is! KeyDownEvent) return KeyEventResult.ignored;

      final isEnter =
          event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.numpadEnter;

      if (isEnter) {
        if (HardwareKeyboard.instance.isShiftPressed) {
          // Allow Shift+Enter to propagate and add a new line
          return KeyEventResult.ignored;
        } else {
          // Intercept Enter to send the message
          onSend();
          return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    };
  }
}
