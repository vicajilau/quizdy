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

import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/ai/ai_file_attachment.dart';

abstract class AIService {
  /// Obtiene una respuesta del servicio de IA basado en el prompt proporcionado
  Future<String> getChatResponse(
    String prompt,
    AppLocalizations localizations, {
    String? model,
  });

  /// Obtiene una respuesta del servicio de IA enviando un fichero adjunto
  Future<String> getChatResponseWithFile(
    String prompt,
    AppLocalizations localizations, {
    String? model,
    required AiFileAttachment file,
  });

  /// Verifica si el servicio está disponible (tiene API key configurada)
  Future<bool> isAvailable();

  /// Obtiene el nombre del servicio para mostrar en la UI
  String get serviceName;

  /// Obtiene el modelo por defecto del servicio
  String get defaultModel;

  /// Obtiene la lista de modelos disponibles para este servicio
  List<String> get availableModels;
}
