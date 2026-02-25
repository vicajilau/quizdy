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
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/core/theme/extensions/confirm_dialog_colors_extension.dart';

/// A widget that handles the exam mode settings section.
///
/// Allows the user to enable/disable the exam timer and configure the time limit in minutes.
class ExamSettingsSection extends StatelessWidget {
  final bool enabled;
  final int minutes;
  final ValueChanged<bool> onEnabledChanged;
  final ValueChanged<int> onMinutesChanged;

  const ExamSettingsSection({
    super.key,
    required this.enabled,
    required this.minutes,
    required this.onEnabledChanged,
    required this.onMinutesChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.examTimeLimitTitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: colors.title,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalizations.of(context)!.examTimeLimitDescription,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: colors.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: enabled,
                onChanged: onEnabledChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: AppTheme.primaryColor,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: isDark
                    ? AppTheme.zinc600
                    : AppTheme.zinc300,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ],
          ),
        ),
        if (enabled) ...[
          const SizedBox(height: 16),
          TextFormField(
            initialValue: minutes.toString(),
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.timeLimitMinutes,
              labelStyle: TextStyle(
                fontFamily: 'Inter',
                color: colors.subtitle,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark
                      ? AppTheme.borderColorDark
                      : AppTheme.borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark
                      ? AppTheme.borderColorDark
                      : AppTheme.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppTheme.primaryColor),
              ),
              suffixText: AppLocalizations.of(context)!.minutesAbbreviation,
            ),
            style: TextStyle(fontFamily: 'Inter', color: colors.title),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final newMinutes = int.tryParse(value);
              if (newMinutes != null && newMinutes > 0) {
                onMinutesChanged(newMinutes);
              }
            },
          ),
        ],
      ],
    );
  }
}
