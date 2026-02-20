# Contributing to Quiz App

_tl;dr: be [courteous](CODE_OF_CONDUCT.md), check existing issues, follow the development setup below, and submit quality PRs._

Welcome
-------

We invite you to contribute to Quiz App! This project is built with Flutter and focuses on creating an interactive quiz application with features like AI-powered question generation and multilingual support.

There are many ways to contribute:
- Writing code and fixing bugs
- Filing issues on GitHub
- Improving documentation
- Adding translations for new languages
- Testing features and reporting bugs
- Helping other users with questions

We communicate primarily through GitHub Issues and Discussions.

Before you get started, please read:

1. [Our code of conduct](CODE_OF_CONDUCT.md), which requires everyone to be gracious, respectful, and professional.

2. [Security policy](SECURITY.md), which outlines how to report security vulnerabilities.

## Getting Started

### Development Environment Setup

1. **Prerequisites**
   - [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable version)
   - [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
   - A code editor (VS Code, Android Studio, or IntelliJ IDEA recommended)
   - Git for version control

2. **Clone the Repository**
   ```bash
   git clone https://github.com/vicajilau/quiz_app.git
   cd quiz_app
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Generate Localizations**
   ```bash
   flutter gen-l10n
   ```

5. **Run the App**
   ```bash
   flutter run -d chrome  # For web
   flutter run             # For mobile (with device/emulator connected)
   ```

### Project Structure

- `lib/` - Main application code
  - `core/` - Core utilities, constants, and localizations
  - `data/` - Data layer (services, repositories)
  - `domain/` - Domain models and business logic
  - `presentation/` - UI layer (screens, widgets, blocs)
- `test/` - Unit and widget tests
- `integration_test/` - Integration tests
- `docs/` - Additional documentation

## How to Contribute

### Reporting Issues

Before creating a new issue:
1. Search existing issues to avoid duplicates
2. Use the appropriate issue template
3. Provide detailed steps to reproduce
4. Include screenshots if applicable
5. Specify your environment (OS, Flutter version, browser)

### Submitting Pull Requests

1. **Fork the Repository**
   - Create a fork of the repository
   - Clone your fork locally

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**
   - Follow the existing code style and patterns
   - Add tests for new functionality
   - Update documentation if needed
   - Run tests to ensure nothing breaks

4. **Test Your Changes**
   ```bash
   flutter test                    # Run unit tests
   flutter test integration_test/  # Run integration tests
   flutter analyze                 # Check for code issues
   ```

5. **Commit Your Changes**
   - Use clear, descriptive commit messages
   - Follow conventional commit format: `feat:`, `fix:`, `docs:`, etc.

6. **Submit a Pull Request**
   - Push your branch to your fork
   - Create a PR against the main branch
   - Fill out the PR template completely
   - Link any related issues

### Code Style and Standards

- **Dart Style**: Follow [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- **Flutter Conventions**: Use Flutter best practices
- **Formatting**: Run `dart format .` before committing
- **Analysis**: Ensure `flutter analyze` passes without errors
- **Documentation**: Document public APIs and complex logic
- **Testing**: Maintain or improve test coverage

### Localization

To add support for a new language:

1. Add the language code to `l10n.yaml`
2. Create `lib/core/l10n/app_[language_code].arb`
3. Translate all strings from `app_en.arb`
4. Run `flutter gen-l10n` to generate the localization files
5. Test the new language in the app

### Areas Needing Help

Good first issues for new contributors:

- **Bug Fixes**: Look for issues labeled `good first issue`
- **Documentation**: Improve README, add code comments
- **Testing**: Add unit tests, integration tests
- **Localization**: Add new language translations
- **UI/UX**: Improve user interface and user experience
- **Accessibility**: Add accessibility features and improvements

## Development Guidelines

### State Management

- We use **BLoC pattern** for state management
- Keep business logic separate from UI
- Use events and states properly
- Follow BLoC naming conventions

### Dependencies

- Keep dependencies minimal and well-maintained
- Update dependencies regularly
- Document any new dependencies in PR description
- Prefer Flutter/Dart packages over platform-specific ones

### Performance

- Optimize for web and mobile platforms
- Use `const` constructors where possible
- Avoid unnecessary rebuilds
- Test performance on low-end devices

### Security

- Don't commit API keys or sensitive data
- Follow secure coding practices
- Report security issues privately (see [SECURITY.md](SECURITY.md))

## Testing

### Running Tests

```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Test with coverage
flutter test --coverage

# Analyze code
flutter analyze
```

### Writing Tests

- Write tests for new features
- Follow the existing test patterns
- Test both happy paths and edge cases
- Use descriptive test names

## Community

### Getting Help

- **GitHub Discussions**: For questions and general discussion
- **GitHub Issues**: For bug reports and feature requests
- **Stack Overflow**: Tag questions with `quiz-app` and `flutter`

### Recognition

Contributors who consistently provide valuable contributions may be invited to become maintainers with additional privileges and responsibilities.

## Release Process

Releases follow semantic versioning:
- **Patch** (1.0.1): Bug fixes
- **Minor** (1.1.0): New features, backward compatible
- **Major** (2.0.0): Breaking changes

Check [CHANGELOG.md](CHANGELOG.md) for release history.

---

Thank you for contributing to Quiz App! 🎉

Every contribution, no matter how small, helps make this project better for everyone.