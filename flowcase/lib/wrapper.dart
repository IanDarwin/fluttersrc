import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dialog_demos.dart';

// Simple Wrapper to provide app-bar with back button
// to demonstrate widgets that can then be self-contained.
class Wrapper extends StatelessWidget {
  final String title;
  final Widget demo;
  final fileName;
  const Wrapper(this.title, this.demo, this.fileName, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(icon: const Icon(Icons.code),
              onPressed: () async {
                Future<String> code = rootBundle.loadString("lib/$fileName.dart");
                code.then((s) =>
                  alertWidgetChild(context, SingleChildScrollView(child: Text(s)), title: "Code $fileName"));
              },
            )
          ],
        ),
        body: demo,
    );
  }
}
