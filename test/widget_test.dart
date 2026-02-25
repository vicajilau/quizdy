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

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:quizlab_ai/core/service_locator.dart';
import 'package:quizlab_ai/main.dart';
import 'package:quizlab_ai/routes/app_router.dart';

void main() {
  ServiceLocator.instance.setup();

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Initialize the router directly to avoid SharedPreferences in tests.
    appRouter = buildAppRouter(showOnboarding: false);
    // Build our app and trigger a frame.
    await tester.pumpWidget(const QuizApplication());

    expect(find.text('1'), findsNothing);
  });
}
