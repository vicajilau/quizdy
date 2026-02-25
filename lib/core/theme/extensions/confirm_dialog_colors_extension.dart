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

/// General-purpose semantic color tokens resolved by theme.
///
/// Eliminates the repeated `isDark ? X : Y` pattern across views.
/// Access via `context.appColors.title`, `context.appColors.subtitle`, etc.
class ConfirmingDialogColorsExtension
    extends ThemeExtension<ConfirmingDialogColorsExtension> {
  /// Card / dialog background color.
  final Color card;

  /// Primary heading text color.
  final Color title;

  /// Secondary text, close-button icons, labels.
  final Color subtitle;

  /// Elevated surface within a card (controls, close buttons, toggle sections).
  final Color surface;

  /// Standard border color.
  final Color border;

  const ConfirmingDialogColorsExtension({
    required this.card,
    required this.title,
    required this.subtitle,
    required this.surface,
    required this.border,
  });

  @override
  ConfirmingDialogColorsExtension copyWith({
    Color? card,
    Color? title,
    Color? subtitle,
    Color? surface,
    Color? border,
  }) {
    return ConfirmingDialogColorsExtension(
      card: card ?? this.card,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      surface: surface ?? this.surface,
      border: border ?? this.border,
    );
  }

  @override
  ConfirmingDialogColorsExtension lerp(
    ThemeExtension<ConfirmingDialogColorsExtension>? other,
    double t,
  ) {
    if (other is! ConfirmingDialogColorsExtension) {
      return this;
    }
    return ConfirmingDialogColorsExtension(
      card: Color.lerp(card, other.card, t)!,
      title: Color.lerp(title, other.title, t)!,
      subtitle: Color.lerp(subtitle, other.subtitle, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}

extension AppColorsContext on BuildContext {
  ConfirmingDialogColorsExtension get appColors =>
      Theme.of(this).extension<ConfirmingDialogColorsExtension>()!;
}
