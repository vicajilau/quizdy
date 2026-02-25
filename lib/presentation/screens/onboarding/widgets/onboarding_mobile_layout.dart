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
import 'package:google_fonts/google_fonts.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/blocs/onboarding_cubit/onboarding_cubit.dart';
import 'package:quizlab_ai/presentation/blocs/onboarding_cubit/onboarding_state.dart';
import 'package:quizlab_ai/presentation/screens/onboarding/widgets/onboarding_nav_buttons.dart';
import 'package:quizlab_ai/presentation/screens/onboarding/widgets/onboarding_page_data.dart';
import 'package:quizlab_ai/presentation/screens/onboarding/widgets/onboarding_page_indicator.dart';

class OnboardingDesktopLayout extends StatelessWidget {
  final OnboardingState state;
  final List<OnboardingPageData> pages;
  final PageController pageController;
  final OnboardingCubit cubit;
  final VoidCallback onFinish;

  const OnboardingDesktopLayout({
    super.key,
    required this.state,
    required this.pages,
    required this.pageController,
    required this.cubit,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          // Two-column content with floating Skip button
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  onPageChanged: cubit.setPage,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return OnboardingDesktopPageContent(page: page);
                  },
                ),
                if (!state.isLastPage)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TextButton(
                      onPressed: onFinish,
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Bottom bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OnboardingPageIndicator(
                currentPage: state.currentPage,
                totalPages: state.totalPages,
              ),
              SizedBox(
                width: state.isFirstPage ? 200 : 360,
                child: OnboardingNavButtons(
                  isFirstPage: state.isFirstPage,
                  isLastPage: state.isLastPage,
                  onBack: cubit.previousPage,
                  onNext: cubit.nextPage,
                  onFinish: onFinish,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingDesktopPageContent extends StatelessWidget {
  final OnboardingPageData page;

  const OnboardingDesktopPageContent({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Left column - illustration
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (page.imagePath != null)
                Image.asset(page.imagePath!, width: 400, height: 400)
              else
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(page.icon, color: theme.primaryColor, size: 72),
                ),
              const SizedBox(height: 24),
              Text(
                page.subtitle ?? '',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16,
                  color: theme.hintColor,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 64),

        // Right column - text + content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  page.title,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  page.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    height: 1.6,
                    color: theme.hintColor,
                  ),
                ),

                const SizedBox(height: 28),

                page.contentBuilder(context),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
