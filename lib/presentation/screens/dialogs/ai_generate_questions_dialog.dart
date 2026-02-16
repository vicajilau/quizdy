import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:quiz_app/core/context_extension.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';
import 'package:quiz_app/data/services/ai/ai_service_selector.dart';
import 'package:quiz_app/domain/models/ai/ai_file_attachment.dart';
import 'package:quiz_app/domain/models/ai/ai_generation_stored_settings.dart';
import 'package:quiz_app/domain/models/ai/ai_question_type.dart';
import 'package:quiz_app/presentation/screens/dialogs/widgets/ai_generate_step1_widget.dart';
import 'package:quiz_app/presentation/screens/dialogs/widgets/ai_generate_step2_widget.dart';
import 'package:quiz_app/presentation/utils/clipboard_image_helper.dart';

class AiGenerateQuestionsDialog extends StatefulWidget {
  const AiGenerateQuestionsDialog({super.key});

  @override
  State<AiGenerateQuestionsDialog> createState() =>
      _AiGenerateQuestionsDialogState();
}

class _AiGenerateQuestionsDialogState extends State<AiGenerateQuestionsDialog> {
  final _textController = TextEditingController();
  final _questionCountController = TextEditingController(text: '5');

  int _currentStep = 0; // 0: Configuration, 1: Content

  Set<AiQuestionType> _selectedQuestionTypes = {AiQuestionType.random};
  String _selectedLanguage = 'en';
  List<AIService> _availableServices = [];
  AIService? _selectedService;
  String? _selectedModel;
  bool _isLoadingServices = true;

  AiFileAttachment? _fileAttachment;

  // Question Count state
  int _questionCount = 5;

  List<String> get _supportedLanguages {
    return AppLocalizations.supportedLocales
        .map((locale) => locale.languageCode)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadAvailableServices();
    await _loadDraft();
  }

  Future<void> _loadAvailableServices() async {
    setState(() {
      _isLoadingServices = true;
    });

    try {
      final services = await AIServiceSelector.instance.getAvailableServices();
      if (mounted) {
        setState(() {
          _availableServices = services;
          // Default to first service if available and none selected (and no draft)
          if (_selectedService == null && services.isNotEmpty) {
            // Logic to prefer saved default if draft doesn't override
          }
          _isLoadingServices = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingServices = false;
        });
      }
    }
  }

  Future<void> _loadDraft() async {
    final keepDraft = await ConfigurationService.instance.getAiKeepDraft();
    AIService? serviceToSet;
    String? modelToSet;

    // Use a local copy of available services for safety in async gap
    final services = _availableServices;

    if (keepDraft) {
      final settings = await ConfigurationService.instance
          .getAiGenerationSettings();

      if (mounted) {
        setState(() {
          if (settings.draftText != null && settings.draftText!.isNotEmpty) {
            _textController.text = settings.draftText!;
          }

          if (settings.questionCount != null) {
            _questionCount = settings.questionCount!;
            _questionCountController.text = _questionCount.toString();
          }

          if (settings.language != null &&
              _supportedLanguages.contains(settings.language)) {
            _selectedLanguage = settings.language!;
          }

          if (settings.questionTypes != null &&
              settings.questionTypes!.isNotEmpty) {
            final types = settings.questionTypes!
                .map((t) => _getAiQuestionTypeFromString(t))
                .where((t) => t != null)
                .cast<AiQuestionType>()
                .toSet();
            if (types.isNotEmpty) {
              _selectedQuestionTypes = types;
            }
          }
        });
      }

      // Determine Service
      if (settings.serviceName != null) {
        serviceToSet = services
            .where((s) => s.serviceName == settings.serviceName)
            .firstOrNull;
      }

      if (serviceToSet == null && services.isNotEmpty) {
        final defaultService = await ConfigurationService.instance
            .getDefaultAIService();
        if (defaultService != null) {
          serviceToSet = services
              .where((s) => s.serviceName == defaultService)
              .firstOrNull;
        }
        serviceToSet ??= services.first;
      }

      // Determine Model
      if (settings.modelName != null && serviceToSet != null) {
        if (serviceToSet.availableModels.contains(settings.modelName)) {
          modelToSet = settings.modelName;
        }
      }

      if (modelToSet == null && serviceToSet != null) {
        final defaultModel = await ConfigurationService.instance
            .getDefaultAIModel();
        if (defaultModel != null &&
            serviceToSet.availableModels.contains(defaultModel)) {
          modelToSet = defaultModel;
        } else {
          modelToSet = serviceToSet.defaultModel;
        }
      }
    } else {
      // Establish defaults if no draft
      if (services.isNotEmpty) {
        if (mounted) {
          setState(() {
            _questionCount = 5;
            _questionCountController.text = '5';
          });
        }
        final defaultService = await ConfigurationService.instance
            .getDefaultAIService();
        if (defaultService != null) {
          serviceToSet = services
              .where((s) => s.serviceName == defaultService)
              .firstOrNull;
        }
        serviceToSet ??= services.first;
        modelToSet = serviceToSet.defaultModel;
      }
    }

    if (mounted) {
      setState(() {
        if (serviceToSet != null) _selectedService = serviceToSet;
        if (modelToSet != null) _selectedModel = modelToSet;
      });
    }
  }

  AiQuestionType? _getAiQuestionTypeFromString(String type) {
    for (final value in AiQuestionType.values) {
      if (value.toString() == type) {
        return value;
      }
    }
    return null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setDefaultLanguage();
  }

  void _setDefaultLanguage() {
    final systemLocale = Localizations.localeOf(context);
    final systemLanguageCode = systemLocale.languageCode;
    if (_supportedLanguages.contains(systemLanguageCode)) {
      // Only set if we don't have a specific language set yet
      // This is a loose check; _loadDraft will perform the authoritative set
      if (_selectedLanguage == 'en' && _textController.text.isEmpty) {
        setState(() {
          _selectedLanguage = systemLanguageCode;
        });
      }
    }
  }

