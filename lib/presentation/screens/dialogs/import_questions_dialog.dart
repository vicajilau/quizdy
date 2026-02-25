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

import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

enum QuestionsPosition { beginning, end }

/// Dialog to confirm importing questions from another quiz file
class ImportQuestionsDialog extends StatelessWidget {
  final int questionCount;
  final String fileName;

  const ImportQuestionsDialog({
    super.key,
    required this.questionCount,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localizations.importQuestionsTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.importQuestionsMessage(questionCount, fileName),
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            localizations.importQuestionsPositionQuestion,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      actions: [
        QuizLabAIButton(
          type: QuizlabAIButtonType.tertiary,
          title: localizations.cancelButton,
          onPressed: () => context.pop(null),
        ),
        QuizLabAIButton(
          title: localizations.importAtBeginning,
          onPressed: () => context.pop(QuestionsPosition.beginning),
        ),
        QuizLabAIButton(
          title: localizations.importAtEnd,
          onPressed: () => context.pop(QuestionsPosition.end),
        ),
      ],
    );
  }
}
