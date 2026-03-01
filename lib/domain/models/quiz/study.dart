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

import 'package:quizdy/domain/models/quiz/study_content.dart';

/// Wraps the overall study section mapped to the JSON schema.
class Study {
  /// Contains the core interactive generative learning state mapped under 'content'.
  final StudyContent content;

  /// Constructor for a `Study`.
  const Study({required this.content});

  /// Creates a `Study` instance from a JSON map.
  ///
  /// - [json]: The JSON map containing the study block data.
  /// - Returns: A populated `Study` instance.
  factory Study.fromJson(Map<String, dynamic> json) {
    return Study(
      content: StudyContent.fromJson(
        json['content'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  /// Converts the `Study` instance to a JSON map.
  ///
  /// - Returns: A JSON map representation.
  Map<String, dynamic> toJson() {
    return {'content': content.toJson()};
  }

  /// Creates a copy of the `Study` with optional parameter modifications.
  Study copyWith({StudyContent? content}) {
    return Study(content: content ?? this.content.copyWith());
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Study && other.content == content;
  }

  @override
  int get hashCode => content.hashCode;

  @override
  String toString() => 'Study(content: $content)';
}
