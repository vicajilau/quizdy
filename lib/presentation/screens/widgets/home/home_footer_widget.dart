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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/core/theme/app_theme.dart';
import 'package:quizdy/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quizdy/presentation/blocs/file_bloc/file_event.dart';
import 'package:quizdy/presentation/widgets/quizdy_button.dart';

class HomeFooterWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onCreateTap;
  final VoidCallback onGenerateAITap;
  final VoidCallback onStudyModeTap;

  const HomeFooterWidget({
    super.key,
    required this.isLoading,
    required this.onCreateTap,
    required this.onGenerateAITap,
    required this.onStudyModeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48, top: 32),
      child: Column(
        spacing: 12,
        children: [
          QuizdyButton(
            title: AppLocalizations.of(context)!.studyModeLabel,
            icon: LucideIcons.bookOpen,
            onPressed: isLoading ? null : onStudyModeTap,
            expanded: true,
          ),
          QuizdyButton(
            title: AppLocalizations.of(context)!.generateQuestionsWithAI,
            icon: LucideIcons.sparkles,
            backgroundColor: AppTheme.secondaryColor,
            expanded: true,
            onPressed: isLoading ? null : onGenerateAITap,
          ),
          SizedBox(
            width: 620,
            child: Row(
              spacing: 12,
              children: [
                Flexible(
                  child: QuizdyButton(
                    type: QuizdyButtonType.secondary,
                    title: AppLocalizations.of(context)!.create,
                    icon: LucideIcons.plus,
                    expanded: true,
                    onPressed: isLoading ? null : onCreateTap,
                  ),
                ),
                Flexible(
                  child: QuizdyButton(
                    type: QuizdyButtonType.secondary,
                    title: AppLocalizations.of(context)!.load,
                    icon: LucideIcons.folderOpen,
                    expanded: true,
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<FileBloc>().add(QuizFileReset());
                            context.read<FileBloc>().add(
                              QuizFilePickRequested(),
                            );
                          },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
