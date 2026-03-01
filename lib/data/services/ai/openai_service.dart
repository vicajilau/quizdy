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
import 'package:quizdy/domain/models/ai/ai_file_attachment.dart';
import 'package:quizdy/domain/models/ai/openai_content_block.dart';
import 'package:quizdy/data/services/configuration_service.dart';
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/data/services/ai/ai_service.dart';

class OpenAIService extends AIService {
  static const String _baseUrl = 'https://api.openai.com/v1';
  static const String _chatEndpoint = '/chat/completions';
  static const String _defaultModel = 'gpt-4o-mini';

  static const List<String> _models = [
    'gpt-4o-mini',
    'gpt-4o',
    'gpt-4-turbo',
    'gpt-4',
    'gpt-3.5-turbo',
  ];

  static OpenAIService? _instance;
  static OpenAIService get instance => _instance ??= OpenAIService._();

  OpenAIService._();

  @override
  String get serviceName => 'OpenAI GPT';

  @override
  String get defaultModel => _defaultModel;

  @override
  List<String> get availableModels => _models;

  @override
  Future<bool> isAvailable() async {
    final apiKey = await ConfigurationService.instance.getOpenAIApiKey();
    return apiKey != null && apiKey.isNotEmpty;
  }

  /// Realiza una petición a la API de ChatGPT
  @override
  Future<String> getChatResponse(
    String prompt,
    AppLocalizations localizations, {
    String? model,
    String? responseMimeType,
  }) async {
    final apiKey = await ConfigurationService.instance.getOpenAIApiKey();

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception(localizations.openaiApiKeyNotConfigured);
    }

    final selectedModel = model ?? _defaultModel;

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl$_chatEndpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': selectedModel,
          'messages': [
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 8192,
          'temperature': 0.2,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final content = jsonResponse['choices'][0]['message']['content'];
        return content?.toString().trim() ?? localizations.noResponseReceived;
      } else if (response.statusCode == 401) {
        throw Exception(localizations.invalidApiKeyError);
      } else if (response.statusCode == 429) {
        throw Exception(localizations.rateLimitError);
      } else if (response.statusCode == 404) {
        throw Exception(localizations.modelNotFoundError);
      } else {
        throw Exception(localizations.aiErrorResponse);
      }
    } catch (e) {
      throw Exception(localizations.networkErrorOpenAI);
    }
  }

  @override
  Future<String> getChatResponseWithFile(
    String prompt,
    AppLocalizations localizations, {
    String? model,
    String? responseMimeType,
    required AiFileAttachment file,
  }) async {
    final apiKey = await ConfigurationService.instance.getOpenAIApiKey();

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception(localizations.openaiApiKeyNotConfigured);
    }

    final selectedModel = model ?? _defaultModel;
    final contentBlocks = OpenAIContentBlock.fromPromptAndFile(prompt, file);

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl$_chatEndpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': selectedModel,
          'messages': [
            {
              'role': 'user',
              'content': contentBlocks.map((b) => b.toJson()).toList(),
            },
          ],
          'max_tokens': 8192,
          'temperature': 0.2,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final content = jsonResponse['choices'][0]['message']['content'];
        return content?.toString().trim() ?? localizations.noResponseReceived;
      } else if (response.statusCode == 401) {
        throw Exception(localizations.invalidApiKeyError);
      } else if (response.statusCode == 429) {
        throw Exception(localizations.rateLimitError);
      } else if (response.statusCode == 404) {
        throw Exception(localizations.modelNotFoundError);
      } else {
        throw Exception(localizations.aiErrorResponse);
      }
    } catch (e) {
      throw Exception(localizations.networkErrorOpenAI);
    }
  }
}
