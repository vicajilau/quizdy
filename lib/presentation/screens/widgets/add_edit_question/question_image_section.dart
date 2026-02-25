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
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizlab_ai/core/context_extension.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/presentation/utils/clipboard_image_helper.dart';
import 'package:quizlab_ai/presentation/widgets/dialog_drop_zone.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class QuestionImageSection extends StatefulWidget {
  final String? imageData;
  final VoidCallback onImagePicked;
  final VoidCallback onImageRemoved;
  final Function(String) onImageChanged;

  const QuestionImageSection({
    super.key,
    required this.imageData,
    required this.onImagePicked,
    required this.onImageRemoved,
    required this.onImageChanged,
  });

  @override
  State<QuestionImageSection> createState() => _QuestionImageSectionState();
}

class _QuestionImageSectionState extends State<QuestionImageSection> {
  bool _isDragging = false;

  Future<void> _handleDroppedFile(
    BuildContext context,
    DropDoneDetails details,
  ) async {
    if (details.files.isEmpty) return;
    final file = details.files.first;

    final bytes = await file.readAsBytes();

    String extension = file.name.split('.').last.toLowerCase();
    String mimeType = 'image/$extension';
    if (extension == 'jpg') mimeType = 'image/jpeg';

    final base64String = base64Encode(bytes);
    final imageData = 'data:$mimeType;base64,$base64String';
    widget.onImageChanged(imageData);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return DialogDropZone(
      onFilesDropped: (details) => _handleDroppedFile(context, details),
      onDragStateChanged: (isDragging) =>
          setState(() => _isDragging = isDragging),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.imageLabel,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),

          if (widget.imageData != null) ...[
            // Image preview
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isDragging
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).dividerColor,
                  width: _isDragging ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      _getImageBytes(widget.imageData!)!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Theme.of(context).colorScheme.error,
                                size: 48,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                localizations.imageLoadError,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  if (_isDragging)
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 32,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            localizations.dropImageHere,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  QuizLabAIButton(
                    title: localizations.changeImage,
                    icon: Icons.swap_horiz,
                    onPressed: () => _pickImage(context),
                  ),
                  const SizedBox(width: 8),
                  QuizLabAIButton(
                    type: QuizlabAIButtonType.secondary,
                    title: localizations.pasteImage,
                    icon: LucideIcons.clipboardPaste,
                    onPressed: () => _pasteFromClipboard(context),
                  ),
                  const SizedBox(width: 8),
                  QuizLabAIButton(
                    type: QuizlabAIButtonType.warning,
                    title: localizations.removeImage,
                    icon: Icons.delete_outline,
                    onPressed: widget.onImageRemoved,
                  ),
                ],
              ),
            ),
          ] else ...[
            // No image state
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isDragging
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).dividerColor,
                  width: _isDragging ? 2 : 1,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(8),
                color: _isDragging
                    ? Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.05)
                    : null,
              ),
              child: InkWell(
                onTap: () => _pickImage(context),
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isDragging
                          ? Icons.download
                          : Icons.add_photo_alternate_outlined,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isDragging
                          ? localizations.dropImageHere
                          : localizations.addImageTap,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (!_isDragging) ...[
                      const SizedBox(height: 4),
                      Text(
                        localizations.imageFormats,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            QuizLabAIButton(
              type: QuizlabAIButtonType.secondary,
              title: localizations.pasteFromClipboard,
              icon: LucideIcons.clipboardPaste,
              expanded: true,
              onPressed: () => _pasteFromClipboard(context),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _pasteFromClipboard(BuildContext context) async {
    final imageData = await ClipboardImageHelper.getClipboardImageAsBase64();
    if (!context.mounted) return;
    if (imageData != null) {
      widget.onImageChanged(imageData);
    } else {
      context.presentSnackBar(AppLocalizations.of(context)!.clipboardNoImage);
    }
  }

  /// Pick an image file and convert to base64
  Future<void> _pickImage(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        if (file.bytes != null) {
          // Get file extension to determine mime type
          String extension = file.extension?.toLowerCase() ?? 'png';
          String mimeType = 'image/$extension';
          if (extension == 'jpg') mimeType = 'image/jpeg';

          // Convert to base64
          String base64String = base64Encode(file.bytes!);
          String imageData = 'data:$mimeType;base64,$base64String';

          widget.onImageChanged(imageData);
        }
      }
    } catch (e) {
      // Handle error - could show a snackbar or dialog
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.imagePickError(e.toString()),
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  /// Extract image data from base64 string for preview
  Uint8List? _getImageBytes(String imageData) {
    try {
      // Extract base64 data after the comma
      final base64Data = imageData.split(',').last;
      return base64Decode(base64Data);
    } catch (e) {
      return null;
    }
  }
}
