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

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class FileLoadedBottomBar extends StatefulWidget {
  final VoidCallback onAddQuestion;
  final VoidCallback onGenerateAI;
  final VoidCallback onImport;
  final VoidCallback onSave;
  final VoidCallback onDelete;
  final VoidCallback onPlay;
  final bool isPlayEnabled;
  final int selectedQuestionCount;
  final bool showSaveButton;
  final bool hasQuestions;

  const FileLoadedBottomBar({
    super.key,
    required this.onAddQuestion,
    required this.onGenerateAI,
    required this.onImport,
    required this.onSave,
    required this.onDelete,
    required this.onPlay,
    this.isPlayEnabled = false,
    this.selectedQuestionCount = 0,
    this.showSaveButton = false,
    this.hasQuestions = false,
  });

  @override
  State<FileLoadedBottomBar> createState() => _FileLoadedBottomBarState();
}

class _FileLoadedBottomBarState extends State<FileLoadedBottomBar> {
  late final ScrollController _scrollController;
  bool _showLeftShadow = false;
  bool _showRightShadow = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateShadows);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateShadows());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateShadows);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FileLoadedBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedQuestionCount != widget.selectedQuestionCount ||
        oldWidget.showSaveButton != widget.showSaveButton) {
      _scrollToStart();
    }
  }

  void _scrollToStart() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _updateShadows() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    final showLeft = currentScroll > 0;
    final showRight = currentScroll < maxScroll;

    if (showLeft != _showLeftShadow || showRight != _showRightShadow) {
      setState(() {
        _showLeftShadow = showLeft;
        _showRightShadow = showRight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = Theme.of(context).cardColor;

    return Container(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor, width: 1),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -10),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Action Buttons Row (Scrollable with Shadows)
              Stack(
                children: [
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      },
                    ),
                    child: NotificationListener<ScrollMetricsNotification>(
                      onNotification: (notification) {
                        _updateShadows();
                        return true;
                      },
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Delete Action Button
                            if (widget.selectedQuestionCount > 0)
                              Padding(
                                padding: const EdgeInsetsGeometry.only(
                                  right: 12,
                                ),
                                child: QuizLabAIButton(
                                  type: QuizlabAIButtonType.warning,
                                  icon: LucideIcons.trash2,
                                  title:
                                      '${AppLocalizations.of(context)!.deleteButton} (${widget.selectedQuestionCount})',
                                  onPressed: widget.onDelete,
                                ),
                              ),
                            // Save Action Button
                            if (widget.showSaveButton)
                              Padding(
                                padding: const EdgeInsetsGeometry.only(
                                  right: 12,
                                ),
                                child: QuizLabAIButton(
                                  type: QuizlabAIButtonType.secondary,
                                  icon: LucideIcons.save,
                                  title: AppLocalizations.of(
                                    context,
                                  )!.saveButton,
                                  onPressed: widget.onSave,
                                ),
                              ),
                            // Add Question Action Button
                            Padding(
                              padding: const EdgeInsetsGeometry.only(right: 12),
                              child: QuizLabAIButton(
                                type: QuizlabAIButtonType.secondary,
                                icon: LucideIcons.plus,
                                title: AppLocalizations.of(
                                  context,
                                )!.addQuestion,
                                onPressed: widget.onAddQuestion,
                              ),
                            ),
                            // Generate Questions Action Button
                            Padding(
                              padding: const EdgeInsetsGeometry.only(right: 12),
                              child: QuizLabAIButton(
                                backgroundColor: AppTheme.secondaryColor,
                                icon: LucideIcons.sparkles,
                                title: widget.hasQuestions
                                    ? AppLocalizations.of(
                                        context,
                                      )!.addQuestionsWithAI
                                    : AppLocalizations.of(
                                        context,
                                      )!.generateQuestionsWithAI,
                                onPressed: widget.onGenerateAI,
                              ),
                            ),
                            // Upload Action Button
                            QuizLabAIButton(
                              type: QuizlabAIButtonType.secondary,
                              icon: LucideIcons.upload,
                              title: AppLocalizations.of(context)!.importButton,
                              onPressed: widget.onImport,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Left Shadow Indicator
                  if (_showLeftShadow)
                    Positioned(
                      left: -1,
                      top: 0,
                      bottom: 0,
                      width: 40,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                backgroundColor,
                                backgroundColor.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  // Right Shadow Indicator
                  if (_showRightShadow)
                    Positioned(
                      right: -1,
                      top: 0,
                      bottom: 0,
                      width: 40,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                backgroundColor,
                                backgroundColor.withValues(alpha: 0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 12),

              // Start Quiz Button
              QuizLabAIButton(
                title: AppLocalizations.of(context)!.startQuizButton,
                icon: LucideIcons.play,
                expanded: true,
                onPressed: widget.isPlayEnabled ? widget.onPlay : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
