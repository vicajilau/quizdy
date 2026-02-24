import 'package:flutter/material.dart';

import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/ai_question_dialog.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

/// A button that triggers the AI Assistant dialog for a specific question.
///
/// This button is typically displayed when the user wants to ask for help or hints
/// regarding the current question.
class AiAssistantButton extends StatelessWidget {
  /// The question for which the AI assistance is requested.
  final Question question;

  /// Whether the AI assistant is available (enabled and has API keys configured).
  final bool isAiAvailable;

  /// Creates an [AiAssistantButton].
  const AiAssistantButton({
    super.key,
    required this.question,
    this.isAiAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Center(
            child: QuizLabAIButton(
              type: QuizlabAIButtonType.tertiary,
              title: l10n.askAiAssistant,
              icon: Icons.auto_awesome,
              onPressed: isAiAvailable
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AIQuestionDialog(question: question),
                      );
                    }
                  : null,
            ),
          ),
          if (!isAiAvailable)
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
    );
  }
}