  /// Counts words by splitting on whitespace only.
  /// Used as the displayed count in content mode (>10 topics).
  int _getWordCount() {
    final text = _textController.text.trim();
    if (text.isEmpty) return 0;
    return text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
  }

  /// Counts comma-separated items. Used as the displayed count in topic mode.
  int _getTopicCount() {
    final text = _textController.text.trim();
    if (text.isEmpty) return 0;
    return text.split(',').where((t) => t.trim().isNotEmpty).length;
  }

  /// Returns the counter label: topic count when in topic mode (≤10 topics),
  /// word count when in content mode (>10 topics).
  String _getWordCountText() {
    final topicCount = _getTopicCount();
    final localizations = AppLocalizations.of(context)!;
    if (topicCount <= 10) {
      return localizations.aiTopicModeCount(topicCount);
    } else {
      return localizations.aiTextModeCount(_getWordCount());
    }
  }

  @override
  void dispose() {
    _saveDraft();
    _textController.dispose();
    _questionCountController.dispose();
    super.dispose();
  }

  Future<void> _saveDraft() async {
    final keepDraft = await ConfigurationService.instance.getAiKeepDraft();
    if (keepDraft) {
      final settings = AiGenerationStoredSettings(
        serviceName: _selectedService?.serviceName,
        modelName: _selectedModel,
        language: _selectedLanguage,
        questionCount: _questionCount,
        questionTypes: _selectedQuestionTypes.map((t) => t.toString()).toList(),
        draftText: _textController.text.trim(),
      );
      await ConfigurationService.instance.saveAiGenerationSettings(settings);
    }
  }

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        final pickedFile = result.files.first;
        if (pickedFile.bytes != null) {
          setState(() {
            _fileAttachment = AiFileAttachment(
              bytes: pickedFile.bytes!,
              mimeType:
                  lookupMimeType(
                    pickedFile.name,
                    headerBytes: pickedFile.bytes,
                  ) ??
                  'application/octet-stream',
              name: pickedFile.name,
            );
          });
        }
      }
    } catch (e) {
      if (mounted) {
        final localizations = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(localizations.aiFilePickerError)),
        );
      }
    }
  }

  Future<void> _pasteFromClipboard() async {
    final attachment = await ClipboardImageHelper.getClipboardImageAsAttachment();
    if (!mounted) return;
    if (attachment != null) {
      setState(() {
        _fileAttachment = attachment;
      });
    } else {
      context.presentSnackBar(AppLocalizations.of(context)!.clipboardNoImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_currentStep == 0) {
      return AiGenerateStep1Widget(
        isLoadingServices: _isLoadingServices,
        availableServices: _availableServices,
        selectedService: _selectedService,
        selectedModel: _selectedModel,
        selectedLanguage: _selectedLanguage,
        selectedQuestionTypes: _selectedQuestionTypes,
        supportedLanguages: _supportedLanguages,
        onServiceChanged: (service) {
          setState(() {
            _selectedService = service;
            _selectedModel = service.defaultModel;
          });
        },
        onModelChanged: (value) {
          setState(() {
            _selectedModel = value;
          });
        },
        onLanguageChanged: (value) {
          setState(() {
            _selectedLanguage = value;
          });
        },
        onQuestionTypeToggled: (type) {
          setState(() {
            Set<AiQuestionType> newSelectedTypes = Set.from(
              _selectedQuestionTypes,
            );

            if (type == AiQuestionType.random) {
              // Clicking Random always makes it the only selection
              newSelectedTypes = {AiQuestionType.random};
            } else {
              if (newSelectedTypes.contains(type)) {
                // Deselecting an individual type
                newSelectedTypes.remove(type);
                // If nothing left, default to Random
                if (newSelectedTypes.isEmpty) {
                  newSelectedTypes = {AiQuestionType.random};
                }
              } else {
                // Selecting an individual type
                // 1. Remove Random if it was there
                newSelectedTypes.remove(AiQuestionType.random);
                // 2. Add the new type
                newSelectedTypes.add(type);

                // 3. Check if all individual types are now selected
                final allSpecificTypes = AiQuestionType.values
                    .where((t) => t != AiQuestionType.random)
                    .toSet();
                if (newSelectedTypes.containsAll(allSpecificTypes)) {
                  newSelectedTypes = {AiQuestionType.random};
                }
              }
            }
            _selectedQuestionTypes = newSelectedTypes;
          });
        },
        onNext: () {
          setState(() {
            _currentStep = 1;
          });
        },
      );
    } else {
      return AiGenerateStep2Widget(
        textController: _textController,
        questionCountController: _questionCountController,
        questionCount: _questionCount,
        fileAttachment: _fileAttachment,
        selectedQuestionTypes: _selectedQuestionTypes,
        selectedLanguage: _selectedLanguage,
        selectedService: _selectedService,
        selectedModel: _selectedModel,
        onPickFile: _pickFile,
        onPasteFromClipboard: _pasteFromClipboard,
        onRemoveFile: () {
          setState(() {
            _fileAttachment = null;
          });
        },
        onFileDropped: (attachment) {
          setState(() {
            _fileAttachment = attachment;
          });
        },
        onBack: () {
          setState(() {
            _currentStep = 0;
          });
        },
        onQuestionCountChanged: (count) {
          setState(() {
            _questionCount = count;
            if (_questionCountController.text != count.toString()) {
              _questionCountController.text = count.toString();
            }
          });
        },
        getWordCountText: _getWordCountText,
        getWordCount: _getWordCount,
        getTopicCount: _getTopicCount,
      );
    }
  }

}
