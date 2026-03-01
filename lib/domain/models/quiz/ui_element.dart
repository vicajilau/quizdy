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

/// Represents a UI component element within a slide.
///
/// This flexible structure allows for generative UI definitions based on
/// a `componentType` and arbitrary `props`.
class UiElement {
  /// The type of the UI component to render (e.g., 'ConceptHighlight').
  final String componentType;

  /// The dynamic properties or data for the component.
  final Map<String, dynamic> props;

  /// Constructor for a `UiElement`.
  const UiElement({required this.componentType, required this.props});

  /// Creates a `UiElement` instance from a JSON map.
  ///
  /// - [json]: The JSON map containing the dynamic layout data.
  /// - Returns: A populated `UiElement` instance.
  factory UiElement.fromJson(Map<String, dynamic> json) {
    return UiElement(
      componentType: json['component_type'] as String? ?? 'Unknown',
      props: json['props'] != null
          ? Map<String, dynamic>.from(json['props'])
          : {},
    );
  }

  /// Converts the `UiElement` instance to a JSON map.
  ///
  /// - Returns: A JSON map representation.
  Map<String, dynamic> toJson() {
    return {'component_type': componentType, 'props': props};
  }

  /// Creates a copy of the `UiElement` with optional parameter modifications.
  UiElement copyWith({String? componentType, Map<String, dynamic>? props}) {
    return UiElement(
      componentType: componentType ?? this.componentType,
      props: props ?? Map<String, dynamic>.from(this.props),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UiElement &&
        other.componentType == componentType &&
        mapEquals(other.props, props);
  }

  @override
  int get hashCode =>
      componentType.hashCode ^
      Object.hashAll(props.keys) ^
      Object.hashAll(props.values);

  @override
  String toString() =>
      'UiElement(componentType: $componentType, props: $props)';
}
