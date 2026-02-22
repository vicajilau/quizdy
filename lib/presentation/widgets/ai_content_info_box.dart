import 'package:flutter/material.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';

class AiContentInfoBox extends StatelessWidget {
  const AiContentInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, size: 16, color: Colors.blue.shade700),
              const SizedBox(width: 8),
              Text(
                localizations.aiInfoTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            localizations.aiInfoDescription.replaceAll('\\n', '\n'),
            style: TextStyle(fontSize: 12, color: Colors.blue.shade800),
          ),
        ],
      ),
    );
  }
}
