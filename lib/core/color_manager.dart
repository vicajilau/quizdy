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

import 'dart:math';

import 'package:flutter/material.dart';

class ColorManager {
  final Map<String, Color> _colorMap = {};
  final Set<Color> _usedColors = {};

  /// If the process name is already in the map, return the corresponding color.
  /// Otherwise, generate a new color and add it to the map.
  Color getColorForProcess(String processName) {
    if (_colorMap.containsKey(processName)) {
      return _colorMap[processName]!;
    }

    Color newColor = _generateUniquePastelColor();
    _colorMap[processName] = newColor;
    _usedColors.add(newColor);
    return newColor;
  }

  /// Generate a pastel color that has not been used 100 times.
  /// If it fails 100 times a random color is generated.
  Color _generateUniquePastelColor() {
    const int maxAttempts = 100;
    for (int i = 0; i < maxAttempts; i++) {
      final pastelColor = _generatePastelColor();
      if (!_usedColors.contains(pastelColor)) {
        return pastelColor;
      }
    }
    return _generatePastelColor();
  }

  /// Generate a random pastel color.
  Color _generatePastelColor() {
    final Random random = Random();
    int r = (random.nextInt(128) + 127); // 127–255
    int g = (random.nextInt(128) + 127);
    int b = (random.nextInt(128) + 127);
    return Color.fromARGB(255, r, g, b);
  }
}
