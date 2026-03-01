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

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:quizdy/core/context_extension.dart';
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/data/services/configuration_service.dart';
import 'package:quizdy/domain/models/ai/ai_study_generation_stored_settings.dart';
import 'package:quizdy/data/services/ai/ai_service.dart';
import 'package:quizdy/data/services/ai/ai_service_selector.dart';
import 'package:quizdy/domain/models/ai/ai_file_attachment.dart';
import 'package:quizdy/presentation/screens/dialogs/widgets/ai_generate_study_step1_widget.dart';
import 'package:quizdy/presentation/screens/dialogs/widgets/ai_generate_study_step2_widget.dart';
import 'package:quizdy/presentation/utils/clipboard_image_helper.dart';

class AiGenerateStudyDialog extends StatefulWidget {
  const AiGenerateStudyDialog({super.key});

  @override
  State<AiGenerateStudyDialog> createState() => _AiGenerateStudyDialogState();
}

class _AiGenerateStudyDialogState extends State<AiGenerateStudyDialog> {
  final _textController = TextEditingController();

  int _currentStep = 0; // 0: Configuration, 1: Content

  String _selectedLanguage = 'en';
  List<AIService> _availableServices = [];
  AIService? _selectedService;
  String? _selectedModel;
  bool _isLoadingServices = true;

  AiFileAttachment? _fileAttachment;

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
          if (_selectedService == null && services.isNotEmpty) {
            // Handled in _loadDraft or falls back to first
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
    final keepDraft = await ConfigurationService.instance.getAiStudyKeepDraft();
    AIService? serviceToSet;
    String? modelToSet;

    final services = _availableServices;

    if (keepDraft) {
      final settings = await ConfigurationService.instance
          .getAiStudyGenerationSettings();

      if (mounted) {
        setState(() {
          if (settings.draftText != null && settings.draftText!.isNotEmpty) {
            _textController.text = settings.draftText!;
          }

          if (settings.language != null &&
              _supportedLanguages.contains(settings.language)) {
            _selectedLanguage = settings.language!;
          }
        });
      }

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
      if (services.isNotEmpty) {
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setDefaultLanguage();
  }

  void _setDefaultLanguage() {
    final systemLocale = Localizations.localeOf(context);
    final systemLanguageCode = systemLocale.languageCode;
    if (_supportedLanguages.contains(systemLanguageCode)) {
      if (_selectedLanguage == 'en' && _textController.text.isEmpty) {
        setState(() {
          _selectedLanguage = systemLanguageCode;
        });
      }
    }
  }

  int _getWordCount() {
    final text = _textController.text.trim();
    if (text.isEmpty) return 0;
    return text.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).length;
  }

  int _getTopicCount() {
    final text = _textController.text.trim();
    if (text.isEmpty) return 0;
    return text.split(',').where((t) => t.trim().isNotEmpty).length;
  }

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
    super.dispose();
  }

  Future<void> _saveDraft() async {
    final keepDraft = await ConfigurationService.instance.getAiStudyKeepDraft();

    if (!keepDraft) {
      // Clear draft explicitly if keep draft is disabled
      await ConfigurationService.instance.saveAiStudyGenerationSettings(
        const AiStudyGenerationStoredSettings(draftText: ''),
      );
      return;
    }

    final String textToSave = _textController.text.trim();

    await ConfigurationService.instance.saveAiStudyGenerationSettings(
      AiStudyGenerationStoredSettings(
        serviceName: _selectedService?.serviceName,
        modelName: _selectedModel,
        language: _selectedLanguage,
        draftText: textToSave,
      ),
    );
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
    final attachment =
        await ClipboardImageHelper.getClipboardImageAsAttachment();
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
      return AiGenerateStudyStep1Widget(
        isLoadingServices: _isLoadingServices,
        availableServices: _availableServices,
        selectedService: _selectedService,
        selectedModel: _selectedModel,
        selectedLanguage: _selectedLanguage,
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
        onNext: () {
          setState(() {
            _currentStep = 1;
          });
        },
      );
    } else {
      return AiGenerateStudyStep2Widget(
        textController: _textController,
        fileAttachment: _fileAttachment,
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
        getWordCountText: _getWordCountText,
        getWordCount: _getWordCount,
        getTopicCount: _getTopicCount,
      );
    }
  }
}
