import 'dart:ui';

/// Convert color value to hex string.
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc"
  /// with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true`
  /// (default is `true`).
  String toHex({bool leadingHashSign = true, bool withAlpha = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${_generateAlpha(alpha: alpha, withAlpha: withAlpha)}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';

  String _generateAlpha({required int alpha, required bool withAlpha}) {
    if (withAlpha) {
      return alpha.toRadixString(16).padLeft(2, '0');
    } else {
      return '';
    }
  }
}
