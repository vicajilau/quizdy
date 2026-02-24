import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_event.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class HomeFooterWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onCreateTap;
  final VoidCallback onGenerateAITap;

  const HomeFooterWidget({
    super.key,
    required this.isLoading,
    required this.onCreateTap,
    required this.onGenerateAITap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48, top: 32),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 412, minWidth: 292),
            child: QuizLabAIButton(
              title: AppLocalizations.of(context)!.generateQuestionsWithAI,
              icon: LucideIcons.sparkles,
              expanded: true,
              onPressed: isLoading ? null : onGenerateAITap,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200, minWidth: 140),
                child: QuizLabAIButton(
                  type: QuizlabAIButtonType.secondary,
                  title: AppLocalizations.of(context)!.create,
                  icon: LucideIcons.plus,
                  expanded: true,
                  onPressed: isLoading ? null : onCreateTap,
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200, minWidth: 140),
                child: QuizLabAIButton(
                  type: QuizlabAIButtonType.secondary,
                  title: AppLocalizations.of(context)!.load,
                  icon: LucideIcons.folderOpen,
                  expanded: true,
                  onPressed: isLoading
                      ? null
                      : () {
                          context.read<FileBloc>().add(QuizFileReset());
                          context.read<FileBloc>().add(QuizFilePickRequested());
                        },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
