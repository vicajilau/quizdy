import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(32),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.confirmExitTitle,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: colors.title,
                      height: 1.2,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(false),
                  style: IconButton.styleFrom(
                    backgroundColor: colors.surface,
                    fixedSize: const Size(40, 40),
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                  ),
                  icon: Icon(Icons.close, size: 20, color: colors.subtitle),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Content
            Text(
              AppLocalizations.of(context)!.confirmExitMessage,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colors.subtitle,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),

            // Buttons
            QuizLabAIButton(
              type: QuizlabAIButtonType.warning,
              title: AppLocalizations.of(context)!.exitButton,
              expanded: true,
              onPressed: () => context.pop(true),
            ),
          ],
        ),
      ),
    );
  }
}
