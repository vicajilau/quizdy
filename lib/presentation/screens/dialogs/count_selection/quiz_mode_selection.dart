import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';

class QuizModeSelection extends StatelessWidget {
  final bool isStudyMode;
  final ValueChanged<bool> onModeChanged;
  final Color primaryColor;
  final Color controlBgColor;
  final Color subTextColor;

  const QuizModeSelection({
    super.key,
    required this.isStudyMode,
    required this.onModeChanged,
    required this.primaryColor,
    required this.controlBgColor,
    required this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quiz Mode
        Text(
          AppLocalizations.of(context)!.quizModeTitle,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: subTextColor,
          ),
        ),
        const SizedBox(height: 12),

        // Mode Options (Horizontal Row)
        Row(
          children: [
            Expanded(
              child: _buildModeOption(
                context: context,
                title: AppLocalizations.of(context)!.examModeLabel,
                icon: LucideIcons.fileText,
                isSelected: !isStudyMode,
                onTap: () => onModeChanged(false),
                primaryColor: primaryColor,
                defaultBgColor: controlBgColor,
                defaultTextColor: subTextColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildModeOption(
                context: context,
                title: AppLocalizations.of(context)!.studyModeLabel,
                icon: LucideIcons.bookOpen,
                isSelected: isStudyMode,
                onTap: () => onModeChanged(true),
                primaryColor: primaryColor,
                defaultBgColor: controlBgColor,
                defaultTextColor: subTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Mode Description
        Text(
          isStudyMode
              ? AppLocalizations.of(context)!.studyModeDescription
              : AppLocalizations.of(context)!.examModeDescription,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: subTextColor,
            height: 1.4,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget _buildModeOption({
    required BuildContext context,
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
    required Color defaultBgColor,
    required Color defaultTextColor,
  }) {
    return IconButton(
      onPressed: onTap,
      style: IconButton.styleFrom(
        backgroundColor: isSelected ? primaryColor : defaultBgColor,
        foregroundColor: isSelected ? Colors.white : defaultTextColor,
        minimumSize: const Size(double.infinity, 64),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Colors.white : defaultTextColor,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : defaultTextColor,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
