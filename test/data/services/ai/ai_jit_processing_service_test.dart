import 'package:flutter_test/flutter_test.dart';
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/data/services/ai/ai_jit_processing_service.dart';
import 'package:quizdy/domain/models/quiz/source_reference.dart';
import 'package:quizdy/domain/models/quiz/study_chunk.dart';
import 'package:quizdy/domain/models/quiz/study_chunk_state.dart';

class MockAppLocalizations implements AppLocalizations {
  @override
  String get aiErrorResponse => 'AI Error Response';
  @override
  String get documentTooLongForProcessing => 'Document length error';
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late AiJitProcessingService service;
  late MockAppLocalizations mockLocalizations;

  setUp(() {
    service = AiJitProcessingService.instance;
    mockLocalizations = MockAppLocalizations();
  });

  group('AiJitProcessingService', () {
    test('processChunk ignores already completed chunks', () async {
      final chunk = const StudyChunk(
        chunkIndex: 0,
        status: StudyChunkState.completed,
        sourceReference: SourceReference(
          documentId: 'doc_1',
          startPage: 1,
          endPage: 1,
          startOffset: 0,
          endOffset: 10,
          blockType: 'test',
        ),
      );

      final result = await service.processChunk(
        chunk,
        '0123456789',
        mockLocalizations,
      );

      expect(result.status, StudyChunkState.completed);
      expect(result, equals(chunk));
    });

    test(
      'safe string extraction handles out-of-bounds offsets gracefully',
      () async {
        final emptyChunk = const StudyChunk(
          chunkIndex: 2,
          status: StudyChunkState.processing,
          sourceReference: SourceReference(
            documentId: 'doc_1',
            startPage: 1,
            endPage: 1,
            startOffset: 5,
            endOffset: 5, // 0 length
            blockType: 'test',
          ),
        );

        final result = await service.processChunk(
          emptyChunk,
          '0123456789',
          mockLocalizations,
        );

        // Empty text should fail safely without calling the API
        expect(result.status, StudyChunkState.error);
      },
    );
  });
}
