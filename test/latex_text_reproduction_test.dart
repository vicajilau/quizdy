import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/presentation/widgets/latex_text.dart';

void main() {
  testWidgets('LaTeXText wraps text when it exceeds constraints', (
    WidgetTester tester,
  ) async {
    // A very long text that should definitely wrap in a narrow container
    const longText =
        'This is a very long text that should wrap to multiple lines if the widget is working correctly. '
        'If it is staying on a single line, then there is a bug in the implementation or configuration.';

    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: SizedBox(
            width: 200, // Narrow width to force wrapping
            child: LaTeXText(
              longText,
              style: TextStyle(
                fontSize: 20,
              ), // Large font to ensure it needs more than 200px
            ),
          ),
        ),
      ),
    );

    // Check if we found either
    expect(find.byType(LaTeXText), findsOneWidget);

    // Verify it takes up enough height to be multi-line
    final Size size = tester.getSize(find.byType(LaTeXText));

    // 20px font size. Single line would be around 20-24px height.
    // Multi-line should be significantly larger.
    expect(
      size.height,
      greaterThan(30.0),
      reason: 'Height should be greater than single line height',
    );
  });

  testWidgets('LaTeXText with LaTeX content wraps', (
    WidgetTester tester,
  ) async {
    const longLatexText =
        r'This is a mixed text with latex $E=mc^2$ that should also wrap when it gets too long for the container width. '
        r'More text here to ensure it definitely wraps $x^2 + y^2 = z^2$.';

    await tester.pumpWidget(
      const MaterialApp(
        home: Center(
          child: SizedBox(
            width: 200,
            child: LaTeXText(longLatexText, style: TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );

    final Size size = tester.getSize(find.byType(LaTeXText));
    expect(
      size.height,
      greaterThan(30.0),
      reason:
          'Height should be greater than single line height for mixed content',
    );
  });
}
