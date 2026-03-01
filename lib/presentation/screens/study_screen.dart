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
import 'package:quizdy/core/l10n/app_localizations.dart';
import 'package:quizdy/data/services/ai/ai_jit_processing_service.dart';
import 'package:quizdy/domain/models/quiz/study_chunk.dart';
import 'package:quizdy/domain/models/quiz/study_chunk_state.dart';
import 'package:quizdy/presentation/blocs/study_execution_bloc/study_execution_bloc.dart';
import 'package:quizdy/presentation/blocs/study_execution_bloc/study_execution_event.dart';
import 'package:quizdy/presentation/blocs/study_execution_bloc/study_execution_state.dart';

class StudyScreen extends StatelessWidget {
  final List<StudyChunk> initialChunks;
  final String documentText;
  final String documentTitle;

  const StudyScreen({
    super.key,
    required this.initialChunks,
    required this.documentText,
    required this.documentTitle,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => StudyExecutionBloc(
        jitProcessingService: AiJitProcessingService.instance,
        localizations: localizations,
        initialChunks: initialChunks,
        documentText: documentText,
        documentTitle: documentTitle,
      )..add(const StudyChunkRequested(0)), // Start with the first chunk
      child: const StudyScreenView(),
    );
  }
}

class StudyScreenView extends StatelessWidget {
  const StudyScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<StudyExecutionBloc, StudyExecutionState>(
          builder: (context, state) {
            return Text(state.documentTitle);
          },
        ),
      ),
      body: BlocBuilder<StudyExecutionBloc, StudyExecutionState>(
        builder: (context, state) {
          final currentChunk = state.currentChunk;
          if (currentChunk == null) {
            return Center(
              child: Text(localizations.studyScreenNoSlidesAvailable),
            );
          }

          if (currentChunk.status == StudyChunkState.processing) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(localizations.studyScreenGenerating),
                ],
              ),
            );
          }

          if (currentChunk.status == StudyChunkState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.studyScreenError,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (currentChunk.errorMessage != null) ...[
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        currentChunk.errorMessage!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<StudyExecutionBloc>().add(
                        StudyChunkRequested(state.currentChunkIndex),
                      );
                    },
                    child: Text(localizations.studyScreenRetry),
                  ),
                ],
              ),
            );
          }

          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child:
                            currentChunk.slides != null &&
                                currentChunk.slides!.isNotEmpty
                            ? ListView.builder(
                                itemCount: currentChunk.slides!.length,
                                itemBuilder: (context, index) {
                                  final slide = currentChunk.slides![index];
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 16),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: slide.uiElements.map((
                                          element,
                                        ) {
                                          final text =
                                              element.props['text']
                                                  ?.toString() ??
                                              '';
                                          if (element.componentType ==
                                              'Title') {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 8.0,
                                              ),
                                              child: Text(
                                                text,
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.titleLarge,
                                              ),
                                            );
                                          }
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8.0,
                                            ),
                                            child: Text(text),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  localizations.studyScreenNoSlidesGenerated,
                                ),
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: state.hasPrevious
                                ? () => context.read<StudyExecutionBloc>().add(
                                    PreviousStudyChunkRequested(),
                                  )
                                : null,
                            child: Text(
                              localizations.studyScreenPreviousSection,
                            ),
                          ),
                          Text(
                            localizations.studyScreenSectionIndicator(
                              state.currentChunkIndex + 1,
                              state.chunks.length,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: state.hasNext
                                ? () => context.read<StudyExecutionBloc>().add(
                                    NextStudyChunkRequested(),
                                  )
                                : null,
                            child: Text(localizations.studyScreenNextSection),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.studyScreenAiSummaryTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            currentChunk.aiSummary ??
                                localizations.studyScreenNoSummary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
