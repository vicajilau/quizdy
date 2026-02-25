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
import 'package:url_launcher/url_launcher.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';
import 'package:quizlab_ai/core/extensions/string_extensions.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/widgets/ai_service_model_selector.dart';

/// A widget that handles the AI Assistant settings section.
///
/// Allows the user to enable/disable the AI assistant, configure API keys for Gemini and OpenAI,
/// select the default AI model, and toggle the behavior for keeping AI drafts.
class AiSettingsSection extends StatelessWidget {
  final bool enabled;
  final bool keepDraft;
  final TextEditingController geminiController;
  final TextEditingController openAiController;
  final String? defaultModel;
  final String? errorMessage;
  final bool isGeminiVisible;
  final bool isOpenAiVisible;
  final GlobalKey? errorKey;
  final ValueChanged<bool> onEnabledChanged;
  final ValueChanged<bool> onKeepDraftChanged;
  final VoidCallback onToggleGeminiVisibility;
  final VoidCallback onToggleOpenAiVisibility;
  final VoidCallback onApiKeyChanged;

  const AiSettingsSection({
    super.key,
    required this.enabled,
    required this.keepDraft,
    required this.geminiController,
    required this.openAiController,
    this.defaultModel,
    this.errorMessage,
    required this.isGeminiVisible,
    required this.isOpenAiVisible,
    this.errorKey,
    required this.onEnabledChanged,
    required this.onKeepDraftChanged,
    required this.onToggleGeminiVisibility,
    required this.onToggleOpenAiVisibility,
    required this.onApiKeyChanged,
  });

  Future<void> _openAiApiKeysUrl(BuildContext context) async {
    final url = Uri.parse('https://platform.openai.com/api-keys');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.couldNotOpenUrl(url.toString()),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _openGeminiApiKeysUrl(BuildContext context) async {
    final url = Uri.parse('https://aistudio.google.com/app/apikey');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.couldNotOpenUrl(url.toString()),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AI Assistant Toggle
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.auto_awesome,
                          size: 16,
                          color: AppTheme.primaryColor,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            AppLocalizations.of(
                              context,
                            )!.aiAssistantSettingsTitle,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: colors.title,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.aiAssistantSettingsDescription,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: colors.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: enabled,
                onChanged: onEnabledChanged,
                activeThumbColor: Colors.white,
                activeTrackColor: AppTheme.primaryColor,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: isDark
                    ? AppTheme.zinc600
                    : AppTheme.zinc300,
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              ),
            ],
          ),
        ),

        if (enabled) ...[
          const SizedBox(height: 16),
          // Keep Draft Toggle
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.aiKeepDraftTitle,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: colors.title,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppLocalizations.of(context)!.aiKeepDraftDescription,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: colors.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: keepDraft,
                  onChanged: onKeepDraftChanged,
                  activeThumbColor: Colors.white,
                  activeTrackColor: AppTheme.primaryColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: isDark
                      ? AppTheme.zinc600
                      : AppTheme.zinc300,
                  trackOutlineColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          _buildApiKeyField(
            context,
            controller: geminiController,
            label: AppLocalizations.of(context)!.geminiApiKeyLabel,
            hint: AppLocalizations.of(context)!.geminiApiKeyHint,
            description: AppLocalizations.of(context)!.geminiApiKeyDescription,
            isVisible: isGeminiVisible,
            onToggleVisibility: onToggleGeminiVisibility,
            isValid: geminiController.text.isValidGeminiApiKey,
            onInfoPressed: () => _openGeminiApiKeysUrl(context),
            buttonLabel: AppLocalizations.of(context)!.getGeminiApiKeyTooltip,
          ),
          const SizedBox(height: 16),
          _buildApiKeyField(
            context,
            controller: openAiController,
            label: AppLocalizations.of(context)!.openaiApiKeyLabel,
            hint: AppLocalizations.of(context)!.openaiApiKeyHint,
            description: AppLocalizations.of(context)!.openaiApiKeyDescription,
            isVisible: isOpenAiVisible,
            onToggleVisibility: onToggleOpenAiVisibility,
            isValid: openAiController.text.isValidOpenAIApiKey,
            onInfoPressed: () => _openAiApiKeysUrl(context),
            buttonLabel: AppLocalizations.of(context)!.getApiKeyTooltip,
          ),
          if (errorMessage != null) ...[
            const SizedBox(height: 12),
            Container(
              key: errorKey,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.error,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).colorScheme.error,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      errorMessage!,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (geminiController.text.isValidGeminiApiKey ||
              openAiController.text.isValidOpenAIApiKey) ...[
            const SizedBox(height: 24),
            // Note: AiServiceModelSelector might need internal styling updates too,
            // but for now we place it here.
            AiServiceModelSelector(
              initialModel: defaultModel,
              saveToPreferences: true,
              geminiApiKey: geminiController.text.isValidGeminiApiKey
                  ? geminiController.text.trim()
                  : null,
              openaiApiKey: openAiController.text.isValidOpenAIApiKey
                  ? openAiController.text.trim()
                  : null,
            ),
          ],
        ],
      ],
    );
  }

  Widget _buildApiKeyField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required String hint,
    required String description,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
    required bool isValid,
    required VoidCallback onInfoPressed,
    required String buttonLabel,
  }) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            hintMaxLines: 3,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: isValid
                    ? Theme.of(context).colorScheme.outline
                    : Theme.of(context).colorScheme.error,
              ),
            ),
            prefixIcon: Icon(
              Icons.key,
              color: isValid ? null : Theme.of(context).colorScheme.error,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isValid)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onToggleVisibility,
                ),
              ],
            ),
          ),
          obscureText: !isVisible,
          onChanged: (value) async {
            onApiKeyChanged();
          },
        ),
        const SizedBox(height: 4),
        const SizedBox(height: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerRight,
              child: QuizLabAIButton(
                type: QuizlabAIButtonType.tertiary,
                title: buttonLabel.toUpperCase(),
                icon: Icons.open_in_new,
                onPressed: onInfoPressed,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
