import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extensions.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/data/services/ai/ai_question_generation_service.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';
import 'package:quiz_app/data/services/ai/ai_service_selector.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/ai_evaluate_button.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/ai_evaluation_result.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/ai_service_selector.dart';

/// A widget that displays the result of an essay question.
///
/// It handles:
/// - Displaying the student's answer.
/// - Providing an interface to evaluate the answer using AI.
/// - Managing the state of AI availability and evaluation progress.
class QuizQuestionEssayResult extends StatefulWidget {
  /// The question result data.
  final QuestionResult result;

  /// Callback when the retry evaluation button is pressed.
  final VoidCallback? onRetryEvaluation;

  /// Creates a [QuizQuestionEssayResult] widget.
  const QuizQuestionEssayResult({
    super.key,
    required this.result,
    this.onRetryEvaluation,
  });

  @override
  State<QuizQuestionEssayResult> createState() =>
      _QuizQuestionEssayResultState();
}

class _QuizQuestionEssayResultState extends State<QuizQuestionEssayResult> {
  bool _isAIEnabled = false;
  bool _hasAPIKey = false;
  bool _isEvaluating = false;
  String? _aiEvaluation;
  List<AIService> _availableServices = [];
  AIService? _selectedService;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _checkAIAvailability();
  }

  /// Checks if AI services are enabled and available.
  Future<void> _checkAIAvailability() async {
    final aiEnabled = await ConfigurationService.instance.getIsAiAvailable();
    final availableServices = await AIServiceSelector.instance
        .getAvailableServices();

    if (mounted) {
      setState(() {
        _isAIEnabled = aiEnabled;
        _hasAPIKey = availableServices.isNotEmpty;
        _availableServices = availableServices;
        _selectedService = availableServices.isNotEmpty
            ? availableServices.first
            : null;
      });
    }
  }

  /// Initiates the AI evaluation process for the essay answer.
  Future<void> _evaluateEssayWithAI() async {
    if (_isEvaluating || _selectedService == null) return;

    setState(() {
      _errorMessage = null;
      _isEvaluating = true;
    });

    try {
      final localizations = AppLocalizations.of(context)!;

      // Build the evaluation prompt
      String prompt = AiQuestionGenerationService.buildEvaluationPrompt(
        widget.result.question.text,
        widget.result.essayAnswer,
        widget.result.question.explanation,
        localizations,
      );

      final evaluation = await _selectedService!.getChatResponse(
        prompt,
        localizations,
      );

      if (mounted) {
        setState(() {
          _aiEvaluation = evaluation;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = AppLocalizations.of(
            context,
          )!.aiEvaluationError(e.toString().cleanErrorMessage());
        });
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: widget.result.essayAnswer.trim().isNotEmpty
            ? Colors.blue.withValues(alpha: 0.05)
            : Colors.grey.withValues(alpha: 0.05),
        border: Border.all(
          color: widget.result.essayAnswer.trim().isNotEmpty
              ? Colors.blue.withValues(alpha: 0.3)
              : Colors.grey.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                widget.result.essayAnswer.trim().isNotEmpty
                    ? Icons.edit_note
                    : Icons.edit_off,
                color: widget.result.essayAnswer.trim().isNotEmpty
                    ? Colors.blue
                    : Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalizations.of(context)!.questionTypeEssay,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: widget.result.essayAnswer.trim().isNotEmpty
                      ? Colors.blue.shade800
                      : Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.result.essayAnswer,
            style: TextStyle(
              fontSize: 14,
              color: widget.result.essayAnswer.trim().isNotEmpty
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.grey.shade600,
              fontStyle: widget.result.essayAnswer.trim().isNotEmpty
                  ? FontStyle.normal
                  : FontStyle.italic,
            ),
          ),

          // Show AI evaluation if available in result or local state
          if (_isAIEnabled && _hasAPIKey) ...[
            const SizedBox(height: 12),
            _buildAiEvaluationContent(),
          ],
        ],
      ),
    );
  }

  Widget _buildAiEvaluationContent() {
    final aiEvaluation = widget.result.aiEvaluation;
    final status = aiEvaluation?.status ?? EssayAiEvaluationStatus.notEvaluated;

    // 1. Handle Pending State
    if (status == EssayAiEvaluationStatus.pending || _isEvaluating) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 8),
            Text(
              AppLocalizations.of(context)!.aiThinking,
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      );
    }

    // 2. Handle Completed State (from AI evaluation in result)
    if (aiEvaluation != null &&
        (aiEvaluation.isCompleted || aiEvaluation.hasError)) {
      return AiEvaluationResult(
        aiEvaluation: aiEvaluation.evaluation,
        errorMessage: aiEvaluation.errorMessage,
        selectedService: _selectedService,
        showServiceBadge: true,
        onRetry: widget.onRetryEvaluation,
      );
    }

    // 3. Handle Local Evaluation (manual trigger)
    if (_aiEvaluation != null || _errorMessage != null) {
      return AiEvaluationResult(
        aiEvaluation: _aiEvaluation,
        errorMessage: _errorMessage,
        selectedService: _selectedService,
        showServiceBadge: true,
      );
    }

    // 4. Handle Not Evaluated / Action required
    if (widget.result.essayAnswer.trim().isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AiServiceSelector(
            availableServices: _availableServices,
            selectedService: _selectedService,
            onServiceChanged: (newService) {
              setState(() {
                _selectedService = newService;
                _aiEvaluation = null;
              });
            },
          ),
          AiEvaluateButton(
            isEvaluating: _isEvaluating,
            selectedService: _selectedService,
            availableServicesCount: _availableServices.length,
            onEvaluate: _evaluateEssayWithAI,
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
