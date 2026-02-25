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
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/ai_studio_chat_button.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/ai_evaluation_result.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/quiz_question_explanation.dart';

/// A widget that handles essay-type questions.
///
/// It provides a text input area for the user to type their answer.
/// It also handles the integration with AI services to evaluate the essay
/// when in Study Mode and AI is available.
class EssayAnswerInput extends StatefulWidget {
  /// The essay question being answered.
  final Question question;

  /// The index of the question in the quiz.
  final int questionIndex;

  /// The current text answer provided by the user.
  final String currentAnswer;

  /// Whether the quiz is in Study Mode.
  final bool isStudyMode;

  /// Whether AI assistance features are available/enabled.
  final bool isAiAvailable;

  /// The current execution state of the quiz.
  final QuizExecutionInProgress state;

  /// Callback to open the AI chat panel with an optional pre-filled question.
  final void Function({String? prefillText})? onAskAi;

  /// Creates an [EssayAnswerInput].
  const EssayAnswerInput({
    super.key,
    required this.question,
    required this.questionIndex,
    required this.currentAnswer,
    required this.isStudyMode,
    required this.isAiAvailable,
    required this.state,
    this.onAskAi,
  });

  @override
  State<EssayAnswerInput> createState() => _EssayAnswerInputState();
}

class _EssayAnswerInputState extends State<EssayAnswerInput> {
  late TextEditingController _essayController;

  @override
  void initState() {
    super.initState();
    _essayController = TextEditingController(text: widget.currentAnswer);
  }

  @override
  void didUpdateWidget(EssayAnswerInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    final currentAiEvaluation = widget.state.currentAiEvaluation;

    // Auto-trigger AI evaluation when question is validated in Study Mode
    if (widget.isStudyMode &&
        widget.isAiAvailable &&
        widget.state.isCurrentQuestionValidated &&
        !oldWidget.state.isCurrentQuestionValidated &&
        currentAiEvaluation == null) {
      _requestAiEvaluation();
    }

    if (widget.currentAnswer != _essayController.text) {
      // Only update if external change (e.g. navigation) to avoid cursor jump issues
      // But usually we want to keep what user is typing.
      // The parent ensures this widget is rebuilt when question index changes.
      if (oldWidget.questionIndex != widget.questionIndex) {
        _essayController.text = widget.currentAnswer;
      }
    }
  }

  @override
  void dispose() {
    _essayController.dispose();
    super.dispose();
  }

  void _requestAiEvaluation() {
    final localizations = AppLocalizations.of(context)!;
    final bloc = context.read<QuizExecutionBloc>();
    // Set pending state immediately so UI shows loading
    bloc.add(
      EssayAiEvaluationReceived(
        widget.questionIndex,
        EssayAiEvaluation.pending(),
      ),
    );
    bloc.add(EssayAiEvaluationRequested(widget.questionIndex, localizations));
  }

  @override
  Widget build(BuildContext context) {
    final aiEvaluationData = widget.state.currentAiEvaluation;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI Chat Button (opens sidebar, visible in Study Mode)
          Text(
            AppLocalizations.of(context)!.questionTypeEssay,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: TextField(
              controller: _essayController,
              minLines: 5,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.explanationHint,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontFamily: 'Inter',
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              readOnly:
                  widget.isStudyMode && widget.state.isCurrentQuestionValidated,
              onChanged: (text) {
                context.read<QuizExecutionBloc>().add(EssayAnswerChanged(text));
              },
            ),
          ),

          if (widget.isStudyMode) ...[
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: AiStudioChatButton(
                question: widget.question,
                onPressed: () => widget.onAskAi!(
                  prefillText: AppLocalizations.of(context)!.aiHelpWithQuestion,
                ),
                isAiAvailable: widget.isAiAvailable,
              ),
            ),
          ],

          // Show explanation in Study Mode after validation
          if (widget.isStudyMode &&
              widget.state.isCurrentQuestionValidated &&
              widget.question.explanation.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                children: [
                  // Reusing existing explanation widget
                  QuizQuestionExplanation(
                    explanation: widget.question.explanation,
                  ),

                  // AI Evaluation Section
                  if (widget.isAiAvailable) ...[
                    const SizedBox(height: 16),
                    if (aiEvaluationData != null && aiEvaluationData.isPending)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: Column(
                            children: [
                              const CircularProgressIndicator(),
                              const SizedBox(height: 16),
                              Text(
                                AppLocalizations.of(context)!.aiThinking,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else if (aiEvaluationData != null &&
                        !aiEvaluationData.isPending)
                      AiEvaluationResult(
                        aiEvaluation: aiEvaluationData.evaluation,
                        errorMessage: aiEvaluationData.errorMessage,
                        onRetry: () {
                          final localizations = AppLocalizations.of(context)!;
                          context.read<QuizExecutionBloc>().add(
                            EssayAiEvaluationRetryRequested(
                              widget.questionIndex,
                              localizations,
                            ),
                          );
                        },
                      ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}
