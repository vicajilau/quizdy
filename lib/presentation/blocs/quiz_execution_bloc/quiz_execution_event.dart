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

import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';
import 'package:quizlab_ai/domain/models/quiz/essay_ai_evaluation.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';

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
