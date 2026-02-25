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

import 'dart:async';
import 'package:quizlab_ai/core/service_locator.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/data/services/configuration_service.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';
import 'package:quizlab_ai/data/services/quiz_service.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:go_router/go_router.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_event.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_state.dart';
import 'package:quizlab_ai/routes/app_router.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/quiz_in_progress_view.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/quiz_completed_view.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class QuizFileExecutionScreen extends StatefulWidget {
  final QuizFile quizFile;

  const QuizFileExecutionScreen({super.key, required this.quizFile});

  @override
  State<QuizFileExecutionScreen> createState() =>
      _QuizFileExecutionScreenState();
}

class _QuizFileExecutionScreenState extends State<QuizFileExecutionScreen> {
  bool _randomizeAnswers = false;
  bool _isReplacing = false;

  @override
  void initState() {
    super.initState();
    _loadQuizSettings();
  }

  Future<void> _loadQuizSettings() async {
    final randomizeAnswers = await ConfigurationService.instance
        .getRandomizeAnswers();

    if (mounted) {
      setState(() {
        _randomizeAnswers = randomizeAnswers;
      });
    }
  }

  // Helper to get effective randomize answers setting
  bool _getEffectiveRandomizeAnswers(QuizConfig? quizConfig) {
    if (quizConfig != null) return quizConfig.randomizeAnswers;
    return _randomizeAnswers;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return FutureBuilder(
      future: _prepareQuizQuestions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: isDark ? AppTheme.zinc900 : AppTheme.zinc50,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: isDark ? AppTheme.zinc900 : AppTheme.zinc50,
            body: Center(
              child: Text(
                AppLocalizations.of(
                  context,
                )!.errorLoadingFile(snapshot.error.toString()),
              ),
            ),
          );
        }

        final questionsToUse = snapshot.data as List<Question>;

        return MultiBlocProvider(
          providers: [
            BlocProvider<QuizExecutionBloc>(
              create: (_) {
                final quizConfig =
                    ServiceLocator.instance.getQuizConfig() ??
                    QuizConfig(
                      questionCount: questionsToUse.length,
                      isStudyMode: false,
                    );

                return ServiceLocator.instance.getIt<QuizExecutionBloc>()..add(
                  QuizExecutionStarted(questionsToUse, quizConfig: quizConfig),
                );
              },
            ),
            BlocProvider.value(
              value: ServiceLocator.instance.getIt<FileBloc>(),
            ),
          ],
          child: Builder(
            builder: (context) => BlocListener<FileBloc, FileState>(
              listener: (context, state) async {
                if (state is FileLoaded && _isReplacing) {
                  context.go(AppRoutes.fileLoadedScreen);
                } else if (state is FileReplacementRequest) {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          AppLocalizations.of(context)!.abortQuizTitle,
                        ),
                        content: Text(
                          AppLocalizations.of(context)!.abortQuizMessage,
                        ),
                        actions: [
                          QuizLabAIButton(
                            type: QuizlabAIButtonType.tertiary,
                            title: AppLocalizations.of(context)!.cancelButton,
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          QuizLabAIButton(
                            type: QuizlabAIButtonType.tertiary,
                            title: AppLocalizations.of(
                              context,
                            )!.stopAndOpenButton,
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  );

                  if (confirmed == true && context.mounted) {
                    setState(() {
                      _isReplacing = true;
                    });
                    context.read<FileBloc>().add(ConfirmFileReplacement());
                  } else if (context.mounted) {
                    context.read<FileBloc>().add(CancelFileReplacement());
                  }
                }
              },
              child: Scaffold(
                backgroundColor: isDark ? AppTheme.zinc900 : AppTheme.zinc50,
                body: SafeArea(
                  child: BlocConsumer<QuizExecutionBloc, QuizExecutionState>(
                    listener: (context, state) {
                      if (state is QuizExecutionCompleted) {
                        // Handled by view
                      }
                    },
                    builder: (context, state) {
                      if (state is QuizExecutionInitial) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is QuizExecutionInProgress) {
                        return QuizInProgressView(state: state);
                      } else if (state is QuizExecutionCompleted) {
                        return QuizCompletedView(state: state);
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<List<Question>> _prepareQuizQuestions() async {
    // Get the configured question count from service locator
    final quizConfig = ServiceLocator.instance.getQuizConfig();
    final questionCount =
        quizConfig?.questionCount ?? widget.quizFile.questions.length;

    // Get the configured question order
    final storedQuestionOrder = await ConfigurationService.instance
        .getQuestionOrder();
    final questionOrder = quizConfig?.questionOrder ?? storedQuestionOrder;

    // Filter out disabled questions first
    final enabledQuestions = widget.quizFile.questions
        .where((question) => question.isEnabled)
        .toList();

    // Select the questions to use for the quiz with the configured order
    List<Question> selectedQuestions = QuizService.selectQuestions(
      enabledQuestions,
      questionCount,
      order: questionOrder,
    );

    // Priority 1: Use QuizConfig from ServiceLocator (fresh from the dialog)
    // Priority 2: Use local state (loaded from ConfigurationService)
    final effectiveRandomizeAnswers = _getEffectiveRandomizeAnswers(quizConfig);

    // Apply answer randomization if enabled
    if (effectiveRandomizeAnswers) {
      selectedQuestions = QuizService.randomizeQuestionsAnswers(
        selectedQuestions,
      );
    }

    return selectedQuestions;
  }
}
