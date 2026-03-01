import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:quizdy/domain/models/quiz/quiz_file.dart';
import 'package:quizdy/domain/models/quiz/study_chunk_state.dart';

void main() {
  group('QuizFile with Study Model Data', () {
    late Map<String, dynamic> jsonMap;
    late String filePath;

    setUpAll(() async {
      final file = File('sample.quiz');
      if (!await file.exists()) {
        fail('sample.quiz not found. Make sure tests run from project root.');
      }
      final content = await file.readAsString();
      jsonMap = jsonDecode(content) as Map<String, dynamic>;
      filePath = file.path;
    });

    test('should parse correctly into Dart Models', () {
      final quizFile = QuizFile.fromJson(jsonMap, filePath: filePath);

      expect(quizFile.metadata.title, 'Comprehensive Quiz (Long & Short)');
      expect(quizFile.questions.length, 11);
      expect(quizFile.study, isNotNull);

      final studyContent = quizFile.study!.content;
      expect(studyContent.coveragePercentage, 30.5);
      expect(studyContent.totalChunks, 10);
      expect(studyContent.cache.length, 1);

      final firstChunk = studyContent.cache.first;
      expect(firstChunk.status, StudyChunkState.completed);
      expect(firstChunk.slides?.length, 2);
    });

    test('should serialize maintaining study property', () {
      final quizFile = QuizFile.fromJson(jsonMap, filePath: filePath);
      final serializedJson = quizFile.toJson();

      expect(serializedJson.containsKey('study'), true);

      // We can also perform a deeper equivalence check comparing
      // the reserialized version vs the original parsed structure
      final reserializedQuizFile = QuizFile.fromJson(
        serializedJson,
        filePath: filePath,
      );
      expect(reserializedQuizFile, equals(quizFile));
    });
  });
}
