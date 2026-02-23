extension DoubleExtensions on double {
  /// Formats a double removing trailing zeros.
  ///
  /// Examples: 2.50 -> "2.5", 3.00 -> "3", 2.75 -> "2.75"
  String toCleanString() {
    if (this == roundToDouble()) return toInt().toString();
    return toStringAsFixed(
      2,
    ).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  }
}
