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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class QuizTryAgainButton extends StatelessWidget {
  const QuizTryAgainButton({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizLabAIButton(
      title: AppLocalizations.of(context)!.tryAgain,
      icon: Icons.refresh,
      expanded: true,
      onPressed: () {
        final bloc = BlocProvider.of<QuizExecutionBloc>(context);
        bloc.add(QuizRestarted());
      },
    );
  }
}

class QuizRetryFailedButton extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onPressed;

  const QuizRetryFailedButton({
    super.key,
    required this.isDarkMode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return QuizLabAIButton(
      type: QuizlabAIButtonType.secondary,
      title: AppLocalizations.of(context)!.retryFailedQuestions,
      icon: Icons.quiz_outlined,
      expanded: true,
      onPressed: onPressed,
    );
  }
}

class QuizHomeButton extends StatelessWidget {
  final bool isDarkMode;

  const QuizHomeButton({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return QuizLabAIButton(
      type: QuizlabAIButtonType.secondary,
      title: AppLocalizations.of(context)!.home,
      icon: Icons.home_outlined,
      expanded: true,
      onPressed: () => context.pop(),
    );
  }
}
