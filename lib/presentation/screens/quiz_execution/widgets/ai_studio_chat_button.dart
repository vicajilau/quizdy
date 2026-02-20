import 'package:flutter/material.dart';

import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';

/// A button that opens the AI chat sidebar/panel for a specific question.
///
/// Unlike [AiAssistantButton] (which opens a dialog), this button triggers
/// a callback to open the persistent AI chat sidebar during quiz execution.
class AiStudioChatButton extends StatelessWidget {
  /// The question for which the AI chat is requested.
  final Question question;

  /// Callback invoked when the button is pressed.
  final VoidCallback onPressed;

  /// Whether the AI assistant is available (enabled and has API keys configured).
  final bool? isAiAvailable;

  const AiStudioChatButton({
    super.key,
    required this.question,
    required this.onPressed,
    this.isAiAvailable = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              onPressed: isAiAvailable == true ? onPressed : null,
              icon: const Icon(Icons.auto_awesome),
              label: Text(l10n.askAiAboutQuestion, textAlign: TextAlign.center),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                disabledForegroundColor: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.38),
              ),
            ),
            if (isAiAvailable == false)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Text(
                  l10n.enableAiAssistant,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
