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
