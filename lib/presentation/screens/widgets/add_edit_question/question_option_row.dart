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
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/widgets/latex_text.dart';

/// Separate widget for each option row to optimize rendering
class QuestionOptionRow extends StatefulWidget {
  final int index;
  final TextEditingController controller;
  final bool isCorrect;
  final QuestionType questionType;
  final String? optionsError;
  final bool canRemove;
  final ValueChanged<bool?> onCorrectChanged;
  final VoidCallback onTextChanged;
  final VoidCallback onRemove;

  const QuestionOptionRow({
    super.key,
    required this.index,
    required this.controller,
    required this.isCorrect,
    required this.questionType,
    required this.optionsError,
    required this.canRemove,
    required this.onCorrectChanged,
    required this.onTextChanged,
    required this.onRemove,
  });

  @override
  State<QuestionOptionRow> createState() => _QuestionOptionRowState();
}

class _QuestionOptionRowState extends State<QuestionOptionRow>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    final localizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          // Use different input types based on question type
          if (widget.questionType == QuestionType.multipleChoice)
            Tooltip(
              message: localizations.selectCorrectAnswers,
              child: Checkbox(
                value: widget.isCorrect,
                activeColor: Colors.green,
                onChanged: widget.onCorrectChanged,
              ),
            )
          else if (widget.questionType == QuestionType.singleChoice ||
              widget.questionType == QuestionType.trueFalse)
            Tooltip(
              message: localizations.selectCorrectAnswer,
              child: RadioGroup(
                groupValue: widget.isCorrect ? widget.index : -1,
                onChanged: (value) =>
                    widget.onCorrectChanged(value == widget.index),
                child: Radio<int>(value: widget.index),
              ),
            ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label with LaTeX support hint and live preview
                if (widget.questionType != QuestionType.trueFalse)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        if (widget.controller.text.contains('\$')) ...[
                          const SizedBox(width: 12),
                          Text(
                            '${localizations.preview}: ',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.05),
                              border: Border.all(
                                color: Colors.blue.withValues(alpha: 0.3),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              heightFactor: 1.0,
                              child: LaTeXText(
                                widget.controller.text,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                if (widget.questionType != QuestionType.trueFalse)
                  const SizedBox(height: 6),
                TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    labelText:
                        '${localizations.optionLabel} ${widget.index + 1}',
                    border: const OutlineInputBorder(),
                    errorText:
                        widget.optionsError != null &&
                            widget.controller.text.trim().isEmpty &&
                            widget.questionType != QuestionType.trueFalse
                        ? localizations.optionEmptyError
                        : null,
                  ),
                  onChanged: (value) {
                    widget.onTextChanged();
                    (context as Element)
                        .markNeedsBuild(); // Trigger rebuild for live preview
                  },
                  readOnly: widget.questionType == QuestionType.trueFalse,
                ),
              ],
            ),
          ),
          if (widget.questionType != QuestionType.trueFalse)
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                color: Theme.of(context).colorScheme.error,
              ),
              tooltip: localizations.removeOption,
              onPressed: widget.canRemove ? widget.onRemove : null,
            ),
        ],
      ),
    );
  }
}
