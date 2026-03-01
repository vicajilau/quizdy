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

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mime/mime.dart';
import 'package:quizdy/data/services/ai/ai_service.dart';
import 'package:quizdy/domain/models/ai/ai_file_attachment.dart';
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/core/theme/app_theme.dart';
import 'package:quizdy/core/theme/extensions/confirm_dialog_colors_extension.dart';
import 'package:quizdy/presentation/widgets/quizdy_button.dart';
import 'package:quizdy/domain/models/ai/ai_study_generation_config.dart';
import 'package:quizdy/presentation/widgets/dialog_drop_zone.dart';

class AiGenerateStudyStep2Widget extends StatefulWidget {
  final TextEditingController textController;
  final AiFileAttachment? fileAttachment;
  final String selectedLanguage;
  final AIService? selectedService;
  final String? selectedModel;
  final VoidCallback onPickFile;
  final VoidCallback onRemoveFile;
  final VoidCallback onPasteFromClipboard;
  final ValueChanged<AiFileAttachment> onFileDropped;
  final VoidCallback onBack;
  final String Function() getWordCountText;
  final int Function() getWordCount;
  final int Function() getTopicCount;

  const AiGenerateStudyStep2Widget({
    super.key,
    required this.textController,
    required this.fileAttachment,
    required this.selectedLanguage,
    required this.selectedService,
    required this.selectedModel,
    required this.onPickFile,
    required this.onRemoveFile,
    required this.onPasteFromClipboard,
    required this.onFileDropped,
    required this.onBack,
    required this.getWordCountText,
    required this.getWordCount,
    required this.getTopicCount,
  });

  @override
  State<AiGenerateStudyStep2Widget> createState() =>
      _AiGenerateStudyStep2WidgetState();
}

class _AiGenerateStudyStep2WidgetState
    extends State<AiGenerateStudyStep2Widget> {
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    widget.textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.textController.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  Future<void> _handleDroppedFile(DropDoneDetails details) async {
    if (details.files.isEmpty) return;
    final file = details.files.first;
    final bytes = await file.readAsBytes();
    final mimeType =
        lookupMimeType(file.name, headerBytes: bytes) ??
        'application/octet-stream';
    widget.onFileDropped(
      AiFileAttachment(bytes: bytes, mimeType: mimeType, name: file.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.appColors;
    final borderColor = isDark ? Colors.transparent : AppTheme.borderColor;
    final inputBg = isDark ? AppTheme.borderColorDark : AppTheme.cardColorLight;
    final attachStroke = isDark ? AppTheme.zinc600 : AppTheme.zinc300;

    return DialogDropZone(
      onFilesDropped: _handleDroppedFile,
      onDragStateChanged: (isDragging) =>
          setState(() => _isDragging = isDragging),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          width: 600,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: colors.card,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      localizations.aiEnterContentTitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: colors.title,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: colors.surface,
                      fixedSize: const Size(40, 40),
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    icon: Icon(LucideIcons.x, color: colors.subtitle, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                localizations.aiEnterContentDescription,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: colors.subtitle,
                ),
              ),
              const SizedBox(height: 24),

              // Scrollable Content
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Input Area
                      Container(
                        height: 200,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: inputBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: widget.textController,
                                maxLines: null,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  color: colors.title,
                                ),
                                decoration: InputDecoration.collapsed(
                                  hintText: localizations.aiContentFieldHint,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    color: colors.surface,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: Text(
                                widget.getWordCountText(),
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  color: widget.getTopicCount() > 10
                                      ? Theme.of(context).primaryColor
                                      : colors.subtitle,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Attach File
                      GestureDetector(
                        onTap: widget.onPickFile,
                        child: Container(
                          height: 64,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _isDragging
                                ? Theme.of(
                                    context,
                                  ).primaryColor.withValues(alpha: 0.05)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _isDragging
                                  ? Theme.of(context).primaryColor
                                  : attachStroke,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _isDragging
                                        ? LucideIcons.download
                                        : LucideIcons.paperclip,
                                    color: _isDragging
                                        ? Theme.of(context).primaryColor
                                        : colors.subtitle,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  if (_isDragging)
                                    Text(
                                      localizations.dropAttachmentHere,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  else if (widget.fileAttachment != null)
                                    Text(
                                      widget.fileAttachment!.name,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: colors.title,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  else
                                    Text(
                                      localizations.aiAttachFileHint,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: colors.subtitle,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  if (widget.fileAttachment != null &&
                                      !_isDragging)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12.0,
                                        right: 16.0,
                                      ),
                                      child: GestureDetector(
                                        onTap: widget.onRemoveFile,
                                        child: Icon(
                                          LucideIcons.x,
                                          color: colors.title,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (widget.fileAttachment == null) ...[
                        const SizedBox(height: 8),
                        QuizdyButton(
                          type: QuizdyButtonType.secondary,
                          title: localizations.pasteFromClipboard,
                          icon: LucideIcons.clipboardPaste,
                          expanded: true,
                          onPressed: widget.onPasteFromClipboard,
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Footer (Action Buttons)
              Row(
                children: [
                  Expanded(
                    child: QuizdyButton(
                      type: QuizdyButtonType.secondary,
                      title: localizations.backButton,
                      icon: LucideIcons.arrowLeft,
                      expanded: true,
                      onPressed: widget.onBack,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: QuizdyButton(
                      title: localizations.generateButton,
                      icon: LucideIcons.sparkles,
                      expanded: true,
                      onPressed:
                          (widget.textController.text.isNotEmpty ||
                              widget.fileAttachment != null)
                          ? () {
                              final config = AiStudyGenerationConfig(
                                language: widget.selectedLanguage,
                                content: widget.textController.text.trim(),
                                preferredService: widget.selectedService,
                                preferredModel: widget.selectedModel,
                                file: widget.fileAttachment,
                                isTopicMode:
                                    widget.fileAttachment == null &&
                                    widget.getTopicCount() <= 10,
                              );
                              context.pop(config);
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
