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

class HomeTheme extends ThemeExtension<HomeTheme> {
  final Color dropZoneShadowColor;

  const HomeTheme({required this.dropZoneShadowColor});

  @override
  HomeTheme copyWith({Color? dropZoneShadowColor}) {
    return HomeTheme(
      dropZoneShadowColor: dropZoneShadowColor ?? this.dropZoneShadowColor,
    );
  }

  @override
  HomeTheme lerp(ThemeExtension<HomeTheme>? other, double t) {
    if (other is! HomeTheme) {
      return this;
    }
    return HomeTheme(
      dropZoneShadowColor: Color.lerp(
        dropZoneShadowColor,
        other.dropZoneShadowColor,
        t,
      )!,
    );
  }
}

extension HomeThemeContext on BuildContext {
  HomeTheme get homeTheme => Theme.of(this).extension<HomeTheme>()!;
}
