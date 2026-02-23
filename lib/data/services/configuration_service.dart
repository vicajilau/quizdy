import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz_app/domain/models/quiz/question_order.dart';
import 'package:quiz_app/domain/models/ai/ai_generation_stored_settings.dart';
import 'package:quiz_app/domain/models/quiz/quiz_config_stored_settings.dart';
import 'package:quiz_app/core/security/encryption_service.dart';

class ConfigurationService {
  static const String _questionOrderKey = 'question_order';
  static const String _examTimeEnabledKey = 'exam_time_enabled';
  static const String _examTimeMinutesKey = 'exam_time_minutes';
  static const String _aiAssistantEnabledKey = 'ai_assistant_enabled';
  static const String _openaiApiKeyKey = 'openai_api_key';
  static const String _geminiApiKeyKey = 'gemini_api_key';
  static const String _randomizeAnswersKey = 'randomize_answers';
  static const String _showCorrectAnswerCountKey = 'show_correct_answer_count';
  static const String _defaultAIServiceKey = 'default_ai_service';
  static const String _defaultAIModelKey = 'default_ai_model';

  static const String _aiKeepDraftKey = 'ai_keep_draft';
  static const String _aiDraftTextKey = 'ai_draft_text';
  static const String _aiGenerationServiceKey = 'ai_generation_service';
  static const String _aiGenerationModelKey = 'ai_generation_model';
  static const String _aiGenerationLanguageKey = 'ai_generation_language';
  static const String _aiGenerationQuestionCountKey =
      'ai_generation_question_count';
  static const String _aiGenerationQuestionTypesKey =
      'ai_generation_question_types';

  static const String _lastQuestionCountKey = 'last_question_count';
  static const String _lastQuizModeKey = 'last_quiz_mode';
  static const String _lastQuizEnableMaxIncorrectAnswersKey =
      'last_quiz_enable_max_incorrect_answers';
  static const String _lastQuizMaxIncorrectAnswersKey =
      'last_quiz_max_incorrect_answers';

  static ConfigurationService? _instance;
  static ConfigurationService get instance =>
      _instance ??= ConfigurationService._();

  ConfigurationService._();

