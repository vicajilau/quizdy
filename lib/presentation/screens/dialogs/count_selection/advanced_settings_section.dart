import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/widgets/max_incorrect_limit_input.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/widgets/max_incorrect_toggle.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/widgets/penalty_amount_input.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/widgets/subtract_points_toggle.dart';

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
            SubtractPointsToggle(
              isDark: isDark,
              textColor: textColor,
              primaryColor: primaryColor,
              subtractPoints: subtractPoints,
              penaltyAmount: penaltyAmount,
              onSubtractPointsChanged: onSubtractPointsChanged,
            ),
            if (subtractPoints) ...[
              const SizedBox(height: 12),
              PenaltyAmountInput(
                textColor: textColor,
                subTextColor: subTextColor,
                primaryColor: primaryColor,
                controlBgColor: controlBgColor,
                controlIconColor: controlIconColor,
                penaltyController: penaltyController,
                penaltyFocusNode: penaltyFocusNode,
                onPenaltyAmountChanged: onPenaltyAmountChanged,
                onIncrementPenalty: onIncrementPenalty,
                onDecrementPenalty: onDecrementPenalty,
              ),
            ],
            const SizedBox(height: 16),
            MaxIncorrectToggle(
              isDark: isDark,
              textColor: textColor,
              subTextColor: subTextColor,
              primaryColor: primaryColor,
              enableMaxIncorrectAnswers: enableMaxIncorrectAnswers,
              onEnableMaxIncorrectAnswersChanged:
                  onEnableMaxIncorrectAnswersChanged,
            ),
            if (enableMaxIncorrectAnswers) ...[
              const SizedBox(height: 12),
              MaxIncorrectLimitInput(
                isDark: isDark,
                textColor: textColor,
                subTextColor: subTextColor,
                primaryColor: primaryColor,
                controlBgColor: controlBgColor,
                borderColor: borderColor,
                maxIncorrectAnswersController: maxIncorrectAnswersController,
                maxIncorrectAnswersFocusNode: maxIncorrectAnswersFocusNode,
                onMaxIncorrectAnswersLimitChanged:
                    onMaxIncorrectAnswersLimitChanged,
                onIncrementMaxIncorrect: onIncrementMaxIncorrect,
                onDecrementMaxIncorrect: onDecrementMaxIncorrect,
              ),
            ],
          ],
        ],
      ),
    );
  }
}
