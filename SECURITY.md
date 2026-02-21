# Security Policy

## Supported Versions

We actively support and provide security updates for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.1.x   | :white_check_mark: |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take security vulnerabilities seriously. If you discover a security vulnerability in Quiz App, please follow these steps:

### How to Report

1. **Do NOT create a public GitHub issue** for security vulnerabilities
2. **Contact us privately** through one of these methods:
   - Create a private security advisory on GitHub
   - Send an email to the maintainer via GitHub profile
   - Open a draft security advisory at: https://github.com/vicajilau/quiz_app/security/advisories

### What to Include

When reporting a vulnerability, please include:

- Description of the vulnerability
- Steps to reproduce the issue
- Potential impact assessment
- Suggested fix (if you have one)
- Your contact information for follow-up

### Response Timeline

- **Initial Response**: Within 48 hours of report
- **Assessment**: Within 7 days we'll provide an initial assessment
- **Fix Timeline**: Critical issues will be addressed within 14 days
- **Disclosure**: We'll coordinate with you on responsible disclosure

## Security Considerations

### Data Handling

Quiz App is designed with privacy in mind:

- **Local Storage Only**: All quiz data is stored locally
- **No External Data**: The app doesn't send personal data to external servers
- **File Processing**: Uploaded images are processed locally in the browser
- **API Keys**: AI service API keys are stored locally and not transmitted elsewhere

### Potential Risk Areas

Users should be aware of these areas:

- **AI Integration**: When AI features are enabled, quiz content may be sent to external AI services (OpenAI, Google Gemini)
- **File Uploads**: Large image files are processed in-browser and may affect performance
- **Local Storage**: Data persistence uses browser localStorage, which can be accessed by other scripts on the same domain

### Best Practices for Users

- Keep your browser updated to the latest version
- Be cautious when using AI features with sensitive content
- Regularly clear browser storage if sharing devices
- Only use the official deployment or build from source

## Scope

This security policy applies to:

- The main Quiz App application
- Official deployments and releases
- Dependencies and third-party integrations

## Dependencies

We regularly monitor our dependencies for security vulnerabilities:

- **Flutter Framework**: Updated to stable releases
- **Dart Packages**: Monitored via `flutter pub audit`
- **AI Services**: External API integrations (OpenAI, Google Gemini)

## Updates

Security updates will be:

- Released as patch versions (e.g., 1.1.2)
- Documented in the CHANGELOG.md
- Announced in GitHub releases
- Tagged with security labels when applicable

## Contact

For security-related questions or concerns:

- **Security Issues**: Use GitHub Security Advisories
- **General Questions**: Create a GitHub Discussion
- **Maintainer**: [@vicajilau](https://github.com/vicajilau)

Thank you for helping keep Quiz App secure!