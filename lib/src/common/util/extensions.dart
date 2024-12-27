/// Extensions for Dart objects.
extension ObjectExtension on Object {
  /// Safe cast to specific type.
  ///
  /// Returns value as specific type if it's equals else null.
  T? safeCast<T>() {
    if (this is! T) {
      return null;
    }
    return this as T;
  }
}
