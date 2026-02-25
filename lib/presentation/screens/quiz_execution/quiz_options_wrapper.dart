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

import 'package:flutter/material.dart';
import 'package:quizlab_ai/core/service_locator.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';
import 'package:quizlab_ai/presentation/screens/quiz_execution/quiz_question_options.dart';

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
    // Get settings from ServiceLocator
    final quizConfig = ServiceLocator.instance.getQuizConfig();
    final isStudyMode = quizConfig?.isStudyMode ?? false;
    final showCorrectAnswerCount = quizConfig?.showCorrectAnswerCount ?? false;

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
