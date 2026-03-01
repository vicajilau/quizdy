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

import 'package:flutter/foundation.dart';
import 'package:quizdy/domain/models/quiz/ui_element.dart';

/// Represents a single slide or view within a study sequence, containing multiple UI elements.
class Slide {
  /// The collection of elements that make up the slide's layout.
  final List<UiElement> uiElements;

  /// Constructor for a `Slide`.
  const Slide({required this.uiElements});

  /// Creates a `Slide` instance from a JSON map.
  ///
  /// - [json]: The JSON map containing the slide data.
  /// - Returns: A populated `Slide` instance.
  factory Slide.fromJson(Map<String, dynamic> json) {
    final uiElementsJson = json['ui_elements'] as List<dynamic>? ?? [];
    final uiElements = uiElementsJson
        .map(
          (elementJson) =>
              UiElement.fromJson(elementJson as Map<String, dynamic>),
        )
        .toList();

    return Slide(uiElements: uiElements);
  }

  /// Converts the `Slide` instance to a JSON map.
  ///
  /// - Returns: A JSON map representation.
  Map<String, dynamic> toJson() {
    return {
      'ui_elements': uiElements.map((element) => element.toJson()).toList(),
    };
  }

  /// Creates a deep copy of the `Slide` with optional parameter modifications.
  Slide copyWith({List<UiElement>? uiElements}) {
    return Slide(
      uiElements:
          uiElements ?? this.uiElements.map((e) => e.copyWith()).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Slide && listEquals(other.uiElements, uiElements);
  }

  @override
  int get hashCode => Object.hashAll(uiElements);

  @override
  String toString() => 'Slide(uiElements: ${uiElements.length})';
}
