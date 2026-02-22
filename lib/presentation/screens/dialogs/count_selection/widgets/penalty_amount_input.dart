import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/count_control_button.dart';

class PenaltyAmountInput extends StatelessWidget {
  final Color textColor;
  final Color subTextColor;
  final Color primaryColor;
  final Color controlBgColor;
  final Color controlIconColor;
  final double penaltyAmount;
  final TextEditingController penaltyController;
  final FocusNode penaltyFocusNode;
  final ValueChanged<double> onPenaltyAmountChanged;
  final VoidCallback onIncrementPenalty;
  final VoidCallback onDecrementPenalty;

  const PenaltyAmountInput({
    super.key,
    required this.textColor,
    required this.subTextColor,
    required this.primaryColor,
    required this.controlBgColor,
    required this.controlIconColor,
    required this.penaltyAmount,
    required this.penaltyController,
    required this.penaltyFocusNode,
    required this.onPenaltyAmountChanged,
    required this.onIncrementPenalty,
    required this.onDecrementPenalty,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Text(
              AppLocalizations.of(
                context,
              )!.penaltyPointsLabel(penaltyAmount.toStringAsFixed(2)),
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppTheme.errorColor,
              ),
            ),
          ],
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
}
