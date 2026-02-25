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

class QuestionDialogTheme extends ThemeExtension<QuestionDialogTheme> {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Color closeButtonColor;
  final Color closeIconColor;
  final Color shadowColor;

  const QuestionDialogTheme({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.closeButtonColor,
    required this.closeIconColor,
    required this.shadowColor,
  });

  @override
  QuestionDialogTheme copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    Color? closeButtonColor,
    Color? closeIconColor,
    Color? shadowColor,
  }) {
    return QuestionDialogTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      closeButtonColor: closeButtonColor ?? this.closeButtonColor,
      closeIconColor: closeIconColor ?? this.closeIconColor,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  QuestionDialogTheme lerp(
    ThemeExtension<QuestionDialogTheme>? other,
    double t,
  ) {
    if (other is! QuestionDialogTheme) {
      return this;
    }
    return QuestionDialogTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      closeButtonColor: Color.lerp(
        closeButtonColor,
        other.closeButtonColor,
        t,
      )!,
      closeIconColor: Color.lerp(closeIconColor, other.closeIconColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
    );
  }
}
