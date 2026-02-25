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
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class OnboardingNavButtons extends StatelessWidget {
  final bool isFirstPage;
  final bool isLastPage;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onFinish;

  const OnboardingNavButtons({
    super.key,
    required this.isFirstPage,
    required this.isLastPage,
    required this.onBack,
    required this.onNext,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    if (isFirstPage) {
      return QuizLabAIButton(
        title: localizations.next,
        icon: LucideIcons.arrowRight,
        expanded: true,
        onPressed: onNext,
      );
    }

    return Row(
      children: [
        Expanded(
          child: QuizLabAIButton(
            type: QuizlabAIButtonType.secondary,
            title: localizations.onboardingBack,
            icon: LucideIcons.arrowLeft,
            expanded: true,
            onPressed: onBack,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: QuizLabAIButton(
            title: isLastPage
                ? localizations.onboardingGetStarted
                : localizations.next,
            icon: isLastPage ? LucideIcons.rocket : LucideIcons.arrowRight,
            expanded: true,
            onPressed: isLastPage ? onFinish : onNext,
          ),
        ),
      ],
    );
  }
}
