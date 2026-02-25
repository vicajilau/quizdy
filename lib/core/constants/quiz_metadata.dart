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

/// Provides metadata constants and version management for Quiz files.
class QuizMetadataConstants {
  /// The current supported Quiz file version.
  static const String version = '1.0.0';

  /// The default name format for exported Quiz files.
  static const String quizFileName = 'quiz-file$format';

  /// The file extension for Quiz files.
  static const String format = '.quiz';

  /// Determines whether the given version `v1` is supported based on the current Quiz version.
  ///
  /// Versions must follow the "X.Y.Z" format, where X, Y, and Z are integers.
  /// The comparison is made against `v2`, which represents the highest Quiz file version
  /// that the current application can support.
  ///
  /// Returns `true` if `v1` is equal to or greater than `v2`, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// QuizMetadataConstants.isSupportedVersion("1.2.3"); // true (if Quiz version is "1.2.0")
  /// QuizMetadataConstants.isSupportedVersion("1.0.0"); // true (if Quiz version is "1.0.0")
  /// QuizMetadataConstants.isSupportedVersion("0.9.9"); // false (if Quiz version is "1.0.0")
  /// ```
  static bool isSupportedVersion(String v1) {
    /// `v2` represents the highest Quiz file version that the current application can support.
    const v2 = QuizMetadataConstants.version;

    // Split the version strings into lists of integers
    List<int> v1Parts = v1.split('.').map(int.parse).toList();
    List<int> v2Parts = v2.split('.').map(int.parse).toList();

    // add 0s if they were omitted
    if (v1Parts.length < v2Parts.length) {
      return false;
    }

    // Compare each part (major, minor, patch)
    for (int i = 0; i < v2Parts.length; i++) {
      if (v1Parts[i] > v2Parts[i]) return false; // `v1` is newer
      if (v1Parts[i] < v2Parts[i]) return true; // `v1` is older
    }

    return true; // Versions are equal
  }
}
