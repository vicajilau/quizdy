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

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/domain/models/ai/ai_file_attachment.dart';
import 'package:quizlab_ai/presentation/widgets/quizlab_ai_button.dart';

class AiFilePickerSection extends StatelessWidget {
  final AiFileAttachment? fileAttachment;
  final ValueChanged<AiFileAttachment?> onFileChanged;

  const AiFilePickerSection({
    super.key,
    required this.fileAttachment,
    required this.onFileChanged,
  });

  Future<void> _pickFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        final pickedFile = result.files.first;
        if (pickedFile.bytes != null) {
          onFileChanged(
            AiFileAttachment(
              bytes: pickedFile.bytes!,
              mimeType:
                  lookupMimeType(
                    pickedFile.name,
                    headerBytes: pickedFile.bytes,
                  ) ??
                  'application/octet-stream',
              name: pickedFile.name,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        final localizations = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(localizations.aiFilePickerError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.aiAttachFile,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        if (fileAttachment != null)
          InputChip(
            label: Text(fileAttachment!.name, overflow: TextOverflow.ellipsis),
            avatar: const Icon(Icons.attach_file, size: 18),
            deleteIcon: const Icon(Icons.close, size: 18),
            onDeleted: () => onFileChanged(null),
            deleteButtonTooltipMessage: localizations.aiRemoveFile,
          )
        else
          QuizLabAIButton(
            type: QuizlabAIButtonType.secondary,
            title: localizations.aiAttachFile,
            icon: Icons.upload_file,
            onPressed: () => _pickFile(context),
          ),
      ],
    );
  }
}
