import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/blocs/locale_cubit/locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(const LocaleInitial());

  void changeLocale(Locale locale) {
    emit(LocaleUpdated(locale));
  }
}
