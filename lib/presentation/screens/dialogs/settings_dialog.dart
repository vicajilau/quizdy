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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/extensions/string_extensions.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/data/services/configuration_service.dart';
import 'package:quizlab_ai/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/settings_widgets/ai_settings_section.dart';
import 'package:flutter/foundation.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/settings_widgets/advanced_settings_section.dart';
import 'package:quizlab_ai/routes/app_router.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool _isLoading = true;
  bool _aiAssistantEnabled = true;
  bool _keepAiDraft = true;
  final TextEditingController _openAiApiKeyController = TextEditingController();
  final TextEditingController _geminiApiKeyController = TextEditingController();
  String? _apiKeyErrorMessage;
  String? _defaultAIModel;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _errorKey = GlobalKey();
  final GlobalKey _aiSettingsKey = GlobalKey();

  bool _isGeminiKeyVisible = false;
  bool _isOpenAiKeyVisible = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      final service = ConfigurationService.instance;

      // Load all configurations
      final apiKey = await service.getOpenAIApiKey();
      final geminiApiKey = await service.getGeminiApiKey();
      _keepAiDraft = await service.getAiKeepDraft();
      _defaultAIModel = await service.getDefaultAIModel();
      _aiAssistantEnabled = await service.getIsAiAvailable();

      if (mounted) {
        setState(() {
          _openAiApiKeyController.text = apiKey ?? '';
          _geminiApiKeyController.text = geminiApiKey ?? '';
          _isLoading = false; // Important: set as finished
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false; // Also set in case of error
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.errorLoadingSettings(e.toString()),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _saveSettings() async {
    // Clear previous error message
    setState(() {
      _apiKeyErrorMessage = null;
    });

    // Validate that if AI Assistant is enabled, at least one valid API Key must be provided
    final apiKey = _openAiApiKeyController.text.trim();
    final geminiApiKey = _geminiApiKeyController.text.trim();
    final hasValidOpenAI = apiKey.isValidOpenAIApiKey;
    final hasValidGemini = geminiApiKey.isValidGeminiApiKey;

    if (!hasValidOpenAI && !hasValidGemini) {
      setState(() {
        _apiKeyErrorMessage = AppLocalizations.of(
          context,
        )!.aiRequiresAtLeastOneApiKeyError;
      });
      // Scroll to error message after frame renders
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_errorKey.currentContext != null) {
          Scrollable.ensureVisible(
            _errorKey.currentContext!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
      return; // Don't save if validation fails
    }

    await ConfigurationService.instance.saveAIAssistantEnabled(
      _aiAssistantEnabled,
    );
    await ConfigurationService.instance.saveAiKeepDraft(_keepAiDraft);

    // Save OpenAI API Key securely (only if valid format)
    if (hasValidOpenAI) {
      await ConfigurationService.instance.saveOpenAIApiKey(apiKey);
    } else {
      await ConfigurationService.instance.deleteOpenAIApiKey();
    }

    // Save Gemini API Key securely (only if valid format)
    if (hasValidGemini) {
      await ConfigurationService.instance.saveGeminiApiKey(geminiApiKey);
    } else {
      await ConfigurationService.instance.deleteGeminiApiKey();
    }

    if (mounted) {
      context.pop();
    }
  }

  @override
  void dispose() {
    _openAiApiKeyController.dispose();
    _geminiApiKeyController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _clearApiKeyError() {
    if (_apiKeyErrorMessage != null) {
      setState(() {
        _apiKeyErrorMessage = null;
      });
    }
  }

  /// Called when API keys change - saves them and refreshes the selector
  Future<void> _onApiKeyChanged() async {
    // Save API keys immediately so the selector can detect them
    final openaiKey = _openAiApiKeyController.text.trim();
    final geminiKey = _geminiApiKeyController.text.trim();

    if (openaiKey.isValidOpenAIApiKey) {
      await ConfigurationService.instance.saveOpenAIApiKey(openaiKey);
    } else {
      await ConfigurationService.instance.deleteOpenAIApiKey();
    }

    if (geminiKey.isValidGeminiApiKey) {
      await ConfigurationService.instance.saveGeminiApiKey(geminiKey);
    } else {
      await ConfigurationService.instance.deleteGeminiApiKey();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: 520, // Node Eql6E width
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: colors.border, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.settingsTitle,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: colors.title,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: colors.surface,
                      fixedSize: const Size(40, 40),
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    icon: Icon(LucideIcons.x, size: 20, color: colors.subtitle),
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: _isLoading
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AiSettingsSection(
                            key: _aiSettingsKey,
                            enabled: _aiAssistantEnabled,
                            keepDraft: _keepAiDraft,
                            geminiController: _geminiApiKeyController,
                            openAiController: _openAiApiKeyController,
                            defaultModel: _defaultAIModel,
                            errorMessage: _apiKeyErrorMessage,
                            isGeminiVisible: _isGeminiKeyVisible,
                            isOpenAiVisible: _isOpenAiKeyVisible,
                            errorKey: _errorKey,
                            onEnabledChanged: (value) {
                              setState(() => _aiAssistantEnabled = value);
                              if (value) {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  if (_aiSettingsKey.currentContext != null) {
                                    Scrollable.ensureVisible(
                                      _aiSettingsKey.currentContext!,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                });
                              }
                            },
                            onKeepDraftChanged: (value) =>
                                setState(() => _keepAiDraft = value),
                            onToggleGeminiVisibility: () => setState(
                              () => _isGeminiKeyVisible = !_isGeminiKeyVisible,
                            ),
                            onToggleOpenAiVisibility: () => setState(
                              () => _isOpenAiKeyVisible = !_isOpenAiKeyVisible,
                            ),
                            onApiKeyChanged: () async {
                              _clearApiKeyError();
                              await _onApiKeyChanged();
                              setState(() {
                                // Rebuild
                              });
                            },
                          ),
                          if (kDebugMode) ...[
                            const SizedBox(height: 24),
                            const AdvancedSettingsSection(),
                          ],
                          const SizedBox(height: 24),
                          Divider(color: colors.border),
                          const SizedBox(height: 16),
                          _OnboardingRow(colors: colors),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: QuizLabAIButton(
                title: AppLocalizations.of(context)!.saveButton,
                expanded: true,
                isLoading: _isLoading,
                onPressed: _isLoading ? null : _saveSettings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingRow extends StatelessWidget {
  final ConfirmingDialogColorsExtension colors;

  const _OnboardingRow({required this.colors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        await ConfigurationService.instance.setOnboardingCompleted(false);
        if (context.mounted) {
          context.pop();
          context.push('${AppRoutes.onboarding}?from=settings');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                LucideIcons.graduationCap,
                size: 20,
                color: colors.subtitle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.showOnboarding,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colors.title,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.showOnboardingDescription,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: colors.subtitle,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              LucideIcons.chevronRight,
              size: 18,
              color: colors.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
