import 'package:l/l.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launch external url.
///
/// [url] can be a [Uri] or a [String].
///
/// Returns `true` if the url was launched, `false` otherwise.
Future<bool> launchExternalUrl(Object? url) async {
  if (url == null) {
    return false;
  }

  try {
    final uri = url is Uri ? url : Uri.parse(url.toString());
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri);
    }
  } catch (e, st) {
    l.e(e, st);
  }

  return false;
}
