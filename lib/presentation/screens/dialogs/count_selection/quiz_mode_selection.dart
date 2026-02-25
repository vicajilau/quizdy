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
