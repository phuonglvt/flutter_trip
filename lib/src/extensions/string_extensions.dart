extension NullableStringExtensions on String? {
  /// Returns [true] if this nullable string is either null or empty.
  bool isNullOrEmpty() {
    return this?.trim().isEmpty ?? true;
  }
}
