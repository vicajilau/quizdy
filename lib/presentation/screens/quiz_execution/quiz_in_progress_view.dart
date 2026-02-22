import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/context_extension.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:quiz_app/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_event.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/quiz_progress_indicator.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/quiz_question_header.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/quiz_options_wrapper.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/quiz_navigation_buttons.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/widgets/ai_studio_chat_side_panel.dart';
import 'package:quiz_app/core/service_locator.dart';
import 'package:quiz_app/presentation/screens/dialogs/back_press_handler.dart';
import 'package:quiz_app/presentation/widgets/exam_timer.dart';

class QuizInProgressView extends StatefulWidget {
  final QuizExecutionInProgress state;

  const QuizInProgressView({super.key, required this.state});

  @override
  State<QuizInProgressView> createState() => _QuizInProgressViewState();
}

class _QuizInProgressViewState extends State<QuizInProgressView>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<AiStudioChatSidePanelState> _chatPanelKey =
      GlobalKey<AiStudioChatSidePanelState>();

  bool _isChatOpen = false;
  bool _isChatMounted = false;
  bool _isAiAvailable = false;

  late final AnimationController _mobileChatAnimController;
  late final Animation<Offset> _mobileChatSlide;

  @override
  void initState() {
    super.initState();
    _checkAiAvailability();
    _mobileChatAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _mobileChatSlide =
        Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _mobileChatAnimController,
            curve: Curves.easeInOut,
          ),
        );
  }

  Future<void> _checkAiAvailability() async {
    final isAvailable = await ConfigurationService.instance.getIsAiAvailable();
    if (mounted) {
      setState(() => _isAiAvailable = isAvailable);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _mobileChatAnimController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  bool _isWide() => MediaQuery.of(context).size.width >= 800;

  void openAiChat({String? prefillText}) {
    setState(() {
      _isChatOpen = true;
      _isChatMounted = true;
    });
    if (!_isWide()) {
      _mobileChatAnimController.forward();
    }
    if (prefillText != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _chatPanelKey.currentState?.prefillQuestion(
          prefillText,
          autoSend: true,
        );
      });
    }
  }

  void _closeChat() {
    if (_isWide()) {
      setState(() => _isChatOpen = false);
    } else {
      _mobileChatAnimController.reverse().then((_) {
        if (mounted) setState(() => _isChatOpen = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final quizConfig = ServiceLocator.instance.getQuizConfig();
    final isStudyMode = quizConfig?.isStudyMode ?? false;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;

    final closeBtnBorder = isDark ? Colors.transparent : AppTheme.zinc200;
    final cardBorder = isDark ? Colors.transparent : AppTheme.zinc200;
    final showTimer = !isStudyMode && (quizConfig?.enableTimeLimit ?? false);
    final showAi = isStudyMode && _isAiAvailable;

    return BlocListener<QuizExecutionBloc, QuizExecutionState>(
      listener: (context, state) {
        if (state is QuizExecutionInProgress && isStudyMode) {
          if (state.isCurrentQuestionValidated &&
              !widget.state.isCurrentQuestionValidated) {
            _scrollToBottom();
          }
        }
      },
      listenWhen: (previous, current) {
        if (previous is QuizExecutionInProgress &&
            current is QuizExecutionInProgress) {
          return current.isCurrentQuestionValidated !=
              previous.isCurrentQuestionValidated;
        }
        return false;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 800;

          // Sync mobile animation state on resize
          if (isWide && _isChatOpen) {
            // On desktop, ensure mobile animation is reset
            _mobileChatAnimController.value = 0.0;
          } else if (!isWide && _isChatOpen) {
            // On mobile with chat open, ensure animation is at end
            _mobileChatAnimController.value = 1.0;
          }

          final quizContent = Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: QuizProgressIndicator(state: widget.state)),
                    if (showTimer) ...[
                      const SizedBox(width: 8),
                      ExamTimerWidget(
                        initialDurationMinutes:
                            quizConfig?.timeLimitMinutes ?? 0,
                        onTimeExpired: () {
                          context.read<QuizExecutionBloc>().add(
                            QuizSubmitted(),
                          );
                        },
                      ),
                    ],
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () => BackPressHandler.handle(
                        context,
                        context.read<QuizExecutionBloc>(),
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: colors.card,
                        fixedSize: const Size(48, 48),
                        padding: EdgeInsets.zero,
                        shape: CircleBorder(
                          side: closeBtnBorder == Colors.transparent
                              ? BorderSide.none
                              : BorderSide(color: closeBtnBorder),
                        ),
                      ),
                      icon: Icon(Icons.close, color: colors.subtitle, size: 24),
                    ),
                    if (isStudyMode && !_isChatOpen) ...[
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: _isAiAvailable
                            ? openAiChat
                            : () => context.presentSnackBar(
                                AppLocalizations.of(context)!.aiApiKeyRequired,
                              ),
                        style: IconButton.styleFrom(
                          backgroundColor: colors.card,
                          fixedSize: const Size(48, 48),
                          padding: EdgeInsets.zero,
                          shape: CircleBorder(
                            side: closeBtnBorder == Colors.transparent
                                ? BorderSide.none
                                : BorderSide(color: closeBtnBorder),
                          ),
                        ),
                        icon: const Icon(
                          LucideIcons.sparkles,
                          color: AppTheme.primaryColor,
                          size: 24,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: colors.card,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: cardBorder),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            QuizQuestionHeader(state: widget.state),
                            const SizedBox(height: 32),
                            QuizOptionsWrapper(
                              state: widget.state,
                              onAskAi: showAi ? openAiChat : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Footer
              Container(
                height: 120,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: QuizNavigationButtons(
                    state: widget.state,
                    isStudyMode: isStudyMode,
                    isAiAvailable: _isAiAvailable,
                  ),
                ),
              ),
            ],
          );

          // Single chat panel instance — never rebuilt across layouts
          final chatPanel = AiStudioChatSidePanel(
            key: _chatPanelKey,
            question: widget.state.currentQuestion,
            isFullScreen: !isWide,
            onClose: _closeChat,
          );

          // Wide layout: Row with animated sidebar
          if (isWide) {
            return Row(
              children: [
                Expanded(child: quizContent),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: _isChatOpen ? 400 : 0,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  child: OverflowBox(
                    alignment: Alignment.topLeft,
                    minWidth: 400,
                    maxWidth: 400,
                    child: chatPanel,
                  ),
                ),
              ],
            );
          }

          // Narrow layout: Stack with slide overlay
          return Stack(
            children: [
              quizContent,
              if (_isChatMounted)
                Positioned.fill(
                  child: IgnorePointer(
                    ignoring: !_isChatOpen,
                    child: SlideTransition(
                      position: _mobileChatSlide,
                      child: Material(color: colors.card, child: chatPanel),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
