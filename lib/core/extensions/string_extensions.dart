/// Extensions for String manipulation and formatting
extension StringExtensions on String {
  /// Removes the "Exception: " prefix from error messages
  ///
  /// Example:
  /// ```dart
  /// final error = "Exception: Something went wrong";
  /// print(error.cleanExceptionPrefix()); // "Something went wrong"
  /// ```
  String cleanExceptionPrefix() {
    if (startsWith('Exception: ')) {
      return substring('Exception: '.length);
    }
    return this;
  }

  /// Removes common exception prefixes from error messages
  ///
  /// Removes prefixes like "Exception: ", "Error: ", "FormatException: ", etc.
  ///
  /// Example:
  /// ```dart
  /// final error = "FormatException: Invalid format";
  /// print(error.cleanAllExceptionPrefixes()); // "Invalid format"
  /// ```
  String cleanAllExceptionPrefixes() {
    final prefixes = [
      'Exception: ',
      'Error: ',
      'FormatException: ',
      'StateError: ',
      'ArgumentError: ',
      'RangeError: ',
      'TypeError: ',
      'NoSuchMethodError: ',
      'UnsupportedError: ',
      'UnimplementedError: ',
      'ConcurrentModificationError: ',
      'OutOfMemoryError: ',
      'StackOverflowError: ',
    ];

    String result = this;
    for (final prefix in prefixes) {
      if (result.startsWith(prefix)) {
        result = result.substring(prefix.length);
        break;
      }
    }
    return result;
  }

  /// Comprehensive error message cleaning
  ///
  /// Removes exception prefixes and trims whitespace
  ///
  /// Example:
  /// ```dart
  /// final error = "  Exception: Something went wrong  ";
  /// print(error.cleanErrorMessage()); // "Something went wrong"
  /// ```
  String cleanErrorMessage() {
    return cleanAllExceptionPrefixes().trim();
  }

  /// Validates if the string is a valid OpenAI API key format
  ///
  /// OpenAI keys start with "sk-" and contain alphanumeric characters,
  /// dashes, and underscores. Minimum length is 20 characters.
  ///
  bool get isValidOpenAIApiKey {
    if (trim().isEmpty) return false;
    // OpenAI keys start with "sk-" and are at least 20 chars
    final regex = RegExp(r'^sk-[a-zA-Z0-9_-]{17,}$');
    return regex.hasMatch(trim());
  }

  /// Validates if the string is a valid Gemini API key format
  ///
  /// Gemini keys are alphanumeric strings, typically 39 characters.
  ///
  bool get isValidGeminiApiKey {
    if (trim().isEmpty) return false;
    // Gemini keys start with "AIza" and are typically 39 chars
    final regex = RegExp(r'^AIza[a-zA-Z0-9_-]{31,}$');
    return regex.hasMatch(trim());
  }

  /// Sanitizes a string to be used as a valid filename
  ///
  /// Replaces invalid characters with underscores and trims whitespace.
  /// Allowed characters: alphanumeric, dots, underscores, and hyphens.
  ///
  /// Example:
  /// ```dart
  /// val filename = "My Cool File/Name?".sanitizeFilename; // "My_Cool_File_Name_"
  /// ```
  String get sanitizeFilename {
    // Replace invalid characters with underscore
    // Keep alphanumeric, dots, underscores, and hyphens
    final sanitized = replaceAll(RegExp(r'[^a-zA-Z0-9._-]'), '_');
    // Remove leading/trailing underscores or dots if desired, or just trim
    return sanitized.trim();
  }
}
