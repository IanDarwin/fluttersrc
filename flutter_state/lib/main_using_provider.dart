import 'package:flutter/material.dart';
import 'package:flutter_state/model/model_using_provider.dart';
import 'package:flutter_state/ui/page_using_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => CounterUsingProvider(),
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building Provider MyApp");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Purple for Provider
      ),
      home: const CounterPageUsingProvider(title: 'Flutter State (Provider) Demo'),
    );
  }
}

