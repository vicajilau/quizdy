import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';

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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: errorMessage == null
            ? Theme.of(context).colorScheme.surfaceContainerHighest
            : AppTheme.errorColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
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
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context)!.aiEvaluation,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
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
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        selectedService!.serviceName,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
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
              color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    foregroundColor: AppTheme.errorColor,
                    elevation: 0,
                    side: const BorderSide(color: AppTheme.errorColor),
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
