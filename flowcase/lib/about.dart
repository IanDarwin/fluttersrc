import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  static const htmlText = """
<html>
<h1>About FlowCase, the Flutter Demo App</h1>
<p>This app demonstrates some of the
    <a href="https://flutter.dev">Flutter</a>
    widgets that will set you on your way to building
    <i>all kinds of interactive applications</i>,
    both mobile (Android, iOS) and desktop (Linux, macOS, Windows).
</p>
<p>Flutter Demos by <a href="https://rejmi.net/">Ian Darwin, Rejminet Group Inc.</a></p>
</html>
""";

  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Html(
        data: htmlText,
        onLinkTap: (String? url,
            Map<String, String> attributes,
            dynamic element) async {
          await launchUrl(Uri.parse(url!),
              mode: LaunchMode.inAppWebView);
        }
    );
  }
}
