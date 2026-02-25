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

import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/quiz/question.dart';
import 'package:quizlab_ai/presentation/widgets/latex_text.dart';
import 'package:quizlab_ai/core/theme/extensions/custom_colors.dart';
import 'package:quizlab_ai/presentation/screens/widgets/question_preview/question_options_list.dart';
import 'package:quizlab_ai/presentation/screens/widgets/question_preview/question_type_indicator.dart';

class QuestionPreviewCard extends StatefulWidget {
  final Question question;
  final int index;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggle;
  final VoidCallback? onAiAssistant;
  final bool isSelectionMode;
  final bool isSelected;
  final VoidCallback? onSelectionToggle;

  const QuestionPreviewCard({
    super.key,
    required this.question,
    required this.index,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
    this.onAiAssistant,
    this.isSelectionMode = false,
    this.isSelected = false,
    this.onSelectionToggle,
  });

  @override
  State<QuestionPreviewCard> createState() => _QuestionPreviewCardState();
}

class _QuestionPreviewCardState extends State<QuestionPreviewCard> {
  bool _isExpanded = false; // Collapsed by default as per user request

  Uint8List? _getImageBytes(String? imageData) {
    if (imageData == null) return null;
    try {
      final base64Data = imageData.split(',').last;
      return base64Decode(base64Data);
    } catch (e) {
      return null;
    }
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.question.isEnabled;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: widget.isSelected
              ? Theme.of(context).extension<CustomColors>()!.aiIconColor!
              : Theme.of(context).dividerColor,
          width: widget.isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Question Index Badge and Actions
          GestureDetector(
            onTap: widget.isSelectionMode
                ? widget.onSelectionToggle
                : _toggleExpanded,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left Group: Selection + Badge + Type
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget.isSelectionMode) ...[
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: widget.isSelected
                                          ? Theme.of(context)
                                                .extension<CustomColors>()!
                                                .aiIconColor!
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: widget.isSelected
                                            ? Theme.of(context)
                                                  .extension<CustomColors>()!
                                                  .aiIconColor!
                                            : Theme.of(context).hintColor,
                                      ),
                                    ),
                                    child: widget.isSelected
                                        ? const Icon(
                                            LucideIcons.check,
                                            size: 16,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 12),
                                ],

                                // Question Badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).dividerColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    (widget.index + 1).toString().padLeft(
                                      2,
                                      '0',
                                    ),
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                // Question Type Badge (Always Full)
                                Tooltip(
                                  message: AppLocalizations.of(context)!
                                      .questionTypeTooltip(
                                        QuestionTypeIndicator.getQuestionTypeString(
                                          context,
                                          widget.question.type,
                                        ),
                                      ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: QuestionTypeIndicator(
                                      questionType: widget.question.type,
                                      showText: constraints.maxWidth > 340,
                                    ),
                                  ),
                                ),

                                if (widget.question.explanation.isEmpty) ...[
                                  const SizedBox(width: 8),
                                  Tooltip(
                                    message: AppLocalizations.of(
                                      context,
                                    )!.missingExplanationTooltip,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .extension<CustomColors>()!
                                            .warningContainer,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            LucideIcons.alertTriangle,
                                            size: 12,
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .onWarningContainer,
                                          ),
                                          if (constraints.maxWidth > 340) ...[
                                            const SizedBox(width: 4),
                                            Text(
                                              AppLocalizations.of(
                                                context,
                                              )!.missingExplanation,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .extension<CustomColors>()!
                                                    .onWarningContainer,
                                                fontSize:
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                    ? 11
                                                    : 10,
                                                fontWeight:
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                    ? FontWeight.w500
                                                    : FontWeight.w600,
                                                fontFamily: 'Inter',
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                ],

                                // Minimum gap before actions
                                const SizedBox(width: 16),
                              ],
                            ),

                            // Right Group: Actions (Pinned to right if space allows)
                            if (widget.isSelectionMode)
                              ReorderableDragStartListener(
                                index: widget.index,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.drag_indicator,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                              )
                            else
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (widget.onAiAssistant != null &&
                                      !isDisabled)
                                    _buildIconButton(
                                      icon: LucideIcons.sparkles,
                                      color: Theme.of(
                                        context,
                                      ).extension<CustomColors>()!.aiIconColor!,
                                      onPressed: widget.onAiAssistant!,
                                      tooltip: AppLocalizations.of(
                                        context,
                                      )!.aiButtonTooltip,
                                    ),
                                  const SizedBox(width: 8),
                                  _buildIconButton(
                                    icon: LucideIcons.pencil,
                                    color: Theme.of(
                                      context,
                                    ).extension<CustomColors>()!.info!,
                                    onPressed: widget.onEdit,
                                    tooltip: AppLocalizations.of(context)!.edit,
                                  ),
                                  const SizedBox(width: 8),
                                  _buildIconButton(
                                    icon: LucideIcons.trash2,
                                    color: Theme.of(context).colorScheme.error,
                                    onPressed: widget.onDelete,
                                    tooltip: AppLocalizations.of(
                                      context,
                                    )!.deleteButton,
                                  ),
                                  const SizedBox(width: 8),
                                  _buildIconButton(
                                    icon: _isExpanded
                                        ? LucideIcons.chevronUp
                                        : LucideIcons.chevronDown,
                                    color: Theme.of(context).hintColor,
                                    onPressed: _toggleExpanded,
                                    tooltip: _isExpanded
                                        ? 'Collapse'
                                        : 'Expand',
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Question Text Preview (Always visible)
          GestureDetector(
            onTap: widget.isSelectionMode
                ? widget.onSelectionToggle
                : _toggleExpanded,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(bottom: 20),
              child: LaTeXText(
                widget.question.text,
                maxLines: _isExpanded ? 100 : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  decoration: isDisabled ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ),

          if (_isExpanded)
            Divider(height: 1, color: Theme.of(context).dividerColor),
          // Question Content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            child: _isExpanded
                ? Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image if present
                        if (widget.question.image != null) ...[
                          const SizedBox(height: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.memory(
                              _getImageBytes(widget.question.image)!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    height: 150,
                                    width: double.infinity,
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    child: Icon(
                                      LucideIcons.imageOff,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                            ),
                          ),
                        ],

                        const SizedBox(height: 24),

                        // Options List
                        QuestionOptionsList(
                          question: widget.question,
                          isDisabled: isDisabled,
                        ),

                        // Explanation
                        if (widget.question.explanation.isNotEmpty) ...[
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      LucideIcons.lightbulb,
                                      size: 16,
                                      color: Theme.of(
                                        context,
                                      ).extension<CustomColors>()!.warning,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.explanationTitle,
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).extension<CustomColors>()!.warning,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                LaTeXText(
                                  widget.question.explanation,
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        icon: Icon(icon, size: 16, color: color),
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        tooltip: tooltip,
      ),
    );
  }
}
