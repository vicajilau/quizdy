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

/// DTO representing the saved settings for AI question generation.
class AiGenerationStoredSettings {
  /// The name of the selected AI service (e.g., 'Google Gemini', 'OpenAI').
  final String? serviceName;

  /// The name of the selected model for the service.
  final String? modelName;

  /// The language code selected for generation.
  final String? language;

  /// The number of questions to generate.
  final int? questionCount;

  /// The list of selected question types.
  final List<String>? questionTypes;

  /// The drafted text content.
  final String? draftText;

  /// Creates a new instance of [AiGenerationStoredSettings].
  const AiGenerationStoredSettings({
    this.serviceName,
    this.modelName,
    this.language,
    this.questionCount,
    this.questionTypes,
    this.draftText,
  });
}
