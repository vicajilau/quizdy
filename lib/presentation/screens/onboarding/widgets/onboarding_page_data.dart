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
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';

class OnboardingPageData {
  final IconData? icon;
  final String? imagePath;
  final String title;
  final String description;
  final String? subtitle;
  final Widget Function(BuildContext context) contentBuilder;

  const OnboardingPageData({
    this.icon,
    this.imagePath,
    this.subtitle,
    required this.title,
    required this.description,
    required this.contentBuilder,
  });
}

List<OnboardingPageData> buildOnboardingPages(BuildContext context) {
  final localizations = AppLocalizations.of(context)!;
  return [
    OnboardingPageData(
      imagePath: 'images/QuizLab_AI.svg',
      title: localizations.onboardingWelcomeTitle,
      description: localizations.onboardingWelcomeDescription,
      subtitle: localizations.onboardingWelcomeSubtitle,
      contentBuilder: (context) => _buildFeatureList(context),
    ),
    OnboardingPageData(
      icon: LucideIcons.play,
      title: localizations.onboardingStartQuizTitle,
      description: localizations.onboardingStartQuizDescription,
      subtitle: localizations.onboardingStartQuizSubtitle,
      contentBuilder: (context) => _buildStepCards(context),
    ),
    OnboardingPageData(
      icon: LucideIcons.pencil,
      title: localizations.onboardingCreateQuestionsTitle,
      description: localizations.onboardingCreateQuestionsDescription,
      subtitle: localizations.onboardingCreateQuestionsSubtitle,
      contentBuilder: (context) => _buildQuestionTypes(context),
    ),
    OnboardingPageData(
      icon: LucideIcons.sparkles,
      title: localizations.onboardingAiFeaturesTitle,
      description: localizations.onboardingAiFeaturesDescription,
      subtitle: localizations.onboardingAiFeaturesSubtitle,
      contentBuilder: (context) => _buildAiFeatures(context),
    ),
  ];
}

Widget _buildFeatureList(BuildContext context) {
  final theme = Theme.of(context);
  final localizations = AppLocalizations.of(context)!;
  final features = [
    (
      LucideIcons.brain,
      localizations.onboardingFeatureAiTitle,
      localizations.onboardingFeatureAiDescription,
    ),
    (
      LucideIcons.listChecks,
      localizations.onboardingFeatureTypesTitle,
      localizations.onboardingFeatureTypesDescription,
    ),
    (
      LucideIcons.globe,
      localizations.onboardingFeatureLanguagesTitle,
      localizations.onboardingFeatureLanguagesDescription,
    ),
  ];

  return Column(
    children: features
        .map(
          (feature) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(feature.$1, color: theme.primaryColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feature.$2,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        feature.$3,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList(),
  );
}

Widget _buildStepCards(BuildContext context) {
  final theme = Theme.of(context);
  final localizations = AppLocalizations.of(context)!;
  final steps = [
    (
      '1',
      localizations.onboardingStepCreateTitle,
      localizations.onboardingStepCreateDescription,
    ),
    (
      '2',
      localizations.onboardingStepLoadTitle,
      localizations.onboardingStepLoadDescription,
    ),
    (
      '3',
      localizations.onboardingStepTakeTitle,
      localizations.onboardingStepTakeDescription,
    ),
  ];

  return Column(
    children: steps
        .map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        s.$1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          s.$2,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          s.$3,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList(),
  );
}

Widget _buildQuestionTypes(BuildContext context) {
  final theme = Theme.of(context);
  final localizations = AppLocalizations.of(context)!;
  final types = [
    (LucideIcons.circleDot, localizations.questionTypeSingleChoice),
    (LucideIcons.checkSquare, localizations.questionTypeMultipleChoice),
    (LucideIcons.toggleLeft, localizations.questionTypeTrueFalse),
    (LucideIcons.fileText, localizations.questionTypeEssay),
  ];

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    alignment: WrapAlignment.center,
    children: types
        .map(
          (t) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: theme.dividerColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(t.$1, color: theme.primaryColor, size: 20),
                const SizedBox(width: 10),
                Text(
                  t.$2,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        )
        .toList(),
  );
}

Widget _buildAiFeatures(BuildContext context) {
  final theme = Theme.of(context);
  final localizations = AppLocalizations.of(context)!;
  final features = [
    (
      LucideIcons.wand,
      localizations.onboardingAiAutoGenerateTitle,
      localizations.onboardingAiAutoGenerateDescription,
    ),
    (
      LucideIcons.messageCircle,
      localizations.onboardingAiStudyAssistantTitle,
      localizations.onboardingAiStudyAssistantDescription,
    ),
    (
      LucideIcons.languages,
      localizations.onboardingAiMultiLanguageTitle,
      localizations.onboardingAiMultiLanguageDescription,
    ),
  ];

  return Column(
    children: features
        .map(
          (f) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(f.$1, color: theme.primaryColor, size: 22),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          f.$2,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          f.$3,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList(),
  );
}
