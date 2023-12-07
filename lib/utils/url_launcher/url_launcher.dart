import 'package:url_launcher/url_launcher.dart';

Future<void> launchhUrI() async {
  if (!await launchUrl(Uri.parse(privacyPolicyUrl))) {
    throw Exception('Could not launch $privacyPolicyUrl');
  }
}

const privacyPolicyUrl =
    "https://www.freeprivacypolicy.com/live/efaf5aba-a6f4-490a-9a9b-f97f876e6770";
