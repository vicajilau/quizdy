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

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizlab_ai/core/context_extension.dart';
import 'package:quizlab_ai/domain/models/custom_exceptions/bad_quiz_file_exception.dart';
import 'package:quizlab_ai/presentation/utils/dialog_drop_guard.dart';

import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/service_locator.dart';
import 'package:quizlab_ai/routes/app_router.dart';
import 'package:quizlab_ai/core/constants/quiz_metadata.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_event.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_state.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/quiz_metadata_dialog.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/settings_dialog.dart';
import 'package:quizlab_ai/domain/models/ai/ai_generation_config.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/ai_generate_questions_dialog.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/custom_confirm_dialog.dart';
import 'package:quizlab_ai/data/services/configuration_service.dart';
import 'package:quizlab_ai/data/services/ai/ai_question_generation_service.dart';
import 'package:quizlab_ai/core/extensions/string_extensions.dart';
import 'package:quizlab_ai/presentation/screens/widgets/home/home_header_widget.dart';
import 'package:quizlab_ai/presentation/screens/widgets/home/home_drop_zone_widget.dart';
import 'package:quizlab_ai/presentation/screens/widgets/home/home_footer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;
  bool _isDragging = false;

  void _pickFile(BuildContext context) {
    if (_isLoading) return;
    context.read<FileBloc>().add(QuizFilePickRequested());
  }

  Future<void> _showCreateQuizFileDialog(BuildContext context) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const QuizMetadataDialog(),
    );

    if (result != null && result.isNotEmpty && context.mounted) {
      final name = result['name']?.trim() ?? '';
      final description = result['description']?.trim() ?? '';
      const version = QuizMetadataConstants.version;
      final author = result['author']?.trim() ?? '';

      if (name.isNotEmpty && description.isNotEmpty && author.isNotEmpty) {
        context.read<FileBloc>().add(
          CreateQuizMetadata(
            name: name,
            version: version,
            description: description,
            author: author,
          ),
        );
      } else {
        context.presentSnackBar(
          AppLocalizations.of(context)!.requiredFieldsError,
        );
      }
    }
  }

  Future<void> _showSettingsDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const SettingsDialog(),
    );
  }

  Future<void> _generateQuestionsWithAI(BuildContext context) async {
    try {
      final isAiAvailable = await ConfigurationService.instance
          .getIsAiAvailable();

      if (!isAiAvailable) {
        if (context.mounted) {
          context.presentSnackBar(
            AppLocalizations.of(context)!.aiApiKeyRequired,
          );
        }
        return;
      }

      // Show AI generation dialog
      if (!context.mounted) return;
      final config = await showDialog<AiQuestionGenerationConfig>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const AiGenerateQuestionsDialog(),
      );

      if (config == null || !context.mounted) return;

      // Show loading
      setState(() => _isLoading = true);
      // Wait a frame to show loading
      await Future.delayed(Duration.zero);

      try {
        // Generate questions with AI
        final aiService = AiQuestionGenerationService();
        if (!context.mounted) return;
        final localizations = AppLocalizations.of(context)!;
        final generatedQuestions = await aiService.generateQuestions(
          config,
          localizations: localizations,
        );

        if (generatedQuestions.isEmpty) {
          setState(() => _isLoading = false);
          if (context.mounted) {
            context.presentSnackBar(
              AppLocalizations.of(context)!.aiGenerationFailed,
            );
          }
          return;
        }

        if (context.mounted) {
          final unknownValue = AppLocalizations.of(
            context,
          )!.questionTypeUnknown;
          context.read<FileBloc>().add(
            CreateQuizWithQuestions(
              name: unknownValue,
              version: QuizMetadataConstants.version,
              description: unknownValue,
              author: unknownValue,
              questions: generatedQuestions,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          setState(() => _isLoading = false);
          await showDialog(
            context: context,
            builder: (context) => CustomConfirmDialog(
              title: AppLocalizations.of(context)!.aiGenerationErrorTitle,
              message: e.toString().cleanExceptionPrefix(),
              confirmText: AppLocalizations.of(context)!.acceptButton,
              showCloseButton: false,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        setState(() => _isLoading = false);
        context.presentSnackBar('Error: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FileBloc>.value(
      value: ServiceLocator.instance.getIt<FileBloc>(),
      child: BlocListener<FileBloc, FileState>(
        listener: (context, state) async {
          if (state is FileLoaded) {
            setState(() => _isLoading = false);
            context.go(AppRoutes.fileLoadedScreen);
          }
          if (state is FileError && context.mounted) {
            setState(() => _isLoading = false);
            if (state.error is BadQuizFileException) {
              final badFileException = state.error as BadQuizFileException;
              context.presentSnackBar(badFileException.toString());
            } else {
              context.presentSnackBar(state.getDescription(context));
            }
          }
          if (state is FileLoading) {
            setState(() => _isLoading = true);
          } else if (state is FileInitial) {
            setState(() => _isLoading = false);
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: DropTarget(
                onDragDone: (details) {
                  if (DialogDropGuard.isActive) {
                    setState(() => _isDragging = false);
                    return;
                  }
                  if (details.files.isNotEmpty && !_isLoading) {
                    if (context.currentRoute != AppRoutes.home) return;

                    final firstFile = details.files.first;
                    if (firstFile.path.isNotEmpty) {
                      if (!firstFile.name.toLowerCase().endsWith('.quiz')) {
                        context.presentSnackBar(
                          AppLocalizations.of(context)!.errorInvalidFile,
                        );
                        return;
                      }
                      context.read<FileBloc>().add(QuizFileReset());
                      context.read<FileBloc>().add(FileDropped(firstFile.path));
                    }
                  }
                  setState(() => _isDragging = false);
                },
                onDragEntered: (_) {
                  if (!DialogDropGuard.isActive) {
                    setState(() => _isDragging = true);
                  }
                },
                onDragExited: (_) => setState(() => _isDragging = false),
                child: Stack(
                  children: [
                    SafeArea(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isMobile = constraints.maxWidth < 600;
                          // Calculate the visual top margin:
                          // SafeArea (padding.top) + Header centering offset ((72 - 48) / 2 = 12)
                          final topPadding = MediaQuery.of(context).padding.top;
                          final visualTopMargin = topPadding + 12.0;

                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constraints.maxHeight,
                              ),
                              child: IntrinsicHeight(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isMobile
                                        ? visualTopMargin
                                        : 48.0,
                                  ),
                                  child: Column(
                                    children: [
                                      HomeHeaderWidget(
                                        isLoading: _isLoading,
                                        onSettingsTap: () =>
                                            _showSettingsDialog(context),
                                      ),
                                      Expanded(
                                        child: HomeDropZoneWidget(
                                          isDragging: _isDragging,
                                          onTap: () => _pickFile(context),
                                        ),
                                      ),
                                      HomeFooterWidget(
                                        isLoading: _isLoading,
                                        onCreateTap: () =>
                                            _showCreateQuizFileDialog(context),
                                        onGenerateAITap: () =>
                                            _generateQuestionsWithAI(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (_isLoading)
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.3),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
