import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/count_control_button.dart';

class MaxIncorrectLimitInput extends StatefulWidget {
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
  final ValueChanged<bool>? onMaxIncorrectErrorChanged;

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
    this.onMaxIncorrectErrorChanged,
  });

  @override
  State<MaxIncorrectLimitInput> createState() => _MaxIncorrectLimitInputState();
}

class _MaxIncorrectLimitInputState extends State<MaxIncorrectLimitInput> {
  bool _hasError = false;

  void _updateError(bool hasError) {
    if (_hasError != hasError) {
      _hasError = hasError;
      if (widget.onMaxIncorrectErrorChanged != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            widget.onMaxIncorrectErrorChanged!(hasError);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final errorColor = Theme.of(context).colorScheme.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.maxIncorrectAnswersLimitLabel,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: widget.subTextColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: widget.controlBgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hasError
                  ? errorColor
                  : widget.borderColor.withValues(alpha: 0.5),
              width: _hasError ? 1.5 : 1.0,
            ),
          ),
          child: Row(
            children: [
              CountControlButton(
                icon: LucideIcons.minus,
                onTap: widget.onDecrementMaxIncorrect,
                bgColor: widget.isDark
                    ? AppTheme.zinc900.withValues(alpha: 0.5)
                    : Colors.white,
                iconColor: widget.primaryColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                    child: TextFormField(
                      controller: widget.maxIncorrectAnswersController,
                      focusNode: widget.maxIncorrectAnswersFocusNode,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: widget.textColor,
                      ),
                      decoration: const InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        errorStyle: TextStyle(height: 0, fontSize: 0),
                      ),
                      onChanged: (value) {
                        final val = int.tryParse(value);
                        if (val != null && val >= 0) {
                          widget.onMaxIncorrectAnswersLimitChanged(val);
                        }
                      },
                      validator: (value) {
                        bool hasError = false;

                        if (value == null || value.isEmpty) {
                          hasError = true;
                        } else {
                          final newVal = int.tryParse(value);
                          if (newVal == null || newVal < 0) {
                            hasError = true;
                          }
                        }

                        _updateError(hasError);
                        return hasError ? '' : null;
                      },
                      autovalidateMode: AutovalidateMode.always,
                    ),
                  ),
                ),
              ),
              CountControlButton(
                icon: LucideIcons.plus,
                onTap: widget.onIncrementMaxIncorrect,
                bgColor: widget.isDark
                    ? AppTheme.zinc900.withValues(alpha: 0.5)
                    : Colors.white,
                iconColor: widget.primaryColor,
              ),
            ],
          ),
        ),
        if (_hasError) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              AppLocalizations.of(context)!.validationMin0GenericError,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: errorColor,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
