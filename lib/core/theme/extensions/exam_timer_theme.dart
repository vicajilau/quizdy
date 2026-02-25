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

class ExamTimerTheme extends ThemeExtension<ExamTimerTheme> {
  final Color dialogBackgroundColor;
  final Color dialogTextColor;
  final Color dialogSubTextColor;
  final Color dialogBorderColor;
  final Color dialogButtonColor;
  final Color dialogButtonTextColor;
  final Color dialogShadowColor;
  final Color timerLowColor;
  final Color timerBackgroundColor;
  final Color timerLowBackgroundColor;
  final Color dialogCanvasColor;

  const ExamTimerTheme({
    required this.dialogBackgroundColor,
    required this.dialogTextColor,
    required this.dialogSubTextColor,
    required this.dialogBorderColor,
    required this.dialogButtonColor,
    required this.dialogButtonTextColor,
    required this.dialogShadowColor,
    required this.timerLowColor,
    required this.timerBackgroundColor,
    required this.timerLowBackgroundColor,
    required this.dialogCanvasColor,
  });

  @override
  ExamTimerTheme copyWith({
    Color? dialogBackgroundColor,
    Color? dialogTextColor,
    Color? dialogSubTextColor,
    Color? dialogBorderColor,
    Color? dialogButtonColor,
    Color? dialogButtonTextColor,
    Color? dialogShadowColor,
    Color? timerLowColor,
    Color? timerBackgroundColor,
    Color? timerLowBackgroundColor,
    Color? dialogCanvasColor,
  }) {
    return ExamTimerTheme(
      dialogBackgroundColor:
          dialogBackgroundColor ?? this.dialogBackgroundColor,
      dialogTextColor: dialogTextColor ?? this.dialogTextColor,
      dialogSubTextColor: dialogSubTextColor ?? this.dialogSubTextColor,
      dialogBorderColor: dialogBorderColor ?? this.dialogBorderColor,
      dialogButtonColor: dialogButtonColor ?? this.dialogButtonColor,
      dialogButtonTextColor:
          dialogButtonTextColor ?? this.dialogButtonTextColor,
      dialogShadowColor: dialogShadowColor ?? this.dialogShadowColor,
      timerLowColor: timerLowColor ?? this.timerLowColor,
      timerBackgroundColor: timerBackgroundColor ?? this.timerBackgroundColor,
      timerLowBackgroundColor:
          timerLowBackgroundColor ?? this.timerLowBackgroundColor,
      dialogCanvasColor: dialogCanvasColor ?? this.dialogCanvasColor,
    );
  }

  @override
  ExamTimerTheme lerp(ThemeExtension<ExamTimerTheme>? other, double t) {
    if (other is! ExamTimerTheme) {
      return this;
    }
    return ExamTimerTheme(
      dialogBackgroundColor: Color.lerp(
        dialogBackgroundColor,
        other.dialogBackgroundColor,
        t,
      )!,
      dialogTextColor: Color.lerp(dialogTextColor, other.dialogTextColor, t)!,
      dialogSubTextColor: Color.lerp(
        dialogSubTextColor,
        other.dialogSubTextColor,
        t,
      )!,
      dialogBorderColor: Color.lerp(
        dialogBorderColor,
        other.dialogBorderColor,
        t,
      )!,
      dialogButtonColor: Color.lerp(
        dialogButtonColor,
        other.dialogButtonColor,
        t,
      )!,
      dialogButtonTextColor: Color.lerp(
        dialogButtonTextColor,
        other.dialogButtonTextColor,
        t,
      )!,
      dialogShadowColor: Color.lerp(
        dialogShadowColor,
        other.dialogShadowColor,
        t,
      )!,
      timerLowColor: Color.lerp(timerLowColor, other.timerLowColor, t)!,
      timerBackgroundColor: Color.lerp(
        timerBackgroundColor,
        other.timerBackgroundColor,
        t,
      )!,
      timerLowBackgroundColor: Color.lerp(
        timerLowBackgroundColor,
        other.timerLowBackgroundColor,
        t,
      )!,
      dialogCanvasColor: Color.lerp(
        dialogCanvasColor,
        other.dialogCanvasColor,
        t,
      )!,
    );
  }
}

extension ExamTimerThemeContext on BuildContext {
  ExamTimerTheme get examTimerTheme =>
      Theme.of(this).extension<ExamTimerTheme>()!;
}
