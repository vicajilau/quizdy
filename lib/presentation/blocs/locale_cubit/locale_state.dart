import 'package:flutter/material.dart';

abstract class LocaleState {
  final Locale? locale;

  const LocaleState(this.locale);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocaleState && other.locale == locale;
  }

  @override
  int get hashCode => locale.hashCode;
}

class LocaleInitial extends LocaleState {
  const LocaleInitial() : super(null);
}

class LocaleUpdated extends LocaleState {
  const LocaleUpdated(super.locale);
}
