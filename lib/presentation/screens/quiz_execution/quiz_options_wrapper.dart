import 'package:flutter/material.dart';
import 'package:quiz_app/core/service_locator.dart';
import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quiz_app/presentation/screens/quiz_execution/quiz_question_options.dart';

/// Wrapper widget that loads quiz configuration and passes it to QuizQuestionOptions
class QuizOptionsWrapper extends StatefulWidget {
  final QuizExecutionInProgress state;
  final void Function({String? prefillText})? onAskAi;

  const QuizOptionsWrapper({super.key, required this.state, this.onAskAi});

  @override
  State<QuizOptionsWrapper> createState() => _QuizOptionsWrapperState();
}

class _QuizOptionsWrapperState extends State<QuizOptionsWrapper> {
  bool _showCorrectAnswerCount = false;
  bool _isLoading = true;
  bool _isStudyMode = false;

  @override
  void initState() {
    super.initState();
    _loadConfiguration();
  }

  Future<void> _loadConfiguration() async {
    final showCorrectAnswerCount = await ConfigurationService.instance
        .getShowCorrectAnswerCount();

    // Get Study Mode setting from ServiceLocator
    final quizConfig = ServiceLocator.instance.getQuizConfig();
    final isStudyMode = quizConfig?.isStudyMode ?? false;

    if (mounted) {
      setState(() {
        _showCorrectAnswerCount = showCorrectAnswerCount;
        _isStudyMode = isStudyMode;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return QuizQuestionOptions(
      state: widget.state,
      showCorrectAnswerCount: _showCorrectAnswerCount,
      isStudyMode: _isStudyMode,
      onAskAi: widget.onAskAi,
    );
  }
}
