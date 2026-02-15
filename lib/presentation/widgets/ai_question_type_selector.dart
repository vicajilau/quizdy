import 'package:flutter/material.dart';
import 'package:quiz_app/domain/models/ai/ai_question_type.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';

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
