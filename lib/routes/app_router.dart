import 'package:go_router/go_router.dart';
import 'package:quiz_app/core/debug_print.dart';
import 'package:quiz_app/domain/models/quiz/quiz_file.dart';
import 'package:quiz_app/presentation/screens/file_loaded_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_file_execution_screen.dart';

import 'package:quiz_app/core/service_locator.dart';

import 'package:quiz_app/domain/use_cases/check_file_changes_use_case.dart';
import 'package:quiz_app/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:quiz_app/presentation/screens/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String fileLoadedScreen = '/file_loaded_screen';
  static const String quizFileExecutionScreen = '/quiz_file_execution_screen';
}

final GoRouter appRouter = GoRouter(
  routes: [
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
