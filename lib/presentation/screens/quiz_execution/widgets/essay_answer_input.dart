import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';
import 'package:quiz_app/data/services/ai/ai_service_selector.dart';
import 'package:quiz_app/data/services/ai/ai_question_generation_service.dart';
import 'package:quiz_app/core/extensions/string_extensions.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/ai_studio_chat_button.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/ai_evaluation_result.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/quiz_question_explanation.dart';

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
  bool _isEvaluating = false;
  List<AIService> _availableServices = [];
  AIService? _selectedService;

  @override
  void initState() {
    super.initState();
    _essayController = TextEditingController(text: widget.currentAnswer);
    _loadAvailableServices();
  }

  Future<void> _loadAvailableServices() async {
    final services = await AIServiceSelector.instance.getAvailableServices();
    if (mounted) {
      setState(() {
        _availableServices = services;
        _selectedService = services.isNotEmpty ? services.first : null;
      });
    }
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
        currentAiEvaluation == null &&
        !_isEvaluating) {
      // Small delay to ensure services are loaded if they haven't yet
      if (_selectedService == null) {
        _loadAvailableServices().then((_) {
          if (_selectedService != null) {
            _evaluateEssayWithAI();
          }
        });
      } else {
        _evaluateEssayWithAI();
      }
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

  Future<void> _evaluateEssayWithAI() async {
    if (_isEvaluating ||
        (_availableServices.isEmpty && _selectedService == null)) {
      return;
    }

    setState(() {
      _isEvaluating = true;
    });

    context.read<QuizExecutionBloc>().add(EssayAiEvaluationStarted());

    try {
      final localizations = AppLocalizations.of(context)!;
      final studentAnswer = widget.currentAnswer;

      // Build the evaluation prompt
      String prompt = AiQuestionGenerationService.buildEvaluationPrompt(
        widget.question.text,
        studentAnswer,
        widget.question.explanation,
        localizations,
      );

      final evaluation = await _selectedService!.getChatResponse(
        prompt,
        localizations,
      );

      if (mounted) {
        context.read<QuizExecutionBloc>().add(
          EssayAiEvaluationReceived(
            questionIndex: widget.questionIndex,
            evaluation: evaluation,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        context.read<QuizExecutionBloc>().add(
          EssayAiEvaluationReceived(
            questionIndex: widget.questionIndex,
            errorMessage: AppLocalizations.of(
              context,
            )!.aiEvaluationError(e.toString().cleanErrorMessage()),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isEvaluating = false;
        });
      }
    }
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
                    if (_isEvaluating)
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
                    else if (aiEvaluationData != null)
                      AiEvaluationResult(
                        aiEvaluation: aiEvaluationData.evaluation,
                        errorMessage: aiEvaluationData.errorMessage,
                        selectedService: _selectedService,
                        showServiceBadge: _availableServices.length > 1,
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
