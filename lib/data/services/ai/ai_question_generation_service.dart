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

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizlab_ai/data/services/configuration_service.dart';
import 'package:quizlab_ai/data/services/ai/ai_service.dart';
import 'package:quizlab_ai/data/services/ai/gemini_service.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/ai/openai_content_block.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';

import 'package:quizlab_ai/domain/models/ai/ai_generation_config.dart';
import 'package:quizlab_ai/domain/models/ai/ai_question_type.dart';
import 'package:quizlab_ai/domain/models/ai/ai_generation_category.dart';

class AiQuestionGenerationService {
  static const String _openaiApiUrl =
      'https://api.openai.com/v1/chat/completions';

  /// Generates questions using AI based on the provided configuration
  Future<List<Question>> generateQuestions(
    AiQuestionGenerationConfig config, {
    AppLocalizations? localizations,
  }) async {
    try {
      // If a preferred service is specified, use it directly
      if (config.preferredService != null && localizations != null) {
        return await _generateWithService(
          config,
          config.preferredService!,
          localizations,
        );
      }

      // Verify that at least one API key is configured
      final openaiKey = await ConfigurationService.instance.getOpenAIApiKey();
      final geminiKey = await ConfigurationService.instance.getGeminiApiKey();

      if ((openaiKey?.isEmpty ?? true) && (geminiKey?.isEmpty ?? true)) {
        throw Exception('No API key configured for AI services');
      }

      // Try OpenAI first, then Gemini if it fails
      if (openaiKey?.isNotEmpty == true) {
        try {
          return await _generateWithOpenAI(config, openaiKey!, localizations!);
        } catch (e) {
          if (geminiKey?.isNotEmpty == true) {
            return await _generateWithGemini(
              config,
              geminiKey!,
              localizations!,
            );
          }
          rethrow;
        }
      } else if (geminiKey?.isNotEmpty == true) {
        return await _generateWithGemini(config, geminiKey!, localizations!);
      }

      throw Exception('Could not generate questions with any AI service');
    } catch (e) {
      rethrow;
    }
  }

  /// Generates questions using the specified AI service
  Future<List<Question>> _generateWithService(
    AiQuestionGenerationConfig config,
    AIService aiService,
    AppLocalizations localizations,
  ) async {
    final prompt = _buildPrompt(config);

    try {
      final String response;
      if (config.hasFile) {
        response = await aiService.getChatResponseWithFile(
          prompt,
          localizations,
          model: config.preferredModel,
          file: config.file!,
        );
      } else {
        response = await aiService.getChatResponse(
          prompt,
          localizations,
          model: config.preferredModel,
        );
      }
      return _parseAiResponse(response);
    } catch (e) {
      rethrow; // Let the service handle its own errors
    }
  }

  /// Generates questions using OpenAI
  Future<List<Question>> _generateWithOpenAI(
    AiQuestionGenerationConfig config,
    String apiKey,
    AppLocalizations localizations,
  ) async {
    final prompt = _buildPrompt(config);

    final Map<String, Object> userMessage;
    if (config.hasFile) {
      final contentBlocks = OpenAIContentBlock.fromPromptAndFile(
        prompt,
        config.file!,
      );
      userMessage = {
        'role': 'user',
        'content': contentBlocks.map((b) => b.toJson()).toList(),
      };
    } else {
      userMessage = {'role': 'user', 'content': prompt};
    }

    final response = await http.post(
      Uri.parse(_openaiApiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {
            'role': 'system',
            'content':
                'You are an expert in education who creates high-quality quiz questions. Respond ONLY with the requested JSON, without additional text.',
          },
          userMessage,
        ],
        'max_tokens': 3000,
        'temperature': 0.7,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(localizations.aiErrorResponse);
    }

    final jsonResponse = jsonDecode(response.body);
    final content = jsonResponse['choices'][0]['message']['content'];

    return _parseAiResponse(content);
  }

