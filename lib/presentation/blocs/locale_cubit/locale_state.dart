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
