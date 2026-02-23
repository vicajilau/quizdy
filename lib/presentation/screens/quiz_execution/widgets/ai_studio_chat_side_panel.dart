import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extensions.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/extensions/ai_assistant_theme.dart';
import 'package:quiz_app/core/extensions/focus_node_extension.dart';
import 'package:quiz_app/data/services/ai/ai_question_generation_service.dart';
import 'package:quiz_app/data/services/ai/ai_service.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/domain/models/ai/chat_message.dart';
import 'package:quiz_app/domain/models/quiz/question.dart';
import 'package:quiz_app/presentation/screens/dialogs/widgets/ai_chat_bubble.dart';
import 'package:quiz_app/presentation/screens/dialogs/widgets/question_context_widget.dart';
import 'package:quiz_app/presentation/widgets/ai_service_model_selector.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AiStudioChatSidePanel extends StatefulWidget {
  final Question question;
  final VoidCallback onClose;
  final bool isFullScreen;

  const AiStudioChatSidePanel({
    super.key,
    required this.question,
    required this.onClose,
    this.isFullScreen = false,
  });

  @override
  State<AiStudioChatSidePanel> createState() => AiStudioChatSidePanelState();
}

class AiStudioChatSidePanelState extends State<AiStudioChatSidePanel> {
  final TextEditingController _questionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _isLoading = false;

  final List<ChatMessage> _messages = [];

  AIService? _selectedService;
  String? _selectedModel;
  String? _lastUserQuestion;

  /// Pre-fills the input field with a question and optionally sends it.
  void prefillQuestion(String text, {bool autoSend = false}) {
    _questionController.text = text;
    if (autoSend) {
      _askAI();
    }
  }

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

  String _preprocessResponse(String response) {
    response = response.replaceAllMapped(
      RegExp(r'\$\$(.*?)\$\$', dotAll: true),
      (match) => '\\[${match.group(1)}\\]',
    );
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
    if (userText.isEmpty) return;

    final localizations = AppLocalizations.of(context)!;
    _lastUserQuestion = userText;

    setState(() {
      if (retryQuestion == null) {
        if (_messages.isNotEmpty && _messages.last.isError) {
          _messages.removeLast();
          if (_messages.isNotEmpty && _messages.last.isUser) {
            _messages.removeLast();
          }
        }
        _messages.add(
          ChatMessage(
            content: userText,
            isUser: true,
            questionContext: widget.question,
          ),
        );
      }
      _isLoading = true;
    });

    _questionController.clear();
    _scrollToBottom();

    try {
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

      final prompt = _buildPrompt(userText);
      final response = await _selectedService!.getChatResponse(
        prompt,
        localizations,
        model: _selectedModel,
      );

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

  Widget _buildChatList(BuildContext context, dynamic localizations) {
    // Build a flat list of items: for each user message, prepend its context
    final items = <Widget>[];
    for (var i = 0; i < _messages.length; i++) {
      final message = _messages[i];
      // Show question context before each user message
      if (message.isUser && message.questionContext != null) {
        items.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: QuestionContextWidget(question: message.questionContext!),
          ),
        );
      }
      items.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AiChatBubble(
            content: message.content,
            isUser: message.isUser,
            isError: message.isError,
            aiServiceName: message.isUser
                ? null
                : _selectedService?.serviceName,
            onRetry: message.isError ? () => _retryLastQuestion(i) : null,
          ),
        ),
      );
    }
    if (_isLoading) {
      items.add(
        Padding(
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return ListView(controller: _scrollController, children: items);
  }

  void _retryLastQuestion(int errorMessageIndex) {
    if (_lastUserQuestion == null) return;
    setState(() {
      _messages.removeAt(errorMessageIndex);
    });
    _askAI(retryQuestion: _lastUserQuestion);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final aiTheme = Theme.of(context).extension<AiAssistantTheme>()!;
    final borderColor = aiTheme.sidebarBorderColor;
    final sidebarBg = aiTheme.sidebarBg;
    final headerBtnBg = aiTheme.sidebarHeaderBtnBg;

    return Container(
      decoration: BoxDecoration(
        color: sidebarBg,
        border: widget.isFullScreen
            ? null
            : Border(left: BorderSide(color: borderColor, width: 1)),
      ),
      child: SafeArea(
        left: false,
        right: widget.isFullScreen,
        bottom: true,
        top: widget.isFullScreen,
        child: Padding(
          padding: const EdgeInsets.all(24),
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
                          color: AppTheme.primaryColor,
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            localizations.aiAssistantTitle,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: aiTheme.chatTitleColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: headerBtnBg,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        LucideIcons.panelRightClose,
                        color: AppTheme.zinc400,
                        size: 18,
                      ),
                      onPressed: widget.onClose,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      style: IconButton.styleFrom(
                        backgroundColor: headerBtnBg,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              AiServiceModelSelector(
                onServiceChanged: (service) {
                  setState(() => _selectedService = service);
                },
                onModelChanged: (model) {
                  setState(() => _selectedModel = model);
                },
                saveToPreferences: true,
              ),
              const SizedBox(height: 20),

              // Chat Area
              Expanded(child: _buildChatList(context, localizations)),

              const SizedBox(height: 16),

              // Input Area
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: aiTheme.inputFillColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: borderColor),
                      ),
                      child: TextField(
                        controller: _questionController,
                        focusNode: _focusNode,
                        decoration: InputDecoration(
                          hintText: localizations.askAIHint,
                          hintStyle: TextStyle(
                            color: aiTheme.inputHintColor,
                            fontFamily: 'Inter',
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        style: TextStyle(
                          color: aiTheme.chatTitleColor,
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
                      final canSend =
                          !_isLoading && value.text.trim().isNotEmpty;
                      return GestureDetector(
                        onTap: canSend ? _askAI : null,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: canSend
                                ? Theme.of(context).primaryColor
                                : aiTheme.sidebarBorderColor,
                            borderRadius: BorderRadius.circular(24),
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
      ),
    );
  }
}
