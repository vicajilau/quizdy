import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart';

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

    // Add Button Colors
    final addBtnBg = isDark ? AppTheme.borderColorDark : Colors.white;
    final addBtnBorder = isDark ? AppTheme.zinc600 : AppTheme.borderColor;
    final addBtnText = isDark ? Colors.white : AppTheme.textColor;
    final addBtnIcon = isDark ? Colors.white : AppTheme.textColor;

    // Secondary Button Colors (Import, Save)
    final secondaryBtnBg = isDark
        ? AppTheme.borderColorDark
        : AppTheme.borderColor;
    final secondaryBtnText = isDark ? Colors.white : AppTheme.textColor;
    final secondaryBtnIcon = isDark ? Colors.white : AppTheme.textColor;

    // Delete Button Colors
    final deleteBtnBg = isDark
        ? AppTheme.errorColor.withValues(alpha: 0.2)
        : AppTheme.errorColor.withValues(alpha: 0.1);
    final deleteBtnText = isDark
        ? const Color(0xFFFCA5A5)
        : const Color(0xFFDC2626);
    final deleteBtnIcon = isDark
        ? const Color(0xFFFCA5A5)
        : const Color(0xFFDC2626);

    final backgroundColor = Theme.of(context).cardColor;

    return Container(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24.0),
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
                                child: _buildActionButton(
                                  context,
                                  icon: LucideIcons.trash2,
                                  label:
                                      '${AppLocalizations.of(context)!.deleteButton} (${widget.selectedQuestionCount})',
                                  onPressed: widget.onDelete,
                                  backgroundColor: deleteBtnBg,
                                  textColor: deleteBtnText,
                                  iconColor: deleteBtnIcon,
                                ),
                              ),
                            // Save Action Button
                            if (widget.showSaveButton)
                              Padding(
                                padding: const EdgeInsetsGeometry.only(
                                  right: 12,
                                ),
                                child: _buildActionButton(
                                  context,
                                  icon: LucideIcons.save,
                                  label: AppLocalizations.of(
                                    context,
                                  )!.saveButton,
                                  onPressed: widget.onSave,
                                  backgroundColor: secondaryBtnBg,
                                  textColor: secondaryBtnText,
                                  iconColor: secondaryBtnIcon,
                                ),
                              ),
                            // Add Question Action Button
                            Padding(
                              padding: const EdgeInsetsGeometry.only(right: 12),
                              child: _buildActionButton(
                                context,
                                icon: LucideIcons.plus,
                                label: AppLocalizations.of(
                                  context,
                                )!.addQuestion,
                                onPressed: widget.onAddQuestion,
                                backgroundColor: addBtnBg,
                                borderColor: addBtnBorder,
                                textColor: addBtnText,
                                iconColor: addBtnIcon,
                              ),
                            ),
                            // Generate Questions Action Button
                            Padding(
                              padding: const EdgeInsetsGeometry.only(right: 12),
                              child: _buildActionButton(
                                context,
                                icon: LucideIcons.sparkles,
                                label: widget.hasQuestions
                                    ? AppLocalizations.of(
                                        context,
                                      )!.addQuestionsWithAI
                                    : AppLocalizations.of(
                                        context,
                                      )!.generateQuestionsWithAI,
                                onPressed: widget.onGenerateAI,
                                backgroundColor: const Color(
                                  0xFF14B8A6,
                                ), // Teal 500
                              ),
                            ),
                            // Upload Action Button
                            _buildActionButton(
                              context,
                              icon: LucideIcons.upload,
                              label: AppLocalizations.of(context)!.importButton,
                              onPressed: widget.onImport,
                              backgroundColor: secondaryBtnBg,
                              textColor: secondaryBtnText,
                              iconColor: secondaryBtnIcon,
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

              const SizedBox(height: 24),

              // Start Quiz Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.isPlayEnabled ? widget.onPlay : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor, // Violet 500
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: AppTheme.primaryColor.withValues(
                      alpha: 0.5,
                    ),
                    disabledForegroundColor: Colors.white.withValues(
                      alpha: 0.5,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(LucideIcons.play, size: 22),
                      const SizedBox(width: 8),
                      Text(
                        AppLocalizations.of(context)!.startQuizButton,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
    Color? borderColor,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: borderColor != null
                ? Border.all(color: borderColor, width: 2)
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 20, color: iconColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
