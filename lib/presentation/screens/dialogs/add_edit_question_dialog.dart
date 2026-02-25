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
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/question_type.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';

import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/theme/extensions/custom_colors.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/core/theme/extensions/question_dialog_theme.dart';

import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/utils/question_translation_helper.dart';
import 'package:quizlab_ai/presentation/screens/widgets/add_edit_question/question_image_section.dart';
import 'package:quizlab_ai/presentation/screens/widgets/add_edit_question/question_options_section.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/mixins/option_management_mixin.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/mixins/validation_mixin.dart';
import 'package:quizlab_ai/presentation/widgets/latex_text.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

/// Dialog widget for creating or editing a Question.
class AddEditQuestionDialog extends StatefulWidget {
  // Optional question for editing.
  final Question? question;
  // The file containing all questions.
  final QuizFile quizFile;
  // Optional index for editing a specific question.
  final int? questionPosition;
  final VoidCallback? onDelete;

  /// Constructor for the dialog.
  const AddEditQuestionDialog({
    super.key,
    this.question,
    required this.quizFile,
    this.questionPosition,
    this.onDelete,
  });

  @override
  State<AddEditQuestionDialog> createState() => _AddEditQuestionDialogState();
}

class _AddEditQuestionDialogState extends State<AddEditQuestionDialog>
    with OptionManagementMixin, ValidationMixin {
  late TextEditingController _questionTextController;
  late TextEditingController _explanationController;

  QuestionType _selectedType = QuestionType.multipleChoice;
  String? _imageData;

  @override
  void initState() {
    super.initState();

    // Initialize the text controllers
    _questionTextController = TextEditingController();
    _explanationController = TextEditingController();

    if (widget.question != null) {
      _questionTextController.text = widget.question!.text;
      _explanationController.text = widget.question!.explanation;
      _imageData = widget.question!.image;
      _selectedType = widget.question!.type;

      // Initialize options using the mixin
      initializeOptions(
        initialOptions: widget.question!.options,
        initialCorrectAnswers: widget.question!.correctAnswers,
      );
    } else {
      _selectedType = QuestionType.multipleChoice;
      // Initialize empty options using the mixin
      initializeDefaultOptions(_selectedType);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Set up true/false options if needed
    if (_selectedType == QuestionType.trueFalse) {
      setupTrueFalseOptions();
    }

    // Translate options after context is available
    if (widget.question != null) {
      final localizations = AppLocalizations.of(context)!;
      for (int i = 0; i < optionControllers.length; i++) {
        final originalOption = widget.question!.options[i];
        final translatedOption = QuestionTranslationHelper.translateOption(
          originalOption,
          localizations,
        );
        optionControllers[i].text = translatedOption;
      }
    }
  }

  @override
  void dispose() {
    _questionTextController.dispose();
    _explanationController.dispose();
    disposeOptions();
    super.dispose();
  }

  /// Handle question type change
  void _onQuestionTypeChanged(QuestionType? type) {
    if (type != null && type != _selectedType) {
      setState(() {
        _selectedType = type;
      });
      updateOptionsForType(type);
    }
  }

  /// Handle image data change
  void _onImageChanged(String imageData) {
    setState(() {
      _imageData = imageData;
    });
  }

  /// Handle image removal
  void _onImageRemoved() {
    setState(() {
      _imageData = null;
    });
  }

  /// Save the question
  void _saveQuestion() {
    final localizations = AppLocalizations.of(context)!;

    if (!validateForm(
      questionText: _questionTextController.text,
      questionType: _selectedType,
      optionControllers: optionControllers,
      correctAnswers: correctAnswers,
      localizations: localizations,
      optionsErrorNotifier: optionsErrorNotifier,
    )) {
      return;
    }

    // Create the question object
    final newQuestion = Question(
      text: _questionTextController.text.trim(),
      type: _selectedType,
      options: _selectedType == QuestionType.essay
          ? <String>[]
          : optionControllers
                .map((controller) => controller.text.trim())
                .toList(),
      correctAnswers: _selectedType == QuestionType.essay
          ? <int>[]
          : getCorrectAnswerIndexes(),
      explanation: _explanationController.text.trim(),
      image: _imageData,
    );

    // Update the question in the quiz file if editing
    if (widget.questionPosition != null) {
      // Editing existing question
      widget.quizFile.questions[widget.questionPosition!] = newQuestion;
    }

    // Close the dialog and return the new/updated question
    context.pop(newQuestion);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context).extension<QuestionDialogTheme>()!;

    return Dialog(
      backgroundColor: AppTheme.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: theme.borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.question == null
                        ? localizations.addQuestion
                        : localizations.editQuestion,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: theme.textColor,
                    ),
                  ),
                  Row(
                    children: [
                      if (widget.question != null && widget.onDelete != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                            onPressed: _confirmAndDelete,
                            style: IconButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.error.withValues(alpha: 0.1),
                              fixedSize: const Size(40, 40),
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                            ),
                            icon: Icon(
                              LucideIcons.trash2,
                              color: Theme.of(context).colorScheme.error,
                              size: 20,
                            ),
                            tooltip: localizations.deleteAction,
                          ),
                        ),
                      IconButton(
                        onPressed: () => context.pop(),
                        style: IconButton.styleFrom(
                          backgroundColor: theme.closeButtonColor,
                          fixedSize: const Size(40, 40),
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                        ),
                        icon: Icon(
                          LucideIcons.x,
                          size: 20,
                          color: theme.closeIconColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Question Type Label
                    Text(
                      localizations.questionType,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: theme.closeIconColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Question Type Dropdown
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            _selectedType.getQuestionTypeIcon(),
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DropdownButtonFormField<QuestionType>(
                            initialValue: _selectedType,
                            isExpanded: true,
                            onChanged: _onQuestionTypeChanged,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: theme.borderColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: theme.borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                            ),
                            items: QuestionType.values.map((type) {
                              return DropdownMenuItem(
                                value: type,
                                child: Text(
                                  type.getQuestionTypeLabel(context),
                                  style: TextStyle(
                                    color: theme
                                        .textColor, // Ensure text is visible
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Question Text Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Text Label
                        Text(
                          localizations.questionText,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.closeIconColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_questionTextController.text.contains('\$')) ...[
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context)
                                      .extension<CustomColors>()
                                      ?.info
                                      ?.withValues(alpha: 0.1) ??
                                  Theme.of(
                                    context,
                                  ).primaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color:
                                    Theme.of(context)
                                        .extension<CustomColors>()
                                        ?.info
                                        ?.withValues(alpha: 0.3) ??
                                    Theme.of(
                                      context,
                                    ).primaryColor.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localizations.preview,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(
                                          context,
                                        ).extension<CustomColors>()?.info ??
                                        Theme.of(context).primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                LaTeXText(
                                  _questionTextController.text,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: theme.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        TextField(
                          controller: _questionTextController,
                          maxLines: 3,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(color: theme.textColor),
                          onChanged: (_) {
                            clearQuestionTextError();
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: theme.borderColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: theme.borderColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            errorText: questionTextError,
                            filled: true,
                            fillColor: Theme.of(context).cardColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Image Section
                    QuestionImageSection(
                      imageData: _imageData,
                      onImagePicked: () {}, // Handled by onImageChanged
                      onImageRemoved: _onImageRemoved,
                      onImageChanged: _onImageChanged,
                    ),
                    const SizedBox(height: 24),

                    // Options Section
                    if (_selectedType != QuestionType.essay)
                      QuestionOptionsSection(
                        questionType: _selectedType,
                        optionControllers: optionControllers,
                        correctAnswersNotifier: correctAnswersNotifier,
                        optionsErrorNotifier: optionsErrorNotifier,
                        optionKeys: optionKeys,
                        onAddOption: addOption,
                        onRemove: removeOption,
                        onCorrectChanged: (index, value) =>
                            updateCorrectAnswer(index, value, _selectedType),
                        onTextChanged: clearOptionsError,
                      ),

                    const SizedBox(height: 24),

                    // Explanation Field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Explanation Label
                        Text(
                          AppLocalizations.of(context)!.explanationLabel,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: theme.closeIconColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_explanationController.text.contains('\$')) ...[
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context)
                                      .extension<CustomColors>()
                                      ?.info
                                      ?.withValues(alpha: 0.1) ??
                                  Theme.of(
                                    context,
                                  ).primaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color:
                                    Theme.of(context)
                                        .extension<CustomColors>()
                                        ?.info
                                        ?.withValues(alpha: 0.3) ??
                                    Theme.of(
                                      context,
                                    ).primaryColor.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  localizations.preview,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(
                                          context,
                                        ).extension<CustomColors>()?.info ??
                                        Theme.of(context).primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                LaTeXText(
                                  _explanationController.text,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: theme.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        TextField(
                          controller: _explanationController,
                          maxLines: 2,
                          textAlignVertical: TextAlignVertical.top,
                          style: TextStyle(color: theme.textColor),
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: theme.borderColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: theme.borderColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).cardColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer / Actions
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: QuizLabAIButton(
                title: localizations.save,
                expanded: true,
                onPressed: _saveQuestion,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmAndDelete() async {
    final localizations = AppLocalizations.of(context)!;
    final confirmed =
        await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: Text(localizations.confirmDeleteTitle),
            content: Text(
              localizations.confirmDeleteMessage(widget.question!.text),
            ),
            actions: [
              QuizLabAIButton(
                type: QuizlabAIButtonType.tertiary,
                title: localizations.cancelButton,
                onPressed: () => context.pop(false),
              ),
              QuizLabAIButton(
                title: localizations.deleteButton,
                onPressed: () => context.pop(true),
              ),
            ],
          ),
        ) ??
        false;

    if (confirmed && mounted) {
      widget.onDelete!();
      context.pop(null);
    }
  }
}
