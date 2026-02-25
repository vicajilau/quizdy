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

import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/theme/extensions/ai_assistant_theme.dart';

/// A widget that displays a single chat message bubble.
///
/// Renders messages differently based on whether they are from the [isUser]
/// or the AI. AI messages support Markdown rendering via [GptMarkdown].
class AiChatBubble extends StatelessWidget {
  /// The text content to display.
  final String content;

  /// Whether the message is from the user (right-aligned) or AI (left-aligned).
  final bool isUser;

  /// If `true`, styles the bubble to indicate an error state.
  final bool isError;

  /// The name of the AI service (e.g., "OpenAI", "Gemini") to display
  /// above the message for AI responses.
  final String? aiServiceName;

  /// Callback invoked when the retry button is pressed (only shown on error).
  final VoidCallback? onRetry;

  /// Creates a [AiChatBubble].
  const AiChatBubble({
    super.key,
    required this.content,
    required this.isUser,
    this.isError = false,
    this.aiServiceName,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final aiTheme = theme.extension<AiAssistantTheme>()!;

    if (isUser) {
      return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16, left: 48),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: aiTheme.userBubbleBg,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: aiTheme.userBubbleTextColor,
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, right: 16),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isError ? aiTheme.errorBubbleBg : aiTheme.aiBubbleBg,
          border: isError
              ? Border.all(color: aiTheme.errorBubbleBorderColor)
              : null,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        aiServiceName?.contains('OpenAI') == true
                            ? Icons.auto_awesome
                            : Icons.auto_fix_high,
                        size: 14,
                        color: isError
                            ? theme.colorScheme.error
                            : theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          aiServiceName ?? 'AI',
                          style: TextStyle(
                            color: isError
                                ? theme.colorScheme.error
                                : theme.colorScheme.primary,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        localizations.aiAssistant,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isError
                              ? theme.colorScheme.error
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GptMarkdown(
                    content,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isError
                          ? theme.colorScheme.onErrorContainer
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            if (isError && onRetry != null) ...[
              const SizedBox(width: 8),
              IconButton(
                onPressed: onRetry,
                icon: Icon(
                  Icons.refresh,
                  color: Theme.of(context).colorScheme.onError,
                ),
                tooltip: localizations.retry,
                color: theme.colorScheme.error,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
