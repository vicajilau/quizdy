import 'dart:convert';
import 'dart:typed_data';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quiz_app/core/context_extension.dart';
import 'package:quiz_app/core/l10n/app_localizations.dart';
import 'package:quiz_app/presentation/utils/clipboard_image_helper.dart';
import 'package:quiz_app/presentation/widgets/dialog_drop_zone.dart';

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
                  ElevatedButton.icon(
                    onPressed: () => _pickImage(context),
                    icon: const Icon(Icons.swap_horiz),
                    label: Text(localizations.changeImage),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () => _pasteFromClipboard(context),
                    icon: const Icon(LucideIcons.clipboardPaste),
                    label: Text(localizations.pasteImage),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: widget.onImageRemoved,
                    icon: const Icon(Icons.delete_outline),
                    label: Text(localizations.removeImage),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.error,
                    ),
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
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _pasteFromClipboard(context),
                icon: const Icon(LucideIcons.clipboardPaste, size: 18),
                label: Text(localizations.pasteFromClipboard),
              ),
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
