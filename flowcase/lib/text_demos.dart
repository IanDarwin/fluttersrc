import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:url_launcher/url_launcher.dart';

class TextDemos extends StatelessWidget {
  const TextDemos({super.key});

  static final globalKey = GlobalKey();
  final htmlText = """
<h1>HTML Text Demo</h1>
<p>
<a href="https://flutter.dev">Flutter</a>
is a great framework that supports <i>all kinds of interactive applications</i>,
both mobile (Android, iOS) and desktop (Linux, macOS, Windows).
</p>
  """;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            // Plain Text uses default
            const Text("This is simple text"),
            // Text.rich() lets you stylize individual words/segments
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome to',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'Flutter!',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Html(
                anchorKey: globalKey,
                data: htmlText,
                onLinkTap: (String? url,
                    Map<String, String> attributes,
                    dynamic element) async {
                  await launchUrl(Uri.parse(url!),
                      mode: LaunchMode.inAppWebView);
                }
            ),
          ],
        )
    );
  }
}
