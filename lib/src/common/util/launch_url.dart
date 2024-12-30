import 'package:url_launcher/url_launcher.dart' as launcher;

Future<void> launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await launcher.canLaunchUrl(uri)) {
    await launcher.launchUrl(uri);
  }
}
