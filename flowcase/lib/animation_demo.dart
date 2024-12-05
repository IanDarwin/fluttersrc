import 'package:flutter/material.dart';

// Extended from Flutter examples at
// https://github.com/flutter/website/tree/main/examples/animation
//
class AnimationApp extends StatefulWidget {
  const AnimationApp({super.key});

  @override
  State<AnimationApp> createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 175).animate(controller)
      ..addListener(() {
        setState(() {
          // Don't need to set anything here; the animation's state has changed
          // (so it called the listener) and the graphic will get drawn at the new size.
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: [Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: animation.value,
              width: animation.value,
              child: const FlutterLogo(),
            ),
              ElevatedButton(
                child: const Text("Back Again"),
                onPressed: () async {
                  await controller.reverse();
                  if (!mounted) {
                    return;
                  }
                  Navigator.pop(context);
                },
              ),
            ]
        )
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