  /// Generates questions using Gemini
  Future<List<Question>> _generateWithGemini(
    AiQuestionGenerationConfig config,
    String apiKey,
    AppLocalizations localizations,
  ) async {
    final prompt = _buildPrompt(config);
    final systemInstruction =
        'You are an expert in education who creates high-quality quiz questions. Respond ONLY with the requested JSON, without additional text.';
    final fullPrompt = '$systemInstruction\n\n$prompt';

    try {
      final String response;
      if (config.hasFile) {
        response = await GeminiService.instance.getChatResponseWithFile(
          fullPrompt,
          localizations,
          model: config.preferredModel,
          file: config.file!,
        );
      } else {
        response = await GeminiService.instance.getChatResponse(
          fullPrompt,
          localizations,
          model: config.preferredModel,
        );
      }
      return _parseAiResponse(response);
    } catch (e) {
      // GeminiService handles its own errors, we just rethrow to the caller
      // or handle specific cases if needed.
      rethrow;
    }
  }

  /// Builds the prompt for the AI
  String _buildPrompt(AiQuestionGenerationConfig config) {
    final questionCountText = config.questionCount != null
        ? 'exactly ${config.questionCount}'
        : 'between 3 and 8';

    final questionTypesText = _getQuestionTypesPrompt(config.questionTypes);
    final languageText = _getLanguageName(config.language);

    String header;
    if (config.hasFile) {
      final userComments = config.content.trim();
      final commentsSection = userComments.isNotEmpty
          ? '\nADDITIONAL INSTRUCTIONS FROM THE USER:\n$userComments\n'
          : '';
      header =
          '''
          Based on the attached file, generate $questionCountText quiz questions $questionTypesText in $languageText.
          $commentsSection''';
    } else if (config.isTopicMode) {
      header =
          '''
          The user wants quiz questions about the following topic/s: ${config.content}

          Generate $questionCountText creative and in-depth quiz questions $questionTypesText in $languageText.
          Go beyond surface-level knowledge — create questions that test deeper understanding, explore interesting aspects of these subjects, and encourage critical thinking.
          ''';
    } else {
      header =
          '''
          Based on the following content, generate $questionCountText quiz questions $questionTypesText in $languageText.

          CONTENT:
          ${config.content}
          ''';
    }

    final sourceReference = config.hasFile
        ? 'the content of the attached file'
        : config.isTopicMode
        ? 'the provided topics'
        : 'the provided content';

    String categoryInstructions = '';
    switch (config.generationCategory) {
      case AiGenerationCategory.theory:
        categoryInstructions =
            '7. CONCEPTUAL FOCUS: Questions must be strictly about theory, concepts, definitions, and facts. AVOID any calculations, code-writing exercises, or practical development tasks. If the content contains existing exercises, use them ONLY to understand what knowledge is being tested, but DO NOT ask questions about the exercises themselves.';
        break;
      case AiGenerationCategory.exercises:
        categoryInstructions =
            '7. PRACTICAL FOCUS: Questions should be practical exercises, problem-solving tasks, or implementation questions. You MAY reuse or adapt existing exercises found in the content, or generate NEW ones that follow a similar pattern and difficulty level.';
        break;
      case AiGenerationCategory.both:
        categoryInstructions =
            '7. MIXED FOCUS: Provide a balanced mix of theoretical concepts (theory, concepts, definitions, and facts) and practical exercises (practical exercises, problem-solving tasks, or implementation questions). Theoretical questions should focus on facts and definitions, while practical questions can be reused from the content or newly generated following the same style and difficulty.';
        break;
    }

    return '''
$header
INSTRUCTIONS:
1. Questions must be based specifically on $sourceReference
2. Each question must have exactly 4 answer options
3. Include a clear explanation for each question
4. Make sure incorrect answers are plausible but clearly wrong
5. Explanations should be educational and help understand why the answer is correct
6. SELF-CONTAINED QUESTIONS: All questions must be fully self-contained so they can be answered without looking at the original source material. If you reuse an existing exercise, make sure to include all necessary context (text, variables, or descriptions) within the question itself. DO NOT reference specific exercise numbers or labels from the source text (e.g., instead of 'In exercise 17...', say 'Given the following scenario...').
$categoryInstructions

RESPONSE FORMAT (JSON):
Respond ONLY with a valid JSON array in this exact format:
[
  {
    "text": "Question here?",
    "type": "multiple_choice",
    "options": ["Option A", "Option B", "Option C", "Option D"],
    "correctAnswers": [0],
    "explanation": "Detailed explanation of why answer A is correct..."
  }
]

QUESTION TYPES:
- "multiple_choice": Allows multiple correct answers
- "single_choice": Only one correct answer
- "true_false": True/false question (options: ["True", "False"])
- "essay": Essay question ("options" and "correctAnswers" must be [])

$questionTypesText

IMPORTANT!: Respond ONLY with the JSON, no additional text before or after.
''';
  }

