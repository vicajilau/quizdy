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
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/core/l10n/extensions/app_localizations_extension.dart';
import 'package:quizdy/data/services/ai/ai_service.dart';
import 'package:quizdy/core/theme/app_theme.dart';
import 'package:quizdy/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quizdy/presentation/widgets/quizdy_button.dart';

class AiGenerateStudyStep1Widget extends StatelessWidget {
  final bool isLoadingServices;
  final List<AIService> availableServices;
  final AIService? selectedService;
  final String? selectedModel;
  final String selectedLanguage;
  final List<String> supportedLanguages;
  final ValueChanged<AIService> onServiceChanged;
  final ValueChanged<String?> onModelChanged;
  final ValueChanged<String> onLanguageChanged;
  final VoidCallback onNext;

  const AiGenerateStudyStep1Widget({
    super.key,
    required this.isLoadingServices,
    required this.availableServices,
    required this.selectedService,
    required this.selectedModel,
    required this.selectedLanguage,
    required this.supportedLanguages,
    required this.onServiceChanged,
    required this.onModelChanged,
    required this.onLanguageChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;
    final borderColor = isDark ? Colors.transparent : AppTheme.borderColor;

    final isGeminiSelected =
        selectedService?.serviceName.toLowerCase().contains('gemini') ?? false;
    final isOpenAiSelected =
        selectedService?.serviceName.toLowerCase().contains('openai') ?? false;

    final isGeminiAvailable = availableServices.any(
      (s) => s.serviceName.toLowerCase().contains('gemini'),
    );
    final isOpenAiAvailable = availableServices.any(
      (s) => s.serviceName.toLowerCase().contains('openai'),
    );

    final geminiBgColor = isGeminiSelected
        ? Theme.of(context).primaryColor
        : (isDark ? AppTheme.borderColorDark : AppTheme.cardColorLight);
    final geminiContentColor = isGeminiSelected
        ? AppTheme.zinc50
        : (isDark ? AppTheme.zinc400 : AppTheme.textSecondaryColor);

    final openAiBgColor = isOpenAiSelected
        ? (isDark ? AppTheme.zinc50 : AppTheme.zinc900)
        : (isDark ? AppTheme.borderColorDark : AppTheme.cardColorLight);
    final openAiContentColor = isOpenAiSelected
        ? (isDark ? AppTheme.zinc900 : AppTheme.zinc50)
        : (isDark ? AppTheme.zinc400 : AppTheme.textSecondaryColor);

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        width: 560,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    localizations.studyModeLabel,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: colors.title,
                    ),
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
                  icon: Icon(LucideIcons.x, color: colors.subtitle, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AI Service Label
                    Text(
                      localizations.aiServiceLabel.replaceAll(':', ''),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colors.subtitle,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Service Options
                    if (isLoadingServices)
                      const Center(child: CircularProgressIndicator())
                    else
                      Row(
                        children: [
                          // Gemini Button
                          Expanded(
                            child: GestureDetector(
                              onTap: isGeminiAvailable
                                  ? () {
                                      final service = availableServices
                                          .firstWhere(
                                            (s) => s.serviceName
                                                .toLowerCase()
                                                .contains('gemini'),
                                          );
                                      onServiceChanged(service);
                                    }
                                  : null,
                              child: Opacity(
                                opacity: isGeminiAvailable ? 1.0 : 0.5,
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: geminiBgColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      final showText =
                                          constraints.maxWidth > 90;
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            LucideIcons.sparkles,
                                            color: geminiContentColor,
                                            size: 18,
                                          ),
                                          if (showText) ...[
                                            const SizedBox(width: 8),
                                            Flexible(
                                              child: Text(
                                                'Gemini',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: geminiContentColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // OpenAI Button
                          Expanded(
                            child: GestureDetector(
                              onTap: isOpenAiAvailable
                                  ? () {
                                      final service = availableServices
                                          .firstWhere(
                                            (s) => s.serviceName
                                                .toLowerCase()
                                                .contains('openai'),
                                          );
                                      onServiceChanged(service);
                                    }
                                  : null,
                              child: Opacity(
                                opacity: isOpenAiAvailable ? 1.0 : 0.5,
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: openAiBgColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      final showText =
                                          constraints.maxWidth > 90;
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            LucideIcons.bot,
                                            color: openAiContentColor,
                                            size: 18,
                                          ),
                                          if (showText) ...[
                                            const SizedBox(width: 8),
                                            Flexible(
                                              child: Text(
                                                'OpenAI',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: openAiContentColor,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 24),

                    // Model Selection
                    Text(
                      AppLocalizations.of(
                        context,
                      )!.aiModelLabel.replaceAll(':', ''),
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colors.subtitle,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: colors.border,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedModel,
                          isExpanded: true,
                          icon: Icon(
                            LucideIcons.chevronDown,
                            color: colors.subtitle,
                            size: 18,
                          ),
                          dropdownColor: colors.border,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: colors.title,
                          ),
                          items:
                              selectedService?.availableModels
                                  .map(
                                    (model) => DropdownMenuItem(
                                      value: model,
                                      child: Text(model),
                                    ),
                                  )
                                  .toList() ??
                              [],
                          onChanged: onModelChanged,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Language
                    Text(
                      AppLocalizations.of(context)!.aiLanguageLabel,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colors.subtitle,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: colors.border,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLanguage,
                          isExpanded: true,
                          icon: Icon(
                            LucideIcons.chevronDown,
                            color: colors.title,
                            size: 18,
                          ),
                          dropdownColor: isDark
                              ? AppTheme.borderColorDark
                              : AppTheme.zinc100,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: colors.title,
                          ),
                          items: supportedLanguages
                              .map(
                                (lang) => DropdownMenuItem(
                                  value: lang,
                                  child: Text(
                                    localizations.getLanguageName(lang),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              onLanguageChanged(value);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Footer (Fixed Next Button)
            QuizdyButton(
              title: AppLocalizations.of(context)!.next,
              icon: LucideIcons.arrowRight,
              expanded: true,
              onPressed: selectedService != null ? onNext : null,
            ),
          ],
        ),
      ),
    );
  }
}
