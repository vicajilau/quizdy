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
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quizlab_ai/domain/models/quiz/question_order.dart';

class QuestionSettingsSection extends StatefulWidget {
  final QuestionOrder selectedOrder;
  final bool randomizeAnswers;
  final bool randomizeQuestions;
  final bool showCorrectAnswerCount;
  final ValueChanged<QuestionOrder> onOrderChanged;
  final ValueChanged<bool> onRandomizeAnswersChanged;
  final ValueChanged<bool> onShowCorrectAnswerCountChanged;
  final ValueChanged<bool> onRandomizeQuestionsChanged;

  const QuestionSettingsSection({
    super.key,
    required this.selectedOrder,
    required this.randomizeAnswers,
    required this.randomizeQuestions,
    required this.showCorrectAnswerCount,
    required this.onOrderChanged,
    required this.onRandomizeAnswersChanged,
    required this.onShowCorrectAnswerCountChanged,
    required this.onRandomizeQuestionsChanged,
  });

  @override
  State<QuestionSettingsSection> createState() =>
      _QuestionSettingsSectionState();
}

class _QuestionSettingsSectionState extends State<QuestionSettingsSection> {
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
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question Order Section
        Text(
          AppLocalizations.of(context)!.questionOrderConfigDescription,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colors.subtitle,
          ),
        ),
        const SizedBox(height: 12),
        Stack(
          children: [
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
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
                    children: [
                      _buildOrderOption(
                        context,
                        order: QuestionOrder.random,
                        isSelected:
                            widget.selectedOrder == QuestionOrder.random,
                      ),
                      const SizedBox(width: 12),
                      _buildOrderOption(
                        context,
                        order: QuestionOrder.ascending,
                        isSelected:
                            widget.selectedOrder == QuestionOrder.ascending,
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
                          colors.card,
                          colors.card.withValues(alpha: 0.0),
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
                          colors.card,
                          colors.card.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        const SizedBox(height: 12),

        // Randomize Questions Toggle
        _buildToggleRow(
          context,
          title: AppLocalizations.of(context)!.randomizeQuestionsTitle,
          subtitle: AppLocalizations.of(context)!.randomizeQuestionsDescription,
          value: widget.randomizeQuestions,
          onChanged: widget.onRandomizeQuestionsChanged,
        ),

        const SizedBox(height: 12),

        // Randomize Answers Toggle
        _buildToggleRow(
          context,
          title: AppLocalizations.of(context)!.randomizeAnswersTitle,
          subtitle: AppLocalizations.of(context)!.randomizeAnswersDescription,
          value: widget.randomizeAnswers,
          onChanged: widget.onRandomizeAnswersChanged,
        ),

        const SizedBox(height: 12),

        // Show Correct Answer Count Toggle
        _buildToggleRow(
          context,
          title: AppLocalizations.of(context)!.showCorrectAnswerCountTitle,
          subtitle: AppLocalizations.of(
            context,
          )!.showCorrectAnswerCountDescription,
          value: widget.showCorrectAnswerCount,
          onChanged: widget.onShowCorrectAnswerCountChanged,
        ),
      ],
    );
  }

  Widget _buildOrderOption(
    BuildContext context, {
    required QuestionOrder order,
    required bool isSelected,
  }) {
    final colors = context.appColors;
    const activeColor = AppTheme.primaryColor;
    final activeText = Colors.white;

    String label;
    switch (order) {
      case QuestionOrder.ascending:
        label = AppLocalizations.of(context)!.questionOrderAscending;
        break;
      case QuestionOrder.random:
        label = AppLocalizations.of(context)!.questionOrderRandom;
        break;
    }

    return InkWell(
      onTap: () => widget.onOrderChanged(order),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : colors.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected ? activeText : colors.subtitle,
          ),
        ),
      ),
    );
  }

  Widget _buildToggleRow(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: colors.title,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: colors.subtitle,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: AppTheme.primaryColor,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: isDark ? AppTheme.zinc600 : AppTheme.zinc300,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }
}
