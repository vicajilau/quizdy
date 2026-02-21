import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quiz_app/presentation/blocs/file_bloc/file_event.dart';

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
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : onGenerateAITap,
                icon: Icon(
                  LucideIcons.sparkles,
                  size: 20,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                label: Text(
                  AppLocalizations.of(context)!.generateQuestionsWithAI,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
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
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: isLoading ? null : onCreateTap,
                    icon: const Icon(LucideIcons.plus, size: 22),
                    label: Text(
                      AppLocalizations.of(context)!.create,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200, minWidth: 140),
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<FileBloc>().add(QuizFileReset());
                            context.read<FileBloc>().add(
                              QuizFilePickRequested(),
                            );
                          },
                    icon: const Icon(LucideIcons.folderOpen, size: 22),
                    label: Text(
                      AppLocalizations.of(context)!.load,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
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
