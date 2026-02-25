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
import 'package:quizlab_ai/domain/models/ai/ai_question_type.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';

class AiQuestionTypeSelector extends StatelessWidget {
  final Set<AiQuestionType> selectedTypes;
  final Function(Set<AiQuestionType>) onSelectedTypesChanged;

  const AiQuestionTypeSelector({
    super.key,
    required this.selectedTypes,
    required this.onSelectedTypesChanged,
  });

  String _getQuestionTypeLabel(BuildContext context, AiQuestionType type) {
    final localizations = AppLocalizations.of(context)!;
    switch (type) {
      case AiQuestionType.multipleChoice:
        return localizations.questionTypeMultipleChoice;
      case AiQuestionType.singleChoice:
        return localizations.questionTypeSingleChoice;
      case AiQuestionType.trueFalse:
        return localizations.questionTypeTrueFalse;
      case AiQuestionType.essay:
        return localizations.questionTypeEssay;
      case AiQuestionType.random:
        return localizations.aiQuestionTypeRandom;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: AiQuestionType.values.map((type) {
        final isSelected = selectedTypes.contains(type);
        final primaryColor = Theme.of(context).colorScheme.primary;

        return FilterChip(
          label: Text(
            _getQuestionTypeLabel(context, type),
            style: TextStyle(
              color: isSelected ? Colors.white : primaryColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: isSelected,
          selectedColor: primaryColor,
          checkmarkColor: Colors.white,
          backgroundColor: primaryColor.withValues(alpha: 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected
                  ? Colors.transparent
                  : primaryColor.withValues(alpha: 0.3),
            ),
          ),
          showCheckmark: true,
          onSelected: (selected) {
            Set<AiQuestionType> newSelectedTypes = Set.from(selectedTypes);
            if (type == AiQuestionType.random) {
              if (selected) {
                newSelectedTypes = {AiQuestionType.random};
              } else {
                if (newSelectedTypes.length == 1) {
                  newSelectedTypes = {AiQuestionType.multipleChoice};
                } else {
                  newSelectedTypes.remove(type);
                }
              }
            } else {
              if (selected) {
                newSelectedTypes.remove(AiQuestionType.random);
                newSelectedTypes.add(type);

                final allSpecificTypes = AiQuestionType.values
                    .where((t) => t != AiQuestionType.random)
                    .toSet();
                if (newSelectedTypes.containsAll(allSpecificTypes)) {
                  newSelectedTypes = {AiQuestionType.random};
                }
              } else {
                newSelectedTypes.remove(type);
                if (newSelectedTypes.isEmpty) {
                  newSelectedTypes = {AiQuestionType.random};
                }
              }
            }
            onSelectedTypesChanged(newSelectedTypes);
          },
        );
      }).toList(),
    );
  }
}
