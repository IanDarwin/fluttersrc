import 'package:flutter/material.dart';
import 'package:flutter_state/ui/page_using_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building Bloc MyApp");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Blue for BLoC
      ),
      home: CounterPageUsingBloc(title: 'Flutter State (Bloc) Demo'),
    );
  }
}

