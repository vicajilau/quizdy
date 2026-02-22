import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/core/theme/extensions/exam_timer_theme.dart';

/// A widget that displays a countdown timer for an exam.
///
/// This widget handles the countdown logic, visual representation (including warnings
/// when time is low), and triggers a callback when the time expires.
class ExamTimerWidget extends StatefulWidget {
  /// The initial duration of the exam in minutes.
  final int initialDurationMinutes;

  /// Callback function to be executed when the timer reaches zero.
  final VoidCallback onTimeExpired;

  /// Whether the quiz has been completed.
  ///
  /// If true, the timer stops ticking and the icon animation freezes.
  final bool isQuizCompleted;

  const ExamTimerWidget({
    super.key,
    required this.initialDurationMinutes,
    required this.onTimeExpired,
    this.isQuizCompleted = false,
  });

  @override
  State<ExamTimerWidget> createState() => _ExamTimerWidgetState();
}

class _ExamTimerWidgetState extends State<ExamTimerWidget>
    with TickerProviderStateMixin {
  Timer? _examTimer;
  Duration? _remainingTime;
  late AnimationController _timerAnimationController;

  @override
  void initState() {
    super.initState();
    _timerAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _remainingTime = Duration(minutes: widget.initialDurationMinutes);
    if (!widget.isQuizCompleted && widget.initialDurationMinutes > 0) {
      _startExamTimer();
    }
  }

  @override
  void didUpdateWidget(ExamTimerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Stop timer when quiz is completed
    if (!oldWidget.isQuizCompleted && widget.isQuizCompleted) {
      _stopTimer();
    }
  }

  @override
  void dispose() {
    _examTimer?.cancel();
    _timerAnimationController.dispose();
    super.dispose();
  }

  void _stopTimer() {
    _examTimer?.cancel();
    _timerAnimationController.stop();
  }

  void _startExamTimer() {
    // If minutes is 0 or less, don't start timer as it implies no limit
    if (widget.initialDurationMinutes <= 0) return;

    if (_remainingTime == null) return;

    _timerAnimationController.repeat();

    _examTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_remainingTime == null) return;

      if (_remainingTime!.inSeconds <= 0) {
        _handleTimeExpired();
        timer.cancel(); // Also cancel the timer here
        return;
      }

      setState(() {
        _remainingTime = _remainingTime! - const Duration(seconds: 1);
      });
    });
  }

  void _handleTimeExpired() {
    _stopTimer();

    if (!mounted) return;

    // Show time expired dialog
    _showTimeExpiredDialog();
  }

  void _showTimeExpiredDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final theme = context.examTimerTheme;

        return Dialog(
          backgroundColor: theme.dialogCanvasColor,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            width: 520,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: theme.dialogBackgroundColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: theme.dialogBorderColor, width: 1),
              boxShadow: [
                BoxShadow(
                  color: theme.dialogShadowColor,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header (Title only, no close button)
                Text(
                  AppLocalizations.of(context)!.examTimeExpiredTitle,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: theme.dialogTextColor,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Message
                Text(
                  AppLocalizations.of(context)!.examTimeExpiredMessage,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: theme.dialogSubTextColor,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Finish Button
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    widget.onTimeExpired();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.dialogButtonColor,
                    foregroundColor: theme.dialogButtonTextColor,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.finish),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingTime == null || widget.initialDurationMinutes <= 0) {
      return const SizedBox.shrink();
    }

    final totalDays = _remainingTime!.inDays;
    final weeks = totalDays ~/ 7;
    final days = totalDays % 7;

    final hours =
        (totalDays > 0 ? _remainingTime!.inHours % 24 : _remainingTime!.inHours)
            .toString()
            .padLeft(2, '0');
    final minutes = (_remainingTime!.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime!.inSeconds % 60).toString().padLeft(2, '0');

    // Determine color based on time remaining to match design logic or fallback
    final bool isLowTime = _remainingTime!.inMinutes < 5;
    final primaryColor = Theme.of(context).primaryColor;
    final extension = context.examTimerTheme;
    final color = isLowTime ? extension.timerLowColor : primaryColor;
    final backgroundColor = isLowTime
        ? extension.timerLowBackgroundColor
        : extension.timerBackgroundColor;

    String timeText;
    if (weeks > 0) {
      timeText = AppLocalizations.of(context)!.remainingTimeWithWeeks(
        weeks.toString(),
        days.toString(),
        hours,
        minutes,
        seconds,
      );
    } else if (totalDays > 0) {
      timeText = AppLocalizations.of(
        context,
      )!.remainingTimeWithDays(days.toString(), hours, minutes, seconds);
    } else {
      timeText = AppLocalizations.of(
        context,
      )!.remainingTime(hours, minutes, seconds);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotationTransition(
            turns: widget.isQuizCompleted
                ? const AlwaysStoppedAnimation(0)
                : _timerAnimationController,
            child: Icon(Icons.timer_outlined, size: 18, color: color),
          ),
          const SizedBox(width: 8),
          Text(
            timeText,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
