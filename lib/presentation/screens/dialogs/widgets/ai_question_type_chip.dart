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
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/ai/ai_question_type.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/core/theme/extensions/confirm_dialog_colors_extension.dart';

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
