import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:quiz_app/core/l10n/app_localizations.dart';

import 'package:quiz_app/data/services/configuration_service.dart';
import 'package:quiz_app/domain/models/quiz/quiz_config.dart';
import 'package:quiz_app/domain/models/quiz/quiz_config_stored_settings.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/advanced_settings_section.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/count_control_button.dart';
import 'package:quiz_app/presentation/screens/dialogs/count_selection/quiz_mode_selection.dart';

class QuestionCountSelectionDialog extends StatefulWidget {
  final int totalQuestions;
  final int selectedQuestionCount;

  const QuestionCountSelectionDialog({
    super.key,
    required this.totalQuestions,
    this.selectedQuestionCount = 0,
  });

  @override
  State<QuestionCountSelectionDialog> createState() =>
      _QuestionCountSelectionDialogState();
}

class _QuestionCountSelectionDialogState
    extends State<QuestionCountSelectionDialog>
    with TickerProviderStateMixin {
  int _selectedCount = 10;
  bool _allQuestions = false;
  bool _isStudyMode = false; // false = Exam, true = Study
  bool _subtractPoints = false;
  double _penaltyAmount = 0.5;
  bool _enableMaxIncorrectAnswers = false;
  int _maxIncorrectAnswersLimit = 3;
  late TextEditingController _penaltyController;
  late TextEditingController _questionCountController;
  late TextEditingController _maxIncorrectAnswersController;
  final FocusNode _questionCountFocusNode = FocusNode();
  final FocusNode _penaltyFocusNode = FocusNode();
  final FocusNode _maxIncorrectAnswersFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _penaltyController = TextEditingController(
      text: _penaltyAmount.toStringAsFixed(2),
    );
    _questionCountController = TextEditingController(
      text: _selectedCount.toString(),
    );
    _maxIncorrectAnswersController = TextEditingController(
      text: _maxIncorrectAnswersLimit.toString(),
    );

    _questionCountFocusNode.addListener(() {
      if (!_questionCountFocusNode.hasFocus) {
        if (_questionCountController.text.isEmpty ||
            int.tryParse(_questionCountController.text) == 0) {
          setState(() {
            _selectedCount = 1;
            _questionCountController.text = '1';
          });
        }
      }
    });

    _penaltyFocusNode.addListener(() {
      if (!_penaltyFocusNode.hasFocus) {
        final text = _penaltyController.text.replaceAll(',', '.');
        final val = double.tryParse(text);
        if (text.isEmpty || val == null) {
          setState(() {
            _penaltyAmount = 0.05;
            _penaltyController.text = '0.05';
          });
        } else if (val == 0) {
          setState(() {
            _penaltyAmount = 0.0;
            _penaltyController.text = '0.00';
            _subtractPoints = false;
          });
        }
      }
    });

    _maxIncorrectAnswersFocusNode.addListener(() {
      if (!_maxIncorrectAnswersFocusNode.hasFocus) {
        if (_maxIncorrectAnswersController.text.isEmpty ||
            int.tryParse(_maxIncorrectAnswersController.text) == 0) {
          setState(() {
            _maxIncorrectAnswersLimit = 1;
            _maxIncorrectAnswersController.text = '1';
          });
        }
      }
    });
    _loadSavedSettings();
  }

  @override
  void dispose() {
    _penaltyController.dispose();
    _questionCountController.dispose();
    _maxIncorrectAnswersController.dispose();
    _questionCountFocusNode.dispose();
    _penaltyFocusNode.dispose();
    _maxIncorrectAnswersFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadSavedSettings() async {
    final settings = await ConfigurationService.instance
        .getQuizConfigSettings();
    if (mounted) {
      setState(() {
        if (settings.questionCount != null) {
          _selectedCount = settings.questionCount!.clamp(
            1,
            widget.totalQuestions,
          );
          _allQuestions = _selectedCount == widget.totalQuestions;
        } else {
          _selectedCount = widget.totalQuestions;
          _allQuestions = true;
        }
        _questionCountController.text = _selectedCount.toString();

        if (settings.isStudyMode != null) {
          _isStudyMode = settings.isStudyMode!;
        }

        if (settings.subtractPoints != null) {
          _subtractPoints = settings.subtractPoints!;
        }

        if (settings.penaltyAmount != null) {
          _penaltyAmount = settings.penaltyAmount!;
          _penaltyController.text = _penaltyAmount.toStringAsFixed(2);
        }

        if (settings.enableMaxIncorrectAnswers != null) {
          _enableMaxIncorrectAnswers = settings.enableMaxIncorrectAnswers!;
        }

        if (settings.maxIncorrectAnswers != null) {
          _maxIncorrectAnswersLimit = settings.maxIncorrectAnswers!;
          _maxIncorrectAnswersController.text = _maxIncorrectAnswersLimit
              .toString();
        }
      });
    }
  }

  void _incrementCount() {
    if (_allQuestions) return;
    setState(() {
      if (_selectedCount < widget.totalQuestions) {
        _selectedCount++;
        _questionCountController.text = _selectedCount.toString();
        if (_selectedCount == widget.totalQuestions) {
          _allQuestions = true;
        }
      }
    });
  }

  void _decrementCount() {
    if (_allQuestions) return;
    setState(() {
      if (_selectedCount > 1) {
        _selectedCount--;
        _questionCountController.text = _selectedCount.toString();

        // Ensure max incorrect limit doesn't exceed question count
        if (_enableMaxIncorrectAnswers &&
            _maxIncorrectAnswersLimit > _selectedCount) {
          _maxIncorrectAnswersLimit = _selectedCount;
          _maxIncorrectAnswersController.text = _maxIncorrectAnswersLimit
              .toString();
        }
      }
    });
  }

  void _incrementMaxIncorrect() {
    setState(() {
      if (_maxIncorrectAnswersLimit < _selectedCount) {
        _maxIncorrectAnswersLimit++;
        _maxIncorrectAnswersController.text = _maxIncorrectAnswersLimit
            .toString();
      }
    });
  }

  void _decrementMaxIncorrect() {
    setState(() {
      if (_maxIncorrectAnswersLimit > 1) {
        _maxIncorrectAnswersLimit--;
        _maxIncorrectAnswersController.text = _maxIncorrectAnswersLimit
            .toString();
      }
    });
  }

  void _incrementPenalty() {
    setState(() {
      // No upper limit as requested
      _penaltyAmount = double.parse((_penaltyAmount + 0.05).toStringAsFixed(2));
      _penaltyController.text = _penaltyAmount.toStringAsFixed(2);
    });
  }

  void _decrementPenalty() {
    setState(() {
      if (_penaltyAmount > 0.0) {
        _penaltyAmount = double.parse(
          (_penaltyAmount - 0.05)
              .clamp(0.0, double.infinity)
              .toStringAsFixed(2),
        );
        _penaltyController.text = _penaltyAmount.toStringAsFixed(2);
        if (_penaltyAmount == 0.0) {
          _subtractPoints = false;
        }
      }
    });
  }

  Future<void> _startQuiz({bool useSelectedOnly = false}) async {
    int finalCount;
    if (useSelectedOnly) {
      finalCount = widget.selectedQuestionCount;
    } else {
      finalCount = _selectedCount;
      if (!_allQuestions) {
        final text = _questionCountController.text;
        final val = int.tryParse(text);
        if (text.isEmpty || val == null || val <= 0) {
          finalCount = 1;
          if (mounted) {
            setState(() {
              _selectedCount = 1;
              _questionCountController.text = '1';
            });
          }
        } else {
          finalCount = val.clamp(1, widget.totalQuestions);
          if (mounted) {
            setState(() {
              _selectedCount = finalCount;
              _questionCountController.text = finalCount.toString();
            });
          }
        }
      }
    }

    final examTimeEnabled = await ConfigurationService.instance
        .getExamTimeEnabled();
    final examTimeMinutes = await ConfigurationService.instance
        .getExamTimeMinutes();

    if (mounted) {
      ConfigurationService.instance.saveQuizConfigSettings(
        QuizConfigStoredSettings(
          questionCount: finalCount,
          isStudyMode: _isStudyMode,
          subtractPoints: _subtractPoints,
          penaltyAmount: _penaltyAmount,
          enableMaxIncorrectAnswers: _enableMaxIncorrectAnswers,
          maxIncorrectAnswers: _maxIncorrectAnswersLimit,
        ),
      );
      context.pop(
        QuizConfig(
          questionCount: finalCount,
          isStudyMode: _isStudyMode,
          enableTimeLimit: examTimeEnabled,
          timeLimitMinutes: examTimeMinutes,
          subtractPoints: _subtractPoints,
          penaltyAmount: _penaltyAmount,
          useSelectedOnly: useSelectedOnly,
          enableMaxIncorrectAnswers: _enableMaxIncorrectAnswers,
          maxIncorrectAnswers: _maxIncorrectAnswersLimit,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF27272A) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF18181B);
    final subTextColor = isDark
        ? const Color(0xFFA1A1AA)
        : const Color(0xFF71717A);
    final borderColor = isDark
        ? const Color(0xFF3F3F46)
        : const Color(0xFFE4E4E7);
    final controlBgColor = isDark
        ? const Color(0xFF3F3F46)
        : const Color(0xFFF4F4F5);
    final controlIconColor = isDark
        ? const Color(0xFFA1A1AA)
        : const Color(0xFF3F3F46);
    final primaryColor = const Color(0xFF8B5CF6);
    final l10n = AppLocalizations.of(context)!;
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 520, // Max width from design
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header (Pinned)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.startQuiz,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                      height: 1.2,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () => context.pop(null),
                  style: IconButton.styleFrom(
                    backgroundColor: controlBgColor,
                    fixedSize: const Size(40, 40),
                    padding: EdgeInsets.zero,
                    shape: const CircleBorder(),
                  ),
                  icon: Icon(LucideIcons.x, size: 20, color: subTextColor),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // All Questions Toggle Section
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: controlBgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  l10n.allQuestionsLabel,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                ),
                                Switch(
                                  value: _allQuestions,
                                  onChanged: (value) {
                                    setState(() {
                                      _allQuestions = value;
                                      if (_allQuestions) {
                                        _selectedCount = widget.totalQuestions;
                                        _questionCountController.text =
                                            _selectedCount.toString();
                                      } else if (_selectedCount ==
                                              widget.totalQuestions &&
                                          widget.totalQuestions > 1) {
                                        // If turning OFF "All" and we are at max,
                                        // decrement to allow the user to use the + button
                                        _selectedCount =
                                            widget.totalQuestions - 1;
                                        _questionCountController.text =
                                            _selectedCount.toString();

                                        // Ensure error limit doesn't exceed question count
                                        if (_maxIncorrectAnswersLimit >
                                            _selectedCount) {
                                          _maxIncorrectAnswersLimit =
                                              _selectedCount;
                                          _maxIncorrectAnswersController.text =
                                              _maxIncorrectAnswersLimit
                                                  .toString();
                                        }
                                      }
                                    });
                                  },
                                  activeTrackColor: primaryColor,
                                  activeThumbColor: Colors.white,
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: isDark
                                      ? const Color(0xFF52525B) // zinc600
                                      : const Color(0xFFD4D4D8), // zinc300
                                  trackOutlineColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!_allQuestions) ...[
                            const SizedBox(height: 24),
                            Text(
                              l10n.numberInputLabel,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: subTextColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                // Minus Button
                                CountControlButton(
                                  icon: LucideIcons.minus,
                                  onTap: _decrementCount,
                                  bgColor: controlBgColor,
                                  iconColor: controlIconColor,
                                ),
                                const SizedBox(width: 16),
                                // Display
                                Expanded(
                                  child: Container(
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: controlBgColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextFormField(
                                      controller: _questionCountController,
                                      focusNode: _questionCountFocusNode,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: textColor,
                                      ),
                                      onEditingComplete: () {
                                        if (_questionCountController
                                                .text
                                                .isEmpty ||
                                            int.tryParse(
                                                  _questionCountController.text,
                                                ) ==
                                                0) {
                                          setState(() {
                                            _selectedCount = 1;
                                            _questionCountController.text = '1';

                                            // Ensure error limit doesn't exceed question count
                                            if (_maxIncorrectAnswersLimit >
                                                _selectedCount) {
                                              _maxIncorrectAnswersLimit =
                                                  _selectedCount;
                                              _maxIncorrectAnswersController
                                                      .text =
                                                  _maxIncorrectAnswersLimit
                                                      .toString();
                                            }
                                          });
                                        }
                                        _questionCountFocusNode.unfocus();
                                      },
                                      onChanged: (value) {
                                        if (value.isEmpty) {
                                          setState(() {
                                            _selectedCount = 1;
                                          });
                                          return;
                                        }
                                        final val = int.tryParse(value);
                                        if (val != null) {
                                          setState(() {
                                            final clampedVal = val.clamp(
                                              1,
                                              widget.totalQuestions,
                                            );
                                            _selectedCount = clampedVal;

                                            // If user typed a value outside range, update the text field
                                            if (val != clampedVal) {
                                              _questionCountController.text =
                                                  clampedVal.toString();
                                              _questionCountController
                                                      .selection =
                                                  TextSelection.fromPosition(
                                                    TextPosition(
                                                      offset:
                                                          _questionCountController
                                                              .text
                                                              .length,
                                                    ),
                                                  );
                                            }

                                            // Ensure error limit doesn't exceed question count
                                            if (_maxIncorrectAnswersLimit >
                                                _selectedCount) {
                                              _maxIncorrectAnswersLimit =
                                                  _selectedCount;
                                              _maxIncorrectAnswersController
                                                      .text =
                                                  _maxIncorrectAnswersLimit
                                                      .toString();
                                            }
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Plus Button
                                CountControlButton(
                                  icon: LucideIcons.plus,
                                  onTap: _incrementCount,
                                  bgColor: primaryColor,
                                  iconColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    QuizModeSelection(
                      isStudyMode: _isStudyMode,
                      onModeChanged: (isStudyMode) {
                        setState(() {
                          _isStudyMode = isStudyMode;
                          if (_isStudyMode) {
                            _subtractPoints = false;
                            _enableMaxIncorrectAnswers = false;
                          }
                        });
                      },
                      primaryColor: primaryColor,
                      controlBgColor: controlBgColor,
                      subTextColor: subTextColor,
                    ),

                    const SizedBox(height: 12),
                    AdvancedSettingsSection(
                      isStudyMode: _isStudyMode,
                      isDark: isDark,
                      textColor: textColor,
                      subTextColor: subTextColor,
                      borderColor: borderColor,
                      primaryColor: primaryColor,
                      controlBgColor: controlBgColor,
                      controlIconColor: controlIconColor,
                      subtractPoints: _subtractPoints,
                      penaltyAmount: _penaltyAmount,
                      penaltyController: _penaltyController,
                      penaltyFocusNode: _penaltyFocusNode,
                      onSubtractPointsChanged: (value) {
                        setState(() {
                          _subtractPoints = value;
                          if (_subtractPoints && _penaltyAmount <= 0.0) {
                            _penaltyAmount = 0.05;
                            _penaltyController.text = '0.05';
                          }
                        });
                      },
                      onPenaltyAmountChanged: (val) {
                        setState(() {
                          _penaltyAmount = val;
                        });
                      },
                      onIncrementPenalty: _incrementPenalty,
                      onDecrementPenalty: _decrementPenalty,
                      enableMaxIncorrectAnswers: _enableMaxIncorrectAnswers,
                      maxIncorrectAnswersLimit: _maxIncorrectAnswersLimit,
                      maxIncorrectAnswersController:
                          _maxIncorrectAnswersController,
                      maxIncorrectAnswersFocusNode:
                          _maxIncorrectAnswersFocusNode,
                      onEnableMaxIncorrectAnswersChanged: (value) {
                        setState(() {
                          _enableMaxIncorrectAnswers = value;
                        });
                      },
                      onMaxIncorrectAnswersLimitChanged: (val) {
                        setState(() {
                          _maxIncorrectAnswersLimit = val.clamp(
                            1,
                            _selectedCount,
                          );
                          if (val != _maxIncorrectAnswersLimit) {
                            _maxIncorrectAnswersController.text =
                                _maxIncorrectAnswersLimit.toString();
                            _maxIncorrectAnswersController
                                .selection = TextSelection.fromPosition(
                              TextPosition(
                                offset:
                                    _maxIncorrectAnswersController.text.length,
                              ),
                            );
                          }
                        });
                      },
                      onIncrementMaxIncorrect: _incrementMaxIncorrect,
                      onDecrementMaxIncorrect: _decrementMaxIncorrect,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Start with selected questions button
            if (widget.selectedQuestionCount > 0) ...[
              OutlinedButton(
                onPressed: () => _startQuiz(useSelectedOnly: true),
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryColor,
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 56),
                  side: BorderSide(color: primaryColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LucideIcons.checkCircle, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      l10n.startWithSelectedQuestions(
                        widget.selectedQuestionCount,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Start Button
            ElevatedButton(
              onPressed: () => _startQuiz(),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(LucideIcons.play, size: 20),
                  const SizedBox(width: 8),
                  Text(AppLocalizations.of(context)!.startQuiz),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
