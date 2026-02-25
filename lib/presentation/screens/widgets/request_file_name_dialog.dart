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
import 'package:lucide_icons/lucide_icons.dart';

import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

/// A dialog widget for requesting a file name from the user.
/// Styled according to design node 75JA2.
class RequestFileNameDialog extends StatefulWidget {
  final String format;
  const RequestFileNameDialog({super.key, required this.format});

  @override
  State<RequestFileNameDialog> createState() => _RequestFileNameDialogState();
}

class _RequestFileNameDialogState extends State<RequestFileNameDialog> {
  late TextEditingController
  _controller; // Controller for the file name input field.
  String? _errorMessage; // Error message to display if validation fails.

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(); // Initialize the text controller.
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the text controller to free resources.
    super.dispose();
  }

  /// Validate the input and set error messages as necessary.
  bool _validateInput() {
    final filename = _controller.text.trim(); // Get the trimmed input value.

    // Check if the filename is empty.
    if (filename.isEmpty) {
      setState(() {
        _errorMessage = AppLocalizations.of(
          context,
        )!.emptyFileNameMessage; // Set error message for empty filename.
      });
      return false;
    }

    // Check if the filename ends with '.quiz'; if not, append it.
    if (!filename.endsWith(widget.format)) {
      _controller.text =
          '$filename${widget.format}'; // Update the text with the correct extension.
    }

    setState(() {
      _errorMessage = null; // Clear any previous error messages.
    });
    return true; // Input is valid.
  }

  /// Handle submission of the dialog.
  void _submit() {
    if (_validateInput()) {
      context.pop(
        _controller.text.trim(),
      ); // Return the valid filename to the previous context.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 520,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.zinc800,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppTheme.borderColorDark, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.requestFileNameTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(LucideIcons.x, size: 20),
                  style: IconButton.styleFrom(
                    backgroundColor: AppTheme.zinc700,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(40, 40),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Input Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.fileNameHint,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _controller,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                  cursorColor: AppTheme.primaryColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppTheme.zinc700, // Zinc 700
                    hintText: 'quiz_name',
                    hintStyle: TextStyle(
                      color: Colors.white.withValues(alpha: 0.3),
                      fontFamily: 'Inter',
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppTheme.primaryColor, // Violet 500
                        width: 2,
                      ),
                    ),
                    errorText: _errorMessage,
                    errorStyle: const TextStyle(
                      color: AppTheme.errorColor, // Red 500
                      fontFamily: 'Inter',
                    ),
                  ),
                  onFieldSubmitted: (_) => _submit(),
                  onChanged: (value) {
                    setState(() {
                      _errorMessage = null;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Submit Button
            QuizLabAIButton(
              title: AppLocalizations.of(context)!.acceptButton,
              expanded: true,
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
