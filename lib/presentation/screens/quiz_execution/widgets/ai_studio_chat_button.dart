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

import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

/// A button that opens the AI chat sidebar/panel for a specific question.
///
/// Unlike [AiAssistantButton] (which opens a dialog), this button triggers
/// a callback to open the persistent AI chat sidebar during quiz execution.
class AiStudioChatButton extends StatelessWidget {
  /// The question for which the AI chat is requested.
  final Question question;

  /// Callback invoked when the button is pressed.
  final VoidCallback onPressed;

  /// Whether the AI assistant is available (enabled and has API keys configured).
  final bool? isAiAvailable;

  const AiStudioChatButton({
    super.key,
    required this.question,
    required this.onPressed,
    this.isAiAvailable = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QuizLabAIButton(
              type: QuizlabAIButtonType.tertiary,
              title: l10n.askAiAboutQuestion,
              icon: Icons.auto_awesome,
              onPressed: isAiAvailable == true ? onPressed : null,
            ),
            if (isAiAvailable == false)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Text(
                  l10n.enableAiAssistant,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
