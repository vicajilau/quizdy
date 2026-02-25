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
import 'package:quizlab_ai/core/theme/app_theme.dart';

enum QuizlabAIButtonType { primary, secondary, tertiary, warning }

enum QuizlabAIButtonSize { normal }

extension on QuizlabAIButtonSize {
  EdgeInsets get padding => switch (this) {
    QuizlabAIButtonSize.normal => const EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 28.0,
    ),
  };
}

extension _ButtonColors on ThemeData {
  Color enabledButtonColor(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.primary => AppTheme.primaryColor,
    QuizlabAIButtonType.secondary => cardColor,
    QuizlabAIButtonType.tertiary => Colors.transparent,
    QuizlabAIButtonType.warning => AppTheme.errorColor,
  };

  Color disabledButtonColor(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.primary => AppTheme.zinc700,
    QuizlabAIButtonType.secondary => cardColor.withValues(alpha: .5),
    QuizlabAIButtonType.tertiary => Colors.transparent,
    QuizlabAIButtonType.warning => AppTheme.errorColor.withValues(alpha: .5),
  };

  Color enabledTextColor(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.primary => Colors.white,
    QuizlabAIButtonType.secondary => colorScheme.onSurface,
    QuizlabAIButtonType.tertiary => AppTheme.primaryColor,
    QuizlabAIButtonType.warning => Colors.white,
  };

  Color disabledTextColor(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.primary => Colors.white,
    QuizlabAIButtonType.secondary => colorScheme.onSurface.withValues(
      alpha: .5,
    ),
    QuizlabAIButtonType.tertiary => AppTheme.zinc400,
    QuizlabAIButtonType.warning => Colors.white.withValues(alpha: 0.5),
  };

  Color enabledBorderColor(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.primary => AppTheme.primaryColor,
    QuizlabAIButtonType.secondary => dividerColor,
    QuizlabAIButtonType.tertiary => Colors.transparent,
    QuizlabAIButtonType.warning => AppTheme.errorColor,
  };

  Color disabledBorderColor(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.primary => AppTheme.zinc700,
    QuizlabAIButtonType.secondary => dividerColor.withValues(alpha: .5),
    QuizlabAIButtonType.tertiary => Colors.transparent,
    QuizlabAIButtonType.warning => AppTheme.errorColor.withValues(alpha: .5),
  };

  Color loaderColor(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.primary => Colors.white,
    QuizlabAIButtonType.secondary => AppTheme.zinc200,
    QuizlabAIButtonType.tertiary => AppTheme.primaryColor,
    QuizlabAIButtonType.warning => Colors.white,
  };

  double borderWidth(QuizlabAIButtonType type) => switch (type) {
    QuizlabAIButtonType.secondary => 2,
    _ => 1,
  };
}

class QuizLabAIButton extends StatelessWidget {
  final QuizlabAIButtonType type;
  final QuizlabAIButtonSize size;
  final String title;
  final bool isLoading;
  final VoidCallback? onPressed;
  final bool expanded;
  final IconData? icon;
  final Color? backgroundColor;

  static const double _maxWidth = 620;

  const QuizLabAIButton({
    super.key,
    this.type = QuizlabAIButtonType.primary,
    this.size = QuizlabAIButtonSize.normal,
    this.title = '',
    this.isLoading = false,
    this.onPressed,
    this.expanded = false,
    this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabled = onPressed == null;

    final bgColor = disabled
        ? (backgroundColor?.withValues(alpha: 0.5) ??
              theme.disabledButtonColor(type))
        : (backgroundColor ?? theme.enabledButtonColor(type));
    final textColor = isLoading
        ? Colors.transparent
        : disabled
        ? theme.disabledTextColor(type)
        : theme.enabledTextColor(type);
    final borderColor = disabled
        ? (backgroundColor?.withValues(alpha: 0.5) ??
              theme.disabledBorderColor(type))
        : (backgroundColor ?? theme.enabledBorderColor(type));

    final button = ElevatedButton(
      onPressed: isLoading ? () {} : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(expanded ? double.maxFinite : 0, 0),
        padding: size.padding,
        backgroundColor: bgColor,
        disabledBackgroundColor:
            backgroundColor?.withValues(alpha: 0.5) ??
            theme.disabledButtonColor(type),
        surfaceTintColor: backgroundColor != null
            ? Colors.transparent
            : bgColor,
        foregroundColor: backgroundColor != null ? Colors.white : null,
        shadowColor: Colors.transparent,
        overlayColor: type == QuizlabAIButtonType.tertiary
            ? Colors.transparent
            : null,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: borderColor, width: theme.borderWidth(type)),
      ),
      child: Row(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );

    Widget result = Stack(
      children: [
        button,
        if (isLoading)
          Positioned.fill(
            child: Center(
              child: Transform.scale(
                scale: 0.7,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(theme.loaderColor(type)),
                ),
              ),
            ),
          ),
      ],
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _maxWidth),
      child: result,
    );
  }
}
