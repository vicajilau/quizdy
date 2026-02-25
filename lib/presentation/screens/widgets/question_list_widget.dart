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

import 'package:quizlab_ai/core/context_extension.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/add_edit_question_dialog.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/ai_question_dialog.dart';
import 'package:quizlab_ai/data/services/configuration_service.dart';
import 'package:quizlab_ai/presentation/screens/widgets/question_preview_card.dart';
import 'package:quizlab_ai/presentation/screens/dialogs/custom_confirm_dialog.dart';

import 'package:quizlab_ai/core/l10n/app_localizations.dart';

class QuestionListWidget extends StatefulWidget {
  final QuizFile quizFile;
  final VoidCallback onFileChange;
  final bool isSelectionMode;
  final Set<int> selectedQuestions;
  final Function(int) onToggleSelection;
  final Function(Set<int>)? onSelectionChanged;

  const QuestionListWidget({
    super.key,
    required this.quizFile,
    required this.onFileChange,
    this.isSelectionMode = false,
    this.selectedQuestions = const {},
    required this.onToggleSelection,
    this.onSelectionChanged,
  });

  @override
  State<QuestionListWidget> createState() => _QuestionListWidgetState();
}

class _QuestionListWidgetState extends State<QuestionListWidget> {
  bool _aiAssistantEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadAISettings();
  }

  Future<void> _loadAISettings() async {
    final aiEnabled = await ConfigurationService.instance.getIsAiAvailable();
    setState(() {
      _aiAssistantEnabled = aiEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      onReorder: _onReorder,
      padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(top: 24),
      itemCount: widget.quizFile.questions.length,
      buildDefaultDragHandles: false, // We use custom drag handles
      itemBuilder: (constext, index) {
        final question = widget.quizFile.questions[index];
        return _buildQuestionCard(question, index);
      },
      // ProxyDecorator is optional but good for visual feedback
      proxyDecorator: (child, index, animation) {
        final isSelected = widget.selectedQuestions.contains(index);
        final count = widget.selectedQuestions.length;

        return Material(
          elevation: 4,
          color: Colors.transparent,
          child: Stack(
            children: [
              child,
              if (isSelected && count > 1)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    final isOldIndexSelected = widget.selectedQuestions.contains(oldIndex);

    // If dragging a selected item with multiple items selected, use bulk move
    if (isOldIndexSelected && widget.selectedQuestions.length > 1) {
      final sortedIndices = widget.selectedQuestions.toList()..sort();
      _handleBulkMove(sortedIndices, newIndex);
    } else {
      // Single move logic (adjust newIndex if moving down)
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      _handleSingleMove(oldIndex, newIndex);
    }
  }

  void _handleSingleMove(int oldIndex, int newIndex) {
    setState(() {
      final item = widget.quizFile.questions.removeAt(oldIndex);
      widget.quizFile.questions.insert(newIndex, item);

      // Update selection indices
      _updateSelectionAfterSingleMove(oldIndex, newIndex);

      widget.onFileChange();
    });
  }

  void _handleBulkMove(List<int> sortedIndices, int targetIndex) {
    setState(() {
      final questions = widget.quizFile.questions;

      // 1. Collect items to move
      final itemsToMove = sortedIndices.map((i) => questions[i]).toList();

      // 2. Determine effective insertion index
      // When we remove items, indices shift.
      // We need to map the targetIndex to the index in the list *after* removal.

      // Count how many items BEFORE targetIndex are being removed
      int itemsRemovedBeforeTarget = 0;
      for (final index in sortedIndices) {
        if (index < targetIndex) {
          itemsRemovedBeforeTarget++;
        }
      }

      final insertionIndex = targetIndex - itemsRemovedBeforeTarget;

      // 3. Remove items from list (iterate in reverse to avoid index issues)
      for (final index in sortedIndices.reversed) {
        questions.removeAt(index);
      }

      // 4. Insert items at new position
      questions.insertAll(insertionIndex, itemsToMove);

      // 5. Update selection to match new positions
      final newSelection = <int>{};
      for (int i = 0; i < itemsToMove.length; i++) {
        newSelection.add(insertionIndex + i);
      }

      // Notify parent of new selection
      widget.onSelectionChanged?.call(newSelection);
      widget.onFileChange();
    });
  }

  void _updateSelectionAfterSingleMove(int oldIndex, int newIndex) {
    if (widget.selectedQuestions.isEmpty) return;

    final newSelection = <int>{};

    for (final selectedIndex in widget.selectedQuestions) {
      if (selectedIndex == oldIndex) {
        newSelection.add(newIndex);
      } else {
        // Calculate new index for other items
        int adjustedIndex = selectedIndex;
        if (oldIndex < newIndex) {
          // Moving down: items between old and new shift up (-1)
          if (selectedIndex > oldIndex && selectedIndex <= newIndex) {
            adjustedIndex--;
          }
        } else {
          // Moving up: items between new and old shift down (+1)
          if (selectedIndex >= newIndex && selectedIndex < oldIndex) {
            adjustedIndex++;
          }
        }
        newSelection.add(adjustedIndex);
      }
    }
    widget.onSelectionChanged?.call(newSelection);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Recargar configuración cuando el widget se actualiza
    _loadAISettings();
  }

  Widget _buildQuestionCard(Question question, int index) {
    return QuestionPreviewCard(
      key: ValueKey('${question.text}_${question.type}_$index'),
      question: question,
      index: index,
      onEdit: () => _editQuestion(question, index),
      onDelete: () => _deleteQuestion(index),
      onToggle: () => _toggleQuestionEnabled(index),
      isSelectionMode: widget.isSelectionMode,
      isSelected: widget.selectedQuestions.contains(index),
      onSelectionToggle: () => widget.onToggleSelection(index),
      onAiAssistant: (_aiAssistantEnabled && question.isEnabled)
          ? () async {
              final isAiAvailable = await ConfigurationService.instance
                  .getIsAiAvailable();

              if (!mounted) return;

              if (!isAiAvailable) {
                context.presentSnackBar(
                  AppLocalizations.of(context)!.aiApiKeyRequired,
                );
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AIQuestionDialog(question: question),
                );
              }
            }
          : null,
    );
  }

  /// Deletes a question after user confirmation.
  ///
  /// This method is called when the delete button in the question card is pressed.
  /// It reuses [_confirmDismiss] to ask for confirmation before removing the
  /// question from the list.
  Future<void> _deleteQuestion(int index) async {
    final question = widget.quizFile.questions[index];
    final confirmed = await _confirmDismiss(context, question);
    if (confirmed && mounted) {
      setState(() {
        widget.quizFile.questions.removeAt(index);
        widget.onFileChange();
      });
    }
  }

  /// Toggles the enabled state of a question at the given [index].
  ///
  /// This updates the question in the list and notifies the parent widget
  /// about the file change.
  void _toggleQuestionEnabled(int index) {
    setState(() {
      final question = widget.quizFile.questions[index];
      widget.quizFile.questions[index] = question.copyWith(
        isEnabled: !question.isEnabled,
      );
      widget.onFileChange();
    });
  }

  Future<void> _editQuestion(Question question, int index) async {
    final updatedQuestion = await showDialog<Question>(
      context: context,
      builder: (context) => AddEditQuestionDialog(
        question: question,
        quizFile: widget.quizFile,
        questionPosition: index,
        onDelete: () {
          setState(() {
            widget.quizFile.questions.remove(question);
            widget.onFileChange();
          });
        },
      ),
    );
    if (updatedQuestion != null) {
      setState(() {
        widget.quizFile.questions[index] = updatedQuestion;
        widget.onFileChange();
      });
    }
  }

  /// Shows a confirmation dialog before deleting a [question].
  ///
  /// Returns `true` if the user confirms the deletion, `false` otherwise.
  Future<bool> _confirmDismiss(BuildContext context, Question question) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => CustomConfirmDialog(
            title: AppLocalizations.of(context)!.confirmDeleteTitle,
            message: AppLocalizations.of(
              context,
            )!.confirmDeleteMessage(question.text),
            confirmText: AppLocalizations.of(context)!.deleteButton,
            isDestructive: true,
          ),
        ) ??
        false;
  }
}
