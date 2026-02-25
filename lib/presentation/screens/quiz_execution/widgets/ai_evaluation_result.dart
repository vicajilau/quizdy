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
import 'package:quizlab_ai/data/services/ai/ai_service.dart';

/// A container that displays the result of an AI essay evaluation.
///
/// Shows the evaluation text rendered as Markdown, with an optional
/// header showing the service name badge.
class AiEvaluationResult extends StatelessWidget {
  /// The AI evaluation text to display.
  final String? aiEvaluation;

  /// An optional error message to display.
  final String? errorMessage;

  /// The AI service used for evaluation (shown as a badge when provided).
  final AIService? selectedService;

  /// Whether to show the service name as a badge in the header.
  final bool showServiceBadge;

  /// Callback when the retry evaluation button is pressed.
  final VoidCallback? onRetry;

  /// Creates an [AiEvaluationResult].
  const AiEvaluationResult({
    super.key,
    required this.aiEvaluation,
    this.errorMessage,
    this.selectedService,
    this.showServiceBadge = false,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final aiTheme = theme.extension<AiAssistantTheme>()!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: errorMessage == null
            ? theme.colorScheme.surfaceContainerHighest
            : aiTheme.errorBubbleBg,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: errorMessage == null
              ? theme.colorScheme.outline.withValues(alpha: 0.2)
              : aiTheme.errorBubbleBorderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (errorMessage == null)
            Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.psychology,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.aiEvaluation,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  if (showServiceBadge && selectedService != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.3,
                          ),
                        ),
                      ),
                      child: Text(
                        selectedService!.serviceName,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          GptMarkdown(
            aiEvaluation ?? errorMessage ?? '',
            style: TextStyle(
              color: errorMessage == null
                  ? theme.colorScheme.onSurfaceVariant
                  : theme.colorScheme.onErrorContainer,
            ),
          ),
          if (errorMessage != null && onRetry != null) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.surface,
                    foregroundColor: theme.colorScheme.error,
                    elevation: 0,
                    side: BorderSide(color: theme.colorScheme.error),
                  ),
                  icon: const Icon(Icons.refresh, size: 18),
                  label: Text(AppLocalizations.of(context)!.retryButton),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
