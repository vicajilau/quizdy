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

import 'package:flutter_test/flutter_test.dart';
import 'package:quizdy/data/services/ai/ai_document_chunking_service.dart';
import 'package:quizdy/core/l10n/app_localizations.dart';

class MockAppLocalizations implements AppLocalizations {
  @override
  String get aiErrorResponse => 'AI Error Response';
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  // Nota: Al usar GeminiService de forma directa en el AiDocumentChunkingService
  // que es un singleton estático, la prueba unitaria ideal usaría GetIt o inyección.
  // Por ahora lo probaremos con el fallback de Exception si no hay Token provisto
  // o haciendo mock del resultado de _parseJsonToSourceReferences mediante un proxy si se refactoriza.

  // Como `_parseJsonToSourceReferences` es privado, debemos simular su comportamiento
  // comprobado mediante reflection o probando el manejo de errores generales.
  test(
    'Handling empty API keys throws Exception smoothly depending on config',
    () async {
      final localizations = MockAppLocalizations();

      // As Gemini token isn't provided here, we expect an exception describing the context
      // instead of an application crash.
      await expectLater(
        () => AiDocumentChunkingService.instance.chunkDocument(
          'Test text',
          'doc1',
          localizations,
        ),
        throwsA(isA<Exception>()),
      );
    },
  );
}
