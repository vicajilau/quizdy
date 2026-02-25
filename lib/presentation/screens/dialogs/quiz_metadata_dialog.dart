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

/// A dialog that allows the user to create or edit quiz metadata.
///
/// This dialog collects the quiz name, description, and author.
/// It supports both creating a new quiz (where fields are initially empty)
/// and editing an existing one (where fields are pre-filled).
/// Styled according to design node 75JA2.
class QuizMetadataDialog extends StatefulWidget {
  /// The initial name of the quiz, used when editing.
  final String? initialName;

  /// The initial description of the quiz, used when editing.
  final String? initialDescription;

  /// The initial author of the quiz, used when editing.
  final String? initialAuthor;

  /// Whether the dialog is in editing mode (true) or creation mode (false).
  ///
  /// Defaults to `false`.
  final bool isEditing;

  /// Creates a [QuizMetadataDialog].
  const QuizMetadataDialog({
    super.key,
    this.initialName,
    this.initialDescription,
    this.initialAuthor,
    this.isEditing = false,
  });

  @override
  State<QuizMetadataDialog> createState() => _QuizMetadataDialogState();
}

class _QuizMetadataDialogState extends State<QuizMetadataDialog> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _authorController;

  // Error messages for input validation.
  String? _nameError;
  String? _descriptionError;
  String? _authorError;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _descriptionController = TextEditingController(
      text: widget.initialDescription,
    );
    _authorController = TextEditingController(text: widget.initialAuthor);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  /// Clears the name error message when the user types into the name field.
  void _onNameChanged(String value) {
    if (_nameError != null && value.isNotEmpty) {
      setState(() {
        _nameError = null;
      });
    }
  }

  /// Clears the description error message when the user types into the description field.
  void _onDescriptionChanged(String value) {
    if (_descriptionError != null && value.isNotEmpty) {
      setState(() {
        _descriptionError = null;
      });
    }
  }

  /// Clears the author error message when the user types into the author field.
  void _onAuthorChanged(String value) {
    if (_authorError != null && value.isNotEmpty) {
      setState(() {
        _authorError = null;
      });
    }
  }

  /// Validates the inputs and closes the dialog with the result if valid.
  void _submit() {
    final unknownValue = AppLocalizations.of(context)!.questionTypeUnknown;

    final name = _nameController.text.trim().isEmpty
        ? unknownValue
        : _nameController.text.trim();
    final description = _descriptionController.text.trim().isEmpty
        ? unknownValue
        : _descriptionController.text.trim();
    final author = _authorController.text.trim().isEmpty
        ? unknownValue
        : _authorController.text.trim();

    // No validation errors needed as we have defaults
    context.pop({'name': name, 'description': description, 'author': author});
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? errorText,
    required Function(String) onChanged,
    String? hintText,
    int? maxLines = 1,
    int? minLines,
    TextCapitalization textCapitalization = TextCapitalization.sentences,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          minLines: minLines,
          textCapitalization: textCapitalization,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 16,
          ),
          cursorColor: AppTheme.primaryColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.borderColorDark,
            hintText: hintText,
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
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
            errorText: errorText,
            errorStyle: const TextStyle(
              color: AppTheme.errorColor,
              fontFamily: 'Inter',
            ),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final unknownHint = AppLocalizations.of(context)!.questionTypeUnknown;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 520,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.cardColorDark,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: SingleChildScrollView(
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
                      widget.isEditing
                          ? AppLocalizations.of(context)!.editQuizFileTitle
                          : AppLocalizations.of(context)!.createQuizFileTitle,
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
                      backgroundColor: AppTheme.borderColorDark,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(40, 40),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Fields
              _buildTextField(
                controller: _nameController,
                label: AppLocalizations.of(context)!.fileNameLabel,
                hintText: unknownHint,
                errorText: _nameError,
                onChanged: _onNameChanged,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _descriptionController,
                label: AppLocalizations.of(context)!.fileDescriptionLabel,
                hintText: unknownHint,
                errorText: _descriptionError,
                onChanged: _onDescriptionChanged,
                minLines: 1,
                maxLines: null,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _authorController,
                label: AppLocalizations.of(context)!.authorLabel,
                hintText: unknownHint,
                errorText: _authorError,
                onChanged: _onAuthorChanged,
                textCapitalization: TextCapitalization.words,
              ),

              const SizedBox(height: 32),

              // Submit Button
              QuizLabAIButton(
                title: widget.isEditing
                    ? AppLocalizations.of(context)!.saveButton
                    : AppLocalizations.of(context)!.createButton,
                expanded: true,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
