import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/domain/models/ai/ai_question_type.dart';
import 'package:quiz_app/domain/models/quiz/question_type.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/extensions/confirm_dialog_colors_extension.dart';

class AiQuestionTypeChip extends StatelessWidget {
  final AiQuestionType type;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  const AiQuestionTypeChip({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    String label;
    IconData icon;

    switch (type) {
      case AiQuestionType.multipleChoice:
        label = QuestionType.multipleChoice.getQuestionTypeLabel(context);
        icon = QuestionType.multipleChoice.getQuestionTypeIcon();
        break;
      case AiQuestionType.singleChoice:
        label = QuestionType.singleChoice.getQuestionTypeLabel(context);
        icon = QuestionType.singleChoice.getQuestionTypeIcon();
        break;
      case AiQuestionType.trueFalse:
        label = QuestionType.trueFalse.getQuestionTypeLabel(context);
        icon = QuestionType.trueFalse.getQuestionTypeIcon();
        break;
      case AiQuestionType.essay:
        label = QuestionType.essay.getQuestionTypeLabel(context);
        icon = QuestionType.essay.getQuestionTypeIcon();
        break;
      case AiQuestionType.random:
        label = AppLocalizations.of(context)!.questionTypeRandom;
        icon = LucideIcons.shuffle;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : colors.surface,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? LucideIcons.checkCircle2 : icon,
              size: 14,
              color: isSelected ? Colors.white : colors.subtitle,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? Colors.white : colors.subtitle,
                ),

                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
