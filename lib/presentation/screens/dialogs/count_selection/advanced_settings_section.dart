import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/count_control_button.dart';

class AdvancedSettingsSection extends StatelessWidget {
  final bool isStudyMode;
  final bool isDark;
  final Color textColor;
  final Color subTextColor;
  final Color borderColor;
  final Color primaryColor;
  final Color controlBgColor;
  final Color controlIconColor;

  final bool subtractPoints;
  final double penaltyAmount;
  final TextEditingController penaltyController;
  final FocusNode penaltyFocusNode;
  final ValueChanged<bool> onSubtractPointsChanged;
  final ValueChanged<double> onPenaltyAmountChanged;
  final VoidCallback onIncrementPenalty;
  final VoidCallback onDecrementPenalty;

  final bool enableMaxIncorrectAnswers;
  final int maxIncorrectAnswersLimit;
  final TextEditingController maxIncorrectAnswersController;
  final FocusNode maxIncorrectAnswersFocusNode;
  final ValueChanged<bool> onEnableMaxIncorrectAnswersChanged;
  final ValueChanged<int> onMaxIncorrectAnswersLimitChanged;
  final VoidCallback onIncrementMaxIncorrect;
  final VoidCallback onDecrementMaxIncorrect;

  const AdvancedSettingsSection({
    super.key,
    required this.isStudyMode,
    required this.isDark,
    required this.textColor,
    required this.subTextColor,
    required this.borderColor,
    required this.primaryColor,
    required this.controlBgColor,
    required this.controlIconColor,
    required this.subtractPoints,
    required this.penaltyAmount,
    required this.penaltyController,
    required this.penaltyFocusNode,
    required this.onSubtractPointsChanged,
    required this.onPenaltyAmountChanged,
    required this.onIncrementPenalty,
    required this.onDecrementPenalty,
    required this.enableMaxIncorrectAnswers,
    required this.maxIncorrectAnswersLimit,
    required this.maxIncorrectAnswersController,
    required this.maxIncorrectAnswersFocusNode,
    required this.onEnableMaxIncorrectAnswersChanged,
    required this.onMaxIncorrectAnswersLimitChanged,
    required this.onIncrementMaxIncorrect,
    required this.onDecrementMaxIncorrect,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isStudyMode) ...[
            _buildSubtractPointsToggle(context),
            if (subtractPoints) ...[
              const SizedBox(height: 12),
              _buildPenaltyAmountInput(context),
            ],
            const SizedBox(height: 16),
            _buildMaxIncorrectToggle(context),
            if (enableMaxIncorrectAnswers) ...[
              const SizedBox(height: 12),
              _buildMaxIncorrectLimitInput(context),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildSubtractPointsToggle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF3F3F46) : const Color(0xFFF4F4F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.subtractPointsLabel,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                if (subtractPoints) ...[
                  const SizedBox(height: 2),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.penaltyPointsLabel(penaltyAmount.toStringAsFixed(2)),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.errorColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Switch(
            value: subtractPoints,
            onChanged: onSubtractPointsChanged,
            activeTrackColor: primaryColor,
            activeThumbColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: isDark ? AppTheme.zinc600 : AppTheme.zinc300,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget _buildPenaltyAmountInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.penaltyAmountLabel,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: subTextColor,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            CountControlButton(
              icon: LucideIcons.minus,
              onTap: onDecrementPenalty,
              bgColor: controlBgColor,
              iconColor: controlIconColor,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: controlBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: penaltyController,
                  focusNode: penaltyFocusNode,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                  ],
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) return;
                    final normalizedValue = value.replaceAll(',', '.');
                    final val = double.tryParse(normalizedValue);
                    if (val != null && val >= 0) {
                      onPenaltyAmountChanged(val);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            CountControlButton(
              icon: LucideIcons.plus,
              onTap: onIncrementPenalty,
              bgColor: primaryColor,
              iconColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMaxIncorrectToggle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF3F3F46) : const Color(0xFFF4F4F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.maxIncorrectAnswersLabel,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalizations.of(context)!.maxIncorrectAnswersDescription,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: subTextColor,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: enableMaxIncorrectAnswers,
            onChanged: onEnableMaxIncorrectAnswersChanged,
            activeTrackColor: primaryColor,
            activeThumbColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: isDark ? AppTheme.zinc600 : AppTheme.zinc300,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }

  Widget _buildMaxIncorrectLimitInput(BuildContext context) {
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
