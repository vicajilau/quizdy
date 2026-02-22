import 'package:flutter/material.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';

/// A button that triggers AI evaluation of an essay answer.
///
/// Displays a loading state while evaluating and optionally shows
/// the service name when only one service is available.
class AiEvaluateButton extends StatelessWidget {
  /// Whether an evaluation is currently in progress.
  final bool isEvaluating;

  /// The currently selected AI service.
  final AIService? selectedService;

  /// The total number of available AI services.
  final int availableServicesCount;

  /// Callback when the button is pressed.
  final VoidCallback onEvaluate;

  /// Creates an [AiEvaluateButton].
  const AiEvaluateButton({
    super.key,
    required this.isEvaluating,
    required this.selectedService,
    required this.availableServicesCount,
    required this.onEvaluate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: isEvaluating || selectedService == null ? null : onEvaluate,
        icon: isEvaluating
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.auto_awesome, size: 18),
        label: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isEvaluating
                  ? AppLocalizations.of(context)!.aiThinking
                  : AppLocalizations.of(context)!.evaluateWithAI,
              style: const TextStyle(fontSize: 13),
            ),
            if (selectedService != null && availableServicesCount == 1)
              Text(
                '(${selectedService!.serviceName})',
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                ),
              ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }
}
