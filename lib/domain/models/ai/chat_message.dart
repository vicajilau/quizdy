import 'package:quiz_app/domain/models/quiz/question.dart';

/// Represents a single message in the AI chat history.
///
/// This model holds the text content, the sender type (user or AI),
/// and metadata like error status and timestamp.
class ChatMessage {
  /// The actual text content of the message.
  final String content;

  /// Whether the message was sent by the user (`true`) or the AI (`false`).
  final bool isUser;

  /// Whether this message represents an error state (e.g., API failure).
  final bool isError;

  /// The time when the message was created.
  final DateTime timestamp;

  /// The quiz question that was active when this message was sent.
  /// Only set on user messages to display question context in the chat.
  final Question? questionContext;

  /// Creates a new [ChatMessage].
  ///
  /// [timestamp] defaults to [DateTime.now()] if not provided.
  ChatMessage({
    required this.content,
    required this.isUser,
    this.isError = false,
    this.questionContext,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
