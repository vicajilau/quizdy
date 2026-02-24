import 'package:flutter/material.dart';
import 'package:quizlab_ai/routes/app_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:quizlab_ai/core/theme/app_theme.dart';
import 'package:quizlab_ai/core/file_handler.dart';
import 'package:quizlab_ai/core/l10n/app_localizations.dart';
import 'package:quizlab_ai/core/service_locator.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlab_ai/presentation/blocs/file_bloc/file_event.dart';
import 'package:quizlab_ai/presentation/blocs/locale_cubit/locale_cubit.dart';
import 'package:quizlab_ai/presentation/blocs/locale_cubit/locale_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(null);
  ServiceLocator.instance.setup();
  await initAppRouter();

  runApp(const QuizApplication());
}

class QuizApplication extends StatefulWidget {
  const QuizApplication({super.key});

  @override
  State<QuizApplication> createState() => _QuizApplicationState();
}

class _QuizApplicationState extends State<QuizApplication> {
  @override
  void initState() {
    super.initState();
    FileHandler.initialize((filePath) {
      if (mounted) {
        final fileBloc = ServiceLocator.instance.getIt<FileBloc>();
        fileBloc.add(FileDropped(filePath));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: appRouter,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale == null) {
                return supportedLocales.first;
              }

              // Check if the current device locale is supported
              for (final supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }

              // If not supported, check if the language code is supported
              for (final supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }

              // If the locale is not supported, check if we have a fallback for this language
              // ignoring country code
              try {
                return supportedLocales.firstWhere(
                  (l) => l.languageCode == locale.languageCode,
                  orElse: () => const Locale('en'),
                );
              } catch (e) {
                return const Locale('en');
              }
            },
          );
        },
      ),
    );
  }
}
