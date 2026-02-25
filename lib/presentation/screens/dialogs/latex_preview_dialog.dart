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
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/widgets/latex_text.dart';

import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

/// A dialog to preview how an option will appear with LaTeX rendering
class LaTeXPreviewDialog extends StatelessWidget {
  final String optionText;
  final String title;

  const LaTeXPreviewDialog({
    super.key,
    required this.optionText,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.previewLabel),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isDark ? AppTheme.zinc600 : AppTheme.zinc300,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isDark ? AppTheme.zinc900 : AppTheme.zinc100,
              ),
              constraints: const BoxConstraints(minHeight: 80),
              child: optionText.trim().isEmpty
                  ? Text(
                      AppLocalizations.of(context)!.emptyPlaceholder,
                      style: TextStyle(
                        color: isDark ? AppTheme.zinc400 : AppTheme.zinc500,
                      ),
                    )
                  : LaTeXText(
                      optionText,
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? AppTheme.zinc50 : AppTheme.zinc900,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.latexSyntaxTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(AppLocalizations.of(context)!.latexSyntaxHelp),
          ],
        ),
      ),
      actions: [
        QuizLabAIButton(
          type: QuizlabAIButtonType.tertiary,
          title: AppLocalizations.of(context)!.close,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

/// A button that shows a LaTeX preview dialog for the given text
class LaTeXPreviewButton extends StatelessWidget {
  final String text;
  final String title;

  const LaTeXPreviewButton({
    super.key,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.preview),
      tooltip: AppLocalizations.of(context)!.previewLatexTooltip,
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              LaTeXPreviewDialog(optionText: text, title: title),
        );
      },
    );
  }
}
