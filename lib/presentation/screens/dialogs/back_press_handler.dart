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
import 'package:go_router/go_router.dart';

import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/abandon_quiz_dialog.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_state.dart';

class BackPressHandler {
  static void handle(BuildContext context, QuizExecutionBloc bloc) {
    final state = bloc.state;

    if (state is QuizExecutionInProgress) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AbandonQuizDialog();
        },
      );
    } else {
      context.pop();
    }
  }
}