  /// Saves the selected question order to SharedPreferences
  Future<void> saveQuestionOrder(QuestionOrder order) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_questionOrderKey, order.value);
  }

  /// Gets the saved question order, defaults to random
  Future<QuestionOrder> getQuestionOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final orderValue = prefs.getString(_questionOrderKey);

    if (orderValue != null) {
      return QuestionOrder.fromString(orderValue);
    }

    return QuestionOrder.random; // Valor por defecto
  }

  /// Saves whether exam time limit is enabled
  Future<void> saveExamTimeEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_examTimeEnabledKey, enabled);
  }

  /// Gets whether exam time limit is enabled, defaults to false
  Future<bool> getExamTimeEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_examTimeEnabledKey) ?? false;
  }

  /// Saves the exam time limit in minutes
  Future<void> saveExamTimeMinutes(int minutes) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_examTimeMinutesKey, minutes);
  }

  /// Gets the exam time limit in minutes, defaults to 60
  Future<int> getExamTimeMinutes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_examTimeMinutesKey) ?? 60;
  }

  /// Saves whether AI assistant is enabled
  Future<void> saveAIAssistantEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_aiAssistantEnabledKey, enabled);
  }

  /// Gets whether AI assistant is enabled, defaults to true
  Future<bool> _getAIAssistantEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_aiAssistantEnabledKey) ?? true;
  }

  /// Saves OpenAI API Key securely (encrypted)
  Future<void> saveOpenAIApiKey(String apiKey) async {
    final prefs = await SharedPreferences.getInstance();
    final encryptedApiKey = EncryptionService.encrypt(apiKey);
    await prefs.setString(_openaiApiKeyKey, encryptedApiKey);
  }

  /// Gets OpenAI API Key (decrypted)
  Future<String?> getOpenAIApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    final encryptedApiKey = prefs.getString(_openaiApiKeyKey);

    if (encryptedApiKey == null || encryptedApiKey.isEmpty) {
      return null;
    }

    return EncryptionService.decrypt(encryptedApiKey);
  }

  /// Deletes OpenAI API Key
  Future<void> deleteOpenAIApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_openaiApiKeyKey);
  }

  /// Saves Gemini API Key securely (encrypted)
  Future<void> saveGeminiApiKey(String apiKey) async {
    final prefs = await SharedPreferences.getInstance();
    final encryptedApiKey = EncryptionService.encrypt(apiKey);
    await prefs.setString(_geminiApiKeyKey, encryptedApiKey);
  }

  /// Gets Gemini API Key (decrypted)
  Future<String?> getGeminiApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    final encryptedApiKey = prefs.getString(_geminiApiKeyKey);

    if (encryptedApiKey == null || encryptedApiKey.isEmpty) {
      return null;
    }

    return EncryptionService.decrypt(encryptedApiKey);
  }

  /// Deletes Gemini API Key
  Future<void> deleteGeminiApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_geminiApiKeyKey);
  }

  /// Saves whether answers should be randomized
  Future<void> saveRandomizeAnswers(bool randomize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_randomizeAnswersKey, randomize);
  }

  /// Gets whether answers should be randomized, defaults to false
  Future<bool> getRandomizeAnswers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_randomizeAnswersKey) ?? false;
  }

  /// Saves whether to show correct answer count
  Future<void> saveShowCorrectAnswerCount(bool show) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_showCorrectAnswerCountKey, show);
  }

  /// Gets whether to show correct answer count, defaults to false
  Future<bool> getShowCorrectAnswerCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_showCorrectAnswerCountKey) ?? false;
  }

  /// Saves the default AI service name
  Future<void> saveDefaultAIService(String serviceName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_defaultAIServiceKey, serviceName);
  }

  /// Gets the default AI service name, returns null if not set
  Future<String?> getDefaultAIService() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_defaultAIServiceKey);
  }

  /// Saves the default AI model
  Future<void> saveDefaultAIModel(String model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_defaultAIModelKey, model);
  }

  /// Gets the default AI model, returns null if not set
  Future<String?> getDefaultAIModel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_defaultAIModelKey);
  }

  /// Deletes the default AI service and model
  Future<void> deleteDefaultAISettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_defaultAIServiceKey);
    await prefs.remove(_defaultAIModelKey);
  }

  /// Saves whether to keep AI text draft
  Future<void> saveAiKeepDraft(bool keep) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_aiKeepDraftKey, keep);
  }

  /// Gets whether to keep AI text draft, defaults to true
  Future<bool> getAiKeepDraft() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_aiKeepDraftKey) ?? true;
  }

  /// Saves the AI generation settings
  Future<void> saveAiGenerationSettings(
    AiGenerationStoredSettings settings,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    if (settings.serviceName != null) {
      await prefs.setString(_aiGenerationServiceKey, settings.serviceName!);
    }
    if (settings.modelName != null) {
      await prefs.setString(_aiGenerationModelKey, settings.modelName!);
    }
    if (settings.language != null) {
      await prefs.setString(_aiGenerationLanguageKey, settings.language!);
    }
    if (settings.questionCount != null) {
      await prefs.setInt(
        _aiGenerationQuestionCountKey,
        settings.questionCount!,
      );
    }
    if (settings.questionTypes != null) {
      await prefs.setStringList(
        _aiGenerationQuestionTypesKey,
        settings.questionTypes!,
      );
    }

    if (settings.draftText != null) {
      await prefs.setString(_aiDraftTextKey, settings.draftText!);
    }
  }

  /// Gets the AI generation settings
  Future<AiGenerationStoredSettings> getAiGenerationSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return AiGenerationStoredSettings(
      serviceName: prefs.getString(_aiGenerationServiceKey),
      modelName: prefs.getString(_aiGenerationModelKey),
      language: prefs.getString(_aiGenerationLanguageKey),
      questionCount: prefs.getInt(_aiGenerationQuestionCountKey),
      questionTypes: prefs.getStringList(_aiGenerationQuestionTypesKey),
      draftText: prefs.getString(_aiDraftTextKey),
    );
  }

  static const String _lastQuizSubtractPointsKey = 'last_quiz_subtract_points';
  static const String _lastQuizPenaltyAmountKey = 'last_quiz_penalty_amount';

  /// Saves the Quiz Config settings
  Future<void> saveQuizConfigSettings(QuizConfigStoredSettings settings) async {
    final prefs = await SharedPreferences.getInstance();

    if (settings.questionCount != null) {
      await prefs.setInt(_lastQuestionCountKey, settings.questionCount!);
    } else {
      await prefs.remove(_lastQuestionCountKey);
    }
    if (settings.isStudyMode != null) {
      await prefs.setBool(_lastQuizModeKey, settings.isStudyMode!);
    }
    if (settings.subtractPoints != null) {
      await prefs.setBool(_lastQuizSubtractPointsKey, settings.subtractPoints!);
    }
    if (settings.penaltyAmount != null) {
      await prefs.setDouble(_lastQuizPenaltyAmountKey, settings.penaltyAmount!);
    }
    if (settings.enableMaxIncorrectAnswers != null) {
      await prefs.setBool(
        _lastQuizEnableMaxIncorrectAnswersKey,
        settings.enableMaxIncorrectAnswers!,
      );
    }
    if (settings.maxIncorrectAnswers != null) {
      await prefs.setInt(
        _lastQuizMaxIncorrectAnswersKey,
        settings.maxIncorrectAnswers!,
      );
    }

    if (settings.questionOrder != null) {
      await prefs.setString(_questionOrderKey, settings.questionOrder!.value);
    }
    if (settings.randomizeAnswers != null) {
      await prefs.setBool(_randomizeAnswersKey, settings.randomizeAnswers!);
    }
    if (settings.showCorrectAnswerCount != null) {
      await prefs.setBool(
        _showCorrectAnswerCountKey,
        settings.showCorrectAnswerCount!,
      );
    }
  }

  /// Gets the Quiz Config settings
  Future<QuizConfigStoredSettings> getQuizConfigSettings() async {
    final prefs = await SharedPreferences.getInstance();

    return QuizConfigStoredSettings(
      questionCount: prefs.getInt(_lastQuestionCountKey),
      isStudyMode: prefs.getBool(_lastQuizModeKey),
      subtractPoints: prefs.getBool(_lastQuizSubtractPointsKey),
      penaltyAmount: prefs.getDouble(_lastQuizPenaltyAmountKey),
      enableMaxIncorrectAnswers: prefs.getBool(
        _lastQuizEnableMaxIncorrectAnswersKey,
      ),
      maxIncorrectAnswers: prefs.getInt(_lastQuizMaxIncorrectAnswersKey),
      questionOrder: QuestionOrder.fromString(
        prefs.getString(_questionOrderKey),
      ),
      randomizeAnswers: prefs.getBool(_randomizeAnswersKey),
      showCorrectAnswerCount: prefs.getBool(_showCorrectAnswerCountKey),
    );
  }

  /// Checks if AI Assistant is available (enabled and has at least one API key)
  Future<bool> getIsAiAvailable() async {
    final isEnabled = await _getAIAssistantEnabled();
    final openAiKey = await getOpenAIApiKey();
    final geminiKey = await getGeminiApiKey();

    return isEnabled &&
        ((openAiKey != null && openAiKey.isNotEmpty) ||
            (geminiKey != null && geminiKey.isNotEmpty));
  }
}