  /// Gets the prompt text according to the selected question types
  String _getQuestionTypesPrompt(List<AiQuestionType> types) {
    const typePrompts = {
      AiQuestionType.multipleChoice:
          'Use ONLY the "multiple_choice" type for all questions.',
      AiQuestionType.singleChoice:
          'Use ONLY the "single_choice" type for all questions.',
      AiQuestionType.trueFalse:
          'Use ONLY the "true_false" type for all questions. Options must be ["True", "False"].',
      AiQuestionType.essay:
          'Use ONLY the "essay" type for all questions. "options" and "correctAnswers" MUST be empty arrays [].',
      AiQuestionType.random:
          'Mix different question types: "multiple_choice", "single_choice", "true_false", and "essay".',
    };

    if (types.contains(AiQuestionType.random) || types.isEmpty) {
      return typePrompts[AiQuestionType.random]!;
    }

    if (types.length == 1) {
      return typePrompts[types.first]!;
    }

    final typeNames = types
        .map((t) {
          switch (t) {
            case AiQuestionType.multipleChoice:
              return '"multiple_choice"';
            case AiQuestionType.singleChoice:
              return '"single_choice"';
            case AiQuestionType.trueFalse:
              return '"true_false"';
            case AiQuestionType.essay:
              return '"essay"';
            case AiQuestionType.random:
              return '';
          }
        })
        .where((name) => name.isNotEmpty)
        .join(', ');

    return 'Mix these question types: $typeNames.';
  }

  /// Gets the language name
  String _getLanguageName(String langCode) {
    switch (langCode) {
      case 'es':
        return 'Spanish';
      case 'en':
        return 'English';
      case 'fr':
        return 'French';
      case 'de':
        return 'German';
      case 'el':
        return 'Greek';
      case 'it':
        return 'Italian';
      case 'pt':
        return 'Portuguese';
      case 'ca':
        return 'Catalan';
      case 'eu':
        return 'Basque';
      case 'gl':
        return 'Galician';
      case 'hi':
        return 'Hindi';
      case 'zh':
        return 'Chinese';
      case 'ar':
        return 'Arabic';
      case 'ja':
        return 'Japanese';
      default:
        return 'English';
    }
  }

  /// Parses the AI response and converts to Question objects
  List<Question> _parseAiResponse(String content) {
    try {
      // Clean the response in case it has additional text
      String cleanContent = content.trim();

      // Search for JSON in the response
      final startIndex = cleanContent.indexOf('[');
      final endIndex = cleanContent.lastIndexOf(']');

      if (startIndex == -1 || endIndex == -1) {
        throw Exception('No valid JSON found in AI response');
      }

      cleanContent = cleanContent.substring(startIndex, endIndex + 1);

      final List<dynamic> jsonList = jsonDecode(cleanContent);
      final List<Question> questions = [];

      for (final item in jsonList) {
        if (item is Map<String, dynamic>) {
          try {
            final question = _createQuestionFromJson(item);
            questions.add(question);
          } catch (e) {
            // If one question fails, continue with the others
            // In production, use appropriate logging
            continue;
          }
        }
      }

      if (questions.isEmpty) {
        throw Exception('Could not create valid questions from AI response');
      }

      return questions;
    } catch (e) {
      throw Exception('Could not create valid questions from AI response');
    }
  }

