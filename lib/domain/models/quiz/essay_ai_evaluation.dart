/// Enum representing the status of an AI evaluation for an essay question.
enum EssayAiEvaluationStatus {
  /// Evaluation is currently in progress.
  pending,

  /// Evaluation has been successfully completed.
  completed,

  /// Evaluation was intentionally skipped (e.g. AI assistant disabled).
  notEvaluated,

  /// An error occurred during evaluation.
  error,
}

/// Helper class to store AI evaluation data for essay questions.
class EssayAiEvaluation {
  final String? evaluation;
  final String? errorMessage;
  final EssayAiEvaluationStatus status;
  final int? score;

  EssayAiEvaluation({
    this.evaluation,
    this.errorMessage,
    this.status = EssayAiEvaluationStatus.completed,
    this.score,
  });

  /// Factory for a pending evaluation.
  factory EssayAiEvaluation.pending() =>
      EssayAiEvaluation(status: EssayAiEvaluationStatus.pending);

  /// Factory for a skipped evaluation.
  factory EssayAiEvaluation.notEvaluated() =>
      EssayAiEvaluation(status: EssayAiEvaluationStatus.notEvaluated);

  /// Factory for an evaluation with an error.
  factory EssayAiEvaluation.error(String message) => EssayAiEvaluation(
    errorMessage: message,
    status: EssayAiEvaluationStatus.error,
  );

  bool get hasError => status == EssayAiEvaluationStatus.error;
  bool get isPending => status == EssayAiEvaluationStatus.pending;
  bool get isCompleted => status == EssayAiEvaluationStatus.completed;
  bool get isNotEvaluated => status == EssayAiEvaluationStatus.notEvaluated;
}
