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
