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
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/data/services/ai/ai_service.dart';

/// A dropdown selector for choosing an AI service.
///
/// Only renders content when there are multiple services available.
class AiServiceSelector extends StatelessWidget {
  /// The list of available AI services.
  final List<AIService> availableServices;

  /// The currently selected service.
  final AIService? selectedService;

  /// Callback when the user selects a different service.
  final ValueChanged<AIService?> onServiceChanged;

  /// Creates an [AiServiceSelector].
  const AiServiceSelector({
    super.key,
    required this.availableServices,
    required this.selectedService,
    required this.onServiceChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (availableServices.length <= 1) return const SizedBox.shrink();

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.aiServiceLabel,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<AIService>(
                initialValue: selectedService,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(
                        context,
                      ).colorScheme.outline.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                items: availableServices.map((service) {
                  return DropdownMenuItem<AIService>(
                    value: service,
                    child: Text(
                      service.serviceName,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: onServiceChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