  /// Creates a Question object from JSON
  Question _createQuestionFromJson(Map<String, dynamic> json) {
    final questionType = QuestionType.fromString(
      json['type'] ?? 'multiple_choice',
    );

    List<String> options = [];
    if (questionType == QuestionType.essay) {
      options = [];
    } else if (json['options'] != null) {
      options = List<String>.from(json['options']);
    } else if (questionType == QuestionType.trueFalse) {
      options = ['True', 'False'];
    }

    List<int> correctAnswers = [];
    if (questionType == QuestionType.essay) {
      correctAnswers = [];
    } else if (json['correctAnswers'] != null) {
      correctAnswers = List<int>.from(json['correctAnswers']);
    } else if (questionType == QuestionType.trueFalse) {
      // For true/false, assume the first option is correct if not specified
      correctAnswers = [0];
    }

    return Question(
      type: questionType,
      text: json['text'] ?? '',
      options: options,
      correctAnswers: correctAnswers,
      explanation: json['explanation'] ?? '',
      image: null, // AI doesn't generate images for now
    );
  }

  /// Builds a prompt for the AI chat assistant when a student asks about a question.
  static String buildChatPrompt({
    required Question question,
    required String userQuestion,
    required AppLocalizations localizations,
  }) {
    String prompt = localizations.aiPrompt;
    prompt += '\n\n';
    prompt += '${localizations.aiChatGuardrail}\n\n';
    prompt += '${localizations.questionLabel}: ${question.text}\n';

    if (question.options.isNotEmpty && question.type != QuestionType.essay) {
      prompt += '${localizations.optionsLabel}:\n';
      for (int i = 0; i < question.options.length; i++) {
        final letter = String.fromCharCode(65 + i); // A, B, C, etc.
        prompt += '$letter) ${question.options[i]}\n';
      }
    }

    if (question.explanation.isNotEmpty) {
      prompt +=
          '\n${localizations.explanationLabel}: ${question.explanation}\n';
    }

    // Add chat history context if needed, for now just the new question
    prompt += '\n${localizations.studentComment}: "$userQuestion"';

    return prompt;
  }

  static String buildEvaluationPrompt(
    String questionText,
    String studentAnswer,
    String explanation,
    AppLocalizations localizations,
  ) {
    final hasExplanation = explanation.isNotEmpty;

    String prompt =
        '''
${localizations.aiEvaluationPromptSystemRole}

${localizations.aiEvaluationPromptQuestion}
$questionText

${localizations.aiEvaluationPromptStudentAnswer}
$studentAnswer
''';

    if (hasExplanation) {
      prompt +=
          '''

${localizations.aiEvaluationPromptCriteria}
$explanation

${localizations.aiEvaluationPromptSpecificInstructions}
''';
    } else {
      prompt +=
          '''

${localizations.aiEvaluationPromptGeneralInstructions}
''';
    }

    prompt +=
        '''

${localizations.aiEvaluationPromptResponseFormat}

CRITICAL: You MUST respond ONLY with a valid JSON object in this exact format:
{
  "score": <integer from 0 to 100>,
  "feedback": "<your detailed evaluation following the RESPONSE FORMAT rules above, formatted as a string>"
}
Do not include markdown blocks, explanations outside the JSON, or any other text.
IMPORTANT: Respond strictly in the same language as the student's answer.
''';

    return prompt;
  }
}
