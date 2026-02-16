import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/count_control_button.dart';

class MaxIncorrectLimitInput extends StatelessWidget {
  final bool isDark;
  final Color textColor;
  final Color subTextColor;
  final Color primaryColor;
  final Color controlBgColor;
  final Color borderColor;
  final TextEditingController maxIncorrectAnswersController;
  final FocusNode maxIncorrectAnswersFocusNode;
  final ValueChanged<int> onMaxIncorrectAnswersLimitChanged;
  final VoidCallback onIncrementMaxIncorrect;
  final VoidCallback onDecrementMaxIncorrect;

  const MaxIncorrectLimitInput({
    super.key,
    required this.isDark,
    required this.textColor,
    required this.subTextColor,
    required this.primaryColor,
    required this.controlBgColor,
    required this.borderColor,
    required this.maxIncorrectAnswersController,
    required this.maxIncorrectAnswersFocusNode,
    required this.onMaxIncorrectAnswersLimitChanged,
    required this.onIncrementMaxIncorrect,
    required this.onDecrementMaxIncorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.maxIncorrectAnswersLimitLabel,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: subTextColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: controlBgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor.withValues(alpha: 0.5)),
          ),
          child: Row(
            children: [
              CountControlButton(
                icon: LucideIcons.minus,
                onTap: onDecrementMaxIncorrect,
                bgColor: isDark
                    ? AppTheme.zinc900.withValues(alpha: 0.5)
                    : Colors.white,
                iconColor: primaryColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                    child: TextField(
                      controller: maxIncorrectAnswersController,
                      focusNode: maxIncorrectAnswersFocusNode,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        final val = int.tryParse(value);
                        if (val != null) {
                          onMaxIncorrectAnswersLimitChanged(val);
                        }
                      },
                    ),
                  ),
                ),
              ),
              CountControlButton(
                icon: LucideIcons.plus,
                onTap: onIncrementMaxIncorrect,
                bgColor: isDark
                    ? AppTheme.zinc900.withValues(alpha: 0.5)
                    : Colors.white,
                iconColor: primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
