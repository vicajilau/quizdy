/// Types of questions that the AI can generate.
enum AiQuestionType {
  /// Multiple choice with 4 options.
  multipleChoice,

  /// Single choice question.
  singleChoice,

  /// True or false question.
  trueFalse,

  /// Open-ended essay question.
  essay,

  /// A mix of all available question types.
  random,
}
