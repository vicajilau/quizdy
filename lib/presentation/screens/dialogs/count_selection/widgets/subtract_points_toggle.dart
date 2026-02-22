import 'package:flutter/material.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';

class SubtractPointsToggle extends StatelessWidget {
  final bool isDark;
  final Color textColor;
  final Color subTextColor;
  final Color primaryColor;
  final bool subtractPoints;
  final ValueChanged<bool> onSubtractPointsChanged;

  const SubtractPointsToggle({
    super.key,
    required this.isDark,
    required this.textColor,
    required this.subTextColor,
    required this.primaryColor,
    required this.subtractPoints,
    required this.onSubtractPointsChanged,
  });

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 2),
                Text(
                  subtractPoints
                      ? AppLocalizations.of(context)!.subtractPointsDescription
                      : AppLocalizations.of(
                          context,
                        )!.subtractPointsOffDescription,
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
}
