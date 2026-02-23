import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/extensions/string_extensions.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';
import 'package:quiz_app/data/services/ai/ai_question_generation_service.dart';
import 'package:quiz_app/presentation/widgets/ai_service_model_selector.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:quiz_app/domain/models/ai/chat_message.dart';
import 'package:quiz_app/presentation/screens/dialogs/widgets/ai_chat_bubble.dart';
import 'package:quiz_app/presentation/screens/dialogs/widgets/question_context_widget.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quiz_app/core/extensions/focus_node_extension.dart';

class AIQuestionDialog extends StatefulWidget {
  final Question question;

  const AIQuestionDialog({super.key, required this.question});

  @override
  State<AIQuestionDialog> createState() => _AIQuestionDialogState();
}

class _AIQuestionDialogState extends State<AIQuestionDialog> {
  final TextEditingController _questionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = false;

  // Chat state
  final List<ChatMessage> _messages = [];

  // Service Selection
  AIService? _selectedService;
  String? _selectedModel;

  // Last user question for retry functionality
  String? _lastUserQuestion;

  @override
  void initState() {
    super.initState();
    _focusNode.setupAiChatKeyHandler(_askAI);
  }

  @override
  void dispose() {
    _questionController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  /// Preprocesses the AI response to normalize LaTeX delimiters.
  String _preprocessResponse(String response) {
    // Replace $$ ... $$ with \[ ... \] for display math
    response = response.replaceAllMapped(
      RegExp(r'\$\$(.*?)\$\$', dotAll: true),
      (match) => '\\[${match.group(1)}\\]',
    );

    // Replace $ ... $ with \( ... \) for inline math
    response = response.replaceAllMapped(
      RegExp(r'(?<!\$)\$([^$]+)\$(?!\$)'),
      (match) => '\\(${match.group(1)}\\)',
    );

    return response;
  }

  String _buildPrompt(String userQuestion) {
    final localizations = AppLocalizations.of(context)!;
    return AiQuestionGenerationService.buildChatPrompt(
      question: widget.question,
      userQuestion: userQuestion,
      localizations: localizations,
    );
  }

  Future<void> _askAI({String? retryQuestion}) async {
    final userText = retryQuestion ?? _questionController.text.trim();
    if (userText.isEmpty) {
      return;
    }

    final localizations = AppLocalizations.of(context)!;

    // Store the question for potential retry
    _lastUserQuestion = userText;

    setState(() {
      if (retryQuestion == null) {
        // If last message is an error, remove both the error and the previous user question
        if (_messages.isNotEmpty && _messages.last.isError) {
          _messages.removeLast(); // Remove error message
          if (_messages.isNotEmpty && _messages.last.isUser) {
            _messages
                .removeLast(); // Remove previous user question that caused the error
          }
        }
        _messages.add(ChatMessage(content: userText, isUser: true));
      }
      _isLoading = true;
    });

    _questionController.clear();
    _scrollToBottom();

    try {
      // Check if AI assistant is enabled
      final isAiEnabled = await ConfigurationService.instance
          .getIsAiAvailable();
      if (!isAiEnabled) {
        setState(() {
          _messages.add(
            ChatMessage(
              content: localizations.aiAssistantSettingsDescription,
              isUser: false,
              isError: true,
            ),
          );
          _isLoading = false;
        });
        return;
      }

      // Check if we have a selected AI service
      if (_selectedService == null) {
        setState(() {
          _messages.add(
            ChatMessage(
              content:
                  '${localizations.aiErrorResponse}\n\n${localizations.configureApiKeyMessage}',
              isUser: false,
              isError: true,
            ),
          );
          _isLoading = false;
        });
        return;
      }

      // Build the prompt with question context
      final prompt = _buildPrompt(userText);

      // Make API call to the selected AI service
      // Note: Passing _selectedModel if the service supports it would be better,
      // but getChatResponse might not accept it yet.
      // Assuming getChatResponse uses default or configured model.
      final response = await _selectedService!.getChatResponse(
        prompt,
        localizations,
        model: _selectedModel,
      );

      // Preprocess response to fix LaTeX delimiters
      final processedResponse = _preprocessResponse(response);

      setState(() {
        _messages.add(ChatMessage(content: processedResponse, isUser: false));
        _isLoading = false;
      });

      _scrollToBottom();
    } catch (e) {
      if (mounted) {
        setState(() {
          _messages.add(
            ChatMessage(
              content:
                  '${localizations.aiErrorResponse}\n\n${localizations.errorLabel} ${e.toString().cleanErrorMessage()}',
              isUser: false,
              isError: true,
            ),
          );
          _isLoading = false;
        });
        _scrollToBottom();
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _retryLastQuestion(int errorMessageIndex) {
    if (_lastUserQuestion == null) return;

    setState(() {
      // Remove the error message
      _messages.removeAt(errorMessageIndex);
    });

    // Retry with the last question
    _askAI(retryQuestion: _lastUserQuestion);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;

    // Design Tokens
    final borderColor = isDark ? Colors.transparent : AppTheme.borderColor;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
          maxHeight: 680,
        ), // Max dimensions from design
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 1),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.sparkles,
                        color: AppTheme.primaryColor, // Violet 500
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          localizations.aiAssistantTitle,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: colors.title,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(LucideIcons.x, color: colors.subtitle, size: 20),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    style: IconButton.styleFrom(
                      backgroundColor: colors.surface,
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Selectors & Chat Content
            Expanded(
              child: Column(
                children: [
                  // Selectors
                  AiServiceModelSelector(
                    onServiceChanged: (service) {
                      setState(() {
                        _selectedService = service;
                      });
                    },
                    onModelChanged: (model) {
                      setState(() {
                        _selectedModel = model;
                      });
                    },
                    saveToPreferences: true,
                  ),
                  const SizedBox(height: 16),

                  // Chat Area
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount:
                          1 +
                          _messages.length +
                          (_isLoading ? 1 : 0), // Context + Messages + Loading
                      itemBuilder: (context, index) {
                        // 0. Question Context
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: QuestionContextWidget(
                              question: widget.question,
                            ),
                          );
                        }

                        // 1. Chat Messages
                        final messageIndex = index - 1;
                        if (messageIndex < _messages.length) {
                          final message = _messages[messageIndex];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: AiChatBubble(
                              content: message.content,
                              isUser: message.isUser,
                              isError: message.isError,
                              aiServiceName: message.isUser
                                  ? null
                                  : _selectedService?.serviceName,
                              onRetry: message.isError
                                  ? () => _retryLastQuestion(messageIndex)
                                  : null,
                            ),
                          );
                        }

                        // 2. Loading Indicator
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  localizations.aiThinking,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Input Area
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark ? AppTheme.borderColorDark : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: isDark
                          ? null
                          : Border.all(color: AppTheme.borderColor),
                    ),
                    child: TextField(
                      controller: _questionController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: localizations.askAIHint,
                        hintStyle: TextStyle(
                          color: isDark
                              ? AppTheme.zinc400
                              : AppTheme.textSecondaryColor,
                          fontFamily: 'Inter',
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      style: TextStyle(
                        color: colors.title,
                        fontFamily: 'Inter',
                      ),
                      maxLines: 3,
                      minLines: 1,
                      textInputAction: TextInputAction.newline,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _questionController,
                  builder: (_, value, _) {
                    final canSend = !_isLoading && value.text.trim().isNotEmpty;
                    return GestureDetector(
                      onTap: canSend ? _askAI : null,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: canSend
                              ? Theme.of(context).primaryColor
                              : (isDark
                                    ? AppTheme.borderColorDark
                                    : AppTheme.borderColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Icon(
                                LucideIcons.send,
                                color: canSend
                                    ? Colors.white
                                    : AppTheme.zinc400,
                                size: 20,
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
