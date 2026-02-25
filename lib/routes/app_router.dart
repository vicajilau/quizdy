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

import 'package:go_router/go_router.dart';
import 'package:quizlab_ai/core/debug_print.dart';
import 'package:quizlab_ai/domain/models/quiz/quiz_file.dart';
import 'package:quizlab_ai/presentation/screens/file_loaded_screen.dart';
import 'package:quizlab_ai/presentation/screens/quiz_file_execution_screen.dart';

import 'package:quizlab_ai/core/service_locator.dart';

import 'package:quizlab_ai/domain/use_cases/check_file_changes_use_case.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quizlab_ai/presentation/screens/home_screen.dart';
import 'package:quizlab_ai/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:quizlab_ai/data/services/configuration_service.dart';

class AppRoutes {
  static const String home = '/';
  static const String onboarding = '/onboarding';
  static const String fileLoadedScreen = '/file_loaded_screen';
  static const String quizFileExecutionScreen = '/quiz_file_execution_screen';
}

GoRouter buildAppRouter({required bool showOnboarding}) => GoRouter(
  initialLocation: showOnboarding ? AppRoutes.onboarding : AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => OnboardingScreen(
        fromSettings: state.uri.queryParameters['from'] == 'settings',
      ),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.fileLoadedScreen,
      builder: (context, state) => FileLoadedScreen(
        fileBloc: ServiceLocator.instance.getIt<FileBloc>(),
        checkFileChangesUseCase: ServiceLocator.instance
            .getIt<CheckFileChangesUseCase>(),
        quizFile: ServiceLocator.instance.getIt<QuizFile>(),
      ),
    ),
    GoRoute(
      path: AppRoutes.quizFileExecutionScreen,
      builder: (context, state) => QuizFileExecutionScreen(
        quizFile: ServiceLocator.instance.getIt<QuizFile>(),
      ),
    ),
  ],

  redirect: (context, state) {
    final uri = state.uri.toString();
    printInDebug('Detected redirection: $uri');

    // If the path is a `content://` scheme, ignore it and return to Home
    if (uri.startsWith('content://')) {
      return AppRoutes.home;
    }

    return null; // Keep regular flow
  },
);

/// Legacy accessor kept for compatibility during migration.
/// Prefer using [buildAppRouter] with the onboarding flag.
late final GoRouter appRouter;

/// Initializes the global [appRouter] by checking the onboarding status.
Future<void> initAppRouter() async {
  final completed = await ConfigurationService.instance.getOnboardingCompleted();
  appRouter = buildAppRouter(showOnboarding: !completed);
}
