# LaTeX Support for Quiz Options

## Overview

QuizLab AI supports LaTeX rendering in quiz questions and answer options. This enables educators to include mathematical equations, formulas, and scientific notation in their quizzes.

## Features

- **Inline Math Only**: Use `$...$` syntax for LaTeX expressions (inline mode)
- **Mixed Content**: Seamlessly blend plain text with LaTeX expressions
- **Real-time Preview**: Live preview updates instantly as you type—no save needed
- **Error Handling**: Invalid LaTeX expressions display as plain text with red highlighting
- **Preview Support**: Built-in inline preview headers in question text, options, and explanation fields
- **Vertical Alignment**: Proper text alignment in input fields and preview containers for improved readability
- **Consistent Styling**: Grey-colored preview labels and rendered equations for a cohesive visual design

## Usage Examples

### Question Text
Questions support full LaTeX rendering with inline math. Examples:
- `What is the solution to $x^2 + 2x + 1 = 0$?`
- `Simplify the expression $\frac{a^2 + 2ab + b^2}{a + b}$`

### Answer Options
All quiz answer option types support LaTeX:

**Single Choice/Multiple Choice:**
```
Option A: $\sin^2(x) + \cos^2(x)$
Option B: $e^{i\pi} + 1$
Option C: $\sqrt{2} \approx 1.414$
```

**True/False:**
```
True: $\pi \approx 3.14159...$
False: $e \approx 1.5$ (actual: $e \approx 2.718$)
```

**Essay Questions:**
The question text can contain LaTeX, but essay answers are plain text.

## LaTeX Syntax

### Common Mathematical Expressions

| Expression | LaTeX Syntax | Example |
|------------|------------|---------|
| Superscript | `$x^2$` | $x^2$ |
| Subscript | `$x_1$` | $x_1$ |
| Fraction | `$\frac{a}{b}$` | $\frac{a}{b}$ |
| Square Root | `$\sqrt{x}$` | $\sqrt{x}$ |
| Greek Letters | `$\alpha, \beta, \gamma$` | $\alpha, \beta, \gamma$ |
| Summation | `$\sum_{i=1}^{n}$` | $\sum_{i=1}^{n}$ |
| Integration | `$\int_0^1 f(x)dx$` | $\int_0^1 f(x)dx$ |

### Inline Mode Only

QuizLab AI supports **inline math mode only** using `$...$` delimiters:
```
The quadratic formula is $x = \frac{-b \pm \sqrt{b^2-4ac}}{2a}$.
```

This works seamlessly within text and automatically renders the mathematical expression.

## Implementation Details

### Files Modified

1. **lib/presentation/widgets/latex_text.dart** (NEW)
   - Core `LaTeXText` widget for rendering LaTeX expressions
   - Parses mixed text and math syntax
   - Provides error fallback for invalid LaTeX

2. **lib/presentation/screens/dialogs/latex_preview_dialog.dart** (NEW)
   - Standalone preview dialog (available but simplified in favor of inline preview)
   - Dark background for better visibility of equations
   - Accessible programmatically if needed for standalone preview

3. **lib/presentation/screens/quiz_execution/quiz_question_options.dart**
   - Updated `_buildOptionTile()` to use `LaTeXText` for option rendering
   - Supports both checkbox and radio button layouts

4. **lib/presentation/screens/quiz_execution/quiz_question_header.dart**
   - Updated to render question text with LaTeX support

5. **lib/presentation/screens/quiz_execution/quiz_question_result_card.dart**
   - Updated results display to show LaTeX-rendered questions

6. **lib/presentation/screens/widgets/question_list_widget.dart**
   - Updated question list preview to render LaTeX

7. **lib/presentation/screens/widgets/add_edit_question/question_option_row.dart**
   - Displays inline preview header with "Supports LaTeX: $x^2$" label
   - Shows live preview on the same line when LaTeX syntax detected
   - Updates in real-time as user types

8. **lib/presentation/screens/dialogs/add_edit_question_dialog.dart**
   - Inline preview headers for question text and explanation fields
   - Real-time live preview updates on every keystroke
   - Grey-colored labels and previews for visual consistency
   - Vertical text alignment for optimal input experience

9. **lib/presentation/screens/dialogs/ai_question_dialog.dart**
   - Updated AI question context preview to render LaTeX

### Technical Stack

- **Package**: `flutter_math_fork: ^0.7.2` (already included in pubspec.yaml)
- **Rendering**: Uses `Math.tex()` widget for LaTeX rendering
- **Parser**: Custom implementation in `LaTeXText` that handles mixed content
- **Error Handling**: Graceful fallback for rendering errors

## Workflow: Adding a LaTeX Question

1. **Create/Edit Question**
   - Open the question editor
   - Enter question text with LaTeX: `Solve $x^2 - 4 = 0$`
   - Text input fields use top-aligned text for multi-line content
   - See live preview appear inline as you type in the header row
   - In answer options, add LaTeX expressions: `$x = 2$` or `$x = -2$`
   - Add explanation text with LaTeX if needed

2. **Real-time Preview**
   - Each field shows "Supports LaTeX: $x^2$" label in the header (grey color)
   - As you type an expression with `$...$`, preview renders instantly inline with the label (grey color)
   - No save required—preview updates on every keystroke
   - Preview appears on the same line with horizontal scrolling if needed
   - Preview containers use vertical center alignment for proper equation display

3. **Quiz Execution & Results**
   - Quiz options use vertical center alignment for balanced appearance
   - Question text uses vertical center alignment in headers
   - Results display uses vertical center alignment for consistency

4. **Test**
   - Save the quiz file
   - Execute the quiz to see how questions and options appear to learners
   - LaTeX is automatically rendered in the quiz UI and results

## Known Limitations

- **Inline mode only**: Display mode (`$$...$$`) is not supported
- LaTeX parsing doesn't support nested delimiters
- Very complex equations may have rendering performance impact
- Some advanced LaTeX packages are not supported by `flutter_math_fork`
- Preview updates are triggered by keystroke—very rapid typing may cause slight delay in preview rendering

## Browser/Platform Compatibility

LaTeX support works consistently across all platforms:
- ✅ Web
- ✅ Android
- ✅ iOS
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Future Enhancements

- Add equation builder UI for users unfamiliar with LaTeX syntax
- Support for additional LaTeX packages
- Caching of rendered equations for performance
- LaTeX symbol picker panel in question editor

## Resources

- LaTeX Math Mode: https://en.wikibooks.org/wiki/LaTeX/Mathematics
- MathJax Reference: https://docs.mathjax.org/en/latest/
- flutter_math_fork: https://pub.dev/packages/flutter_math_fork
