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

import 'package:get_it/get_it.dart';
import 'package:quizlab_ai/domain/use_cases/check_file_changes_use_case.dart';

import 'package:quizlab_ai/data/repositories/quiz_file_repository.dart';
import 'package:quizlab_ai/data/services/file_service/mobile_desktop_file_service.dart'
    if (dart.library.js_interop) '../../data/services/file_service/web_file_service.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_config.dart';

import 'package:quizlab_ai/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/quiz_execution_bloc/quiz_execution_bloc.dart';

// Singleton class for managing service registrations
class ServiceLocator {
  // Create a single instance of GetIt
  final GetIt getIt = GetIt.instance;

  // Private constructor to prevent external instantiation
  ServiceLocator._();

  // The single instance of ServiceLocator
  static final ServiceLocator _instance = ServiceLocator._();

  // Getter for the single instance
  static ServiceLocator get instance => _instance;

  // Function to set up the service locator and register dependencies
  void setup() {
    getIt.registerLazySingleton<QuizFileService>(() => QuizFileService());
    getIt.registerLazySingleton<CheckFileChangesUseCase>(
      () =>
          CheckFileChangesUseCase(fileRepository: getIt<QuizFileRepository>()),
    );
    getIt.registerLazySingleton<QuizFileRepository>(
      () => QuizFileRepository(fileService: getIt<QuizFileService>()),
    );
    getIt.registerLazySingleton<FileBloc>(
      () => FileBloc(fileRepository: getIt<QuizFileRepository>()),
    );
    getIt.registerFactory<QuizExecutionBloc>(() => QuizExecutionBloc());
  }

  // Function to register or update QuizFile in GetIt
  void registerQuizFile(QuizFile quizFile) {
    if (getIt.isRegistered<QuizFile>()) {
      getIt.unregister<QuizFile>();
    }
    getIt.registerLazySingleton<QuizFile>(() => quizFile);
  }

  // Function to register quiz configuration
  void registerQuizConfig(QuizConfig config) {
    if (getIt.isRegistered<QuizConfig>()) {
      getIt.unregister<QuizConfig>();
    }
    getIt.registerSingleton<QuizConfig>(config);
  }

  // Function to get the registered quiz configuration
  QuizConfig? getQuizConfig() {
    if (getIt.isRegistered<QuizConfig>()) {
      return getIt<QuizConfig>();
    }
    return null;
  }
}
