import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/domain/models/quiz/quiz_config.dart';
import 'package:quiz_app/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';

/// Abstract class representing the base event for quiz execution operations.
abstract class QuizExecutionEvent {}

/// Event triggered when the quiz execution starts.
class QuizExecutionStarted extends QuizExecutionEvent {
  final List<Question> questions;
  final QuizConfig quizConfig;

  QuizExecutionStarted(this.questions, {required this.quizConfig});
}

/// Event triggered when a user selects an answer.
class AnswerSelected extends QuizExecutionEvent {
  final int optionIndex;
  final bool isSelected;

  AnswerSelected(this.optionIndex, this.isSelected);
}

/// Event triggered when a user changes essay answer text.
class EssayAnswerChanged extends QuizExecutionEvent {
  final String text;

  EssayAnswerChanged(this.text);
}

/// Event triggered when the user wants to check the answer (Study Mode).
class CheckAnswerRequested extends QuizExecutionEvent {}

/// Event triggered when the user wants to go to the next question.
class NextQuestionRequested extends QuizExecutionEvent {}

/// Event triggered when the user wants to go to the previous question.
class PreviousQuestionRequested extends QuizExecutionEvent {}

/// Event triggered when the user submits the quiz.
class QuizSubmitted extends QuizExecutionEvent {
  final bool isAiAvailable;

  QuizSubmitted({this.isAiAvailable = false});
}

/// Event to request an AI evaluation for an essay question.
class EssayAiEvaluationRequested extends QuizExecutionEvent {
  final int questionIndex;
  final AppLocalizations localizations;

  EssayAiEvaluationRequested(this.questionIndex, this.localizations);
}

class EssayAiEvaluationReceived extends QuizExecutionEvent {
  final int questionIndex;
  final EssayAiEvaluation evaluation;
  EssayAiEvaluationReceived(this.questionIndex, this.evaluation);
}

class EssayAiEvaluationRetryRequested extends QuizExecutionEvent {
  final int questionIndex;
  final AppLocalizations localizations;

  EssayAiEvaluationRetryRequested(this.questionIndex, this.localizations);
}

/// Event triggered when the user wants to jump to a specific question index.
class JumpToQuestionRequested extends QuizExecutionEvent {
  final int index;

  JumpToQuestionRequested(this.index);
}

/// Event triggered when the user wants to restart the quiz.
class QuizRestarted extends QuizExecutionEvent {}

/// Event triggered when the user wants to retry only failed questions.
class RetryFailedQuestionsRequested extends QuizExecutionEvent {}
