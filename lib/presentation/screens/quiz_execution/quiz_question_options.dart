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
import 'package:quizlab_ai/data/services/configuration_service.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/ai_studio_chat_button.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/essay_answer_input.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/question_option_tile.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/widgets/quiz_question_explanation.dart';

/// A widget that displays the list of answer options for a quiz question.
///
/// It delegates to specific widgets based on the question type:
/// - [EssayAnswerInput] for essay questions.
/// - [QuestionOptionTile] for multiple choice and single choice questions.
///
/// It also handles displaying the "Ask AI Assistant" button and the
/// explanation section in Study Mode.
class QuizQuestionOptions extends StatefulWidget {
  /// The current state of the quiz execution.
  final QuizExecutionInProgress state;

  /// Whether to show a hint about the number of correct answers (for multiple choice).
  final bool showCorrectAnswerCount;

  /// Whether the quiz is in Study Mode (immediate feedback enabled).
  final bool isStudyMode;

  /// Callback to open the AI chat panel, optionally with a pre-filled question.
  final void Function({String? prefillText})? onAskAi;

  /// Creates a [QuizQuestionOptions] widget.
  const QuizQuestionOptions({
    super.key,
    required this.state,
    this.showCorrectAnswerCount = false,
    this.isStudyMode = false,
    this.onAskAi,
  });

  @override
  State<QuizQuestionOptions> createState() => _QuizQuestionOptionsState();
}

class _QuizQuestionOptionsState extends State<QuizQuestionOptions> {
  bool _isAiAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkAiAvailability();
  }

  Future<void> _checkAiAvailability() async {
    final isAiAvailable = await ConfigurationService.instance
        .getIsAiAvailable();

    if (mounted) {
      setState(() {
        _isAiAvailable = isAiAvailable;
      });
    }
  }

  @override
  void didUpdateWidget(QuizQuestionOptions oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-check availability in case settings changed (less likely but good practice)
    _checkAiAvailability();
  }

  @override
  Widget build(BuildContext context) {
    final questionType = widget.state.currentQuestion.type;
    final correctAnswersCount =
        widget.state.currentQuestion.correctAnswers.length;

    // Handle essay questions separately
    if (questionType == QuestionType.essay) {
      return EssayAnswerInput(
        question: widget.state.currentQuestion,
        questionIndex: widget.state.currentQuestionIndex,
        currentAnswer:
            widget.state.essayAnswers[widget.state.currentQuestionIndex] ?? '',
        isStudyMode: widget.isStudyMode,
        isAiAvailable: _isAiAvailable,
        state: widget.state,
        onAskAi: widget.onAskAi,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AI Chat Button (opens sidebar, visible in Study Mode when AI is available)

        // Show correct answer count hint for multiple choice questions
        if (widget.showCorrectAnswerCount &&
            questionType == QuestionType.multipleChoice &&
            correctAnswersCount > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(
                      context,
                    )!.correctAnswersCount(correctAnswersCount),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Options list
        if (questionType == QuestionType.multipleChoice)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.state.currentQuestion.options.length,
            itemBuilder: (context, index) {
              final option = widget.state.currentQuestion.options[index];
              final isSelected = widget.state.isOptionSelected(index);

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: QuestionOptionTile(
                  questionType: questionType,
                  option: option,
                  index: index,
                  isSelected: isSelected,
                  isStudyMode: widget.isStudyMode,
                  state: widget.state,
                ),
              );
            },
          )
        else
          RadioGroup<int>(
            groupValue: widget.state.currentQuestionAnswers.isNotEmpty
                ? widget.state.currentQuestionAnswers.first
                : null,
            onChanged: (int? value) {
              // In Study Mode, check if question is validated before locking
              if (widget.isStudyMode &&
                  widget.state.isCurrentQuestionValidated) {
                return; // Prevent changing answer if already validated
              }

              if (value != null) {
                context.read<QuizExecutionBloc>().add(
                  AnswerSelected(value, true),
                );
              }
            },
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.state.currentQuestion.options.length,
              itemBuilder: (context, index) {
                final option = widget.state.currentQuestion.options[index];
                final isSelected = widget.state.isOptionSelected(index);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: QuestionOptionTile(
                    questionType: questionType,
                    option: option,
                    index: index,
                    isSelected: isSelected,
                    isStudyMode: widget.isStudyMode,
                    state: widget.state,
                  ),
                );
              },
            ),
          ),

        if (widget.isStudyMode) ...[
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: AiStudioChatButton(
              question: widget.state.currentQuestion,
              onPressed: () => widget.onAskAi!(
                prefillText: AppLocalizations.of(context)!.aiHelpWithQuestion,
              ),
              isAiAvailable: _isAiAvailable,
            ),
          ),
        ],

        // Show explanation in Study Mode after answering and validation
        if (widget.isStudyMode &&
            widget.state.isCurrentQuestionValidated &&
            widget.state.currentQuestion.explanation.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: QuizQuestionExplanation(
              explanation: widget.state.currentQuestion.explanation,
            ),
          ),
      ],
    );
  }
}
