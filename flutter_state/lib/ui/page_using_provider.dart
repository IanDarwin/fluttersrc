import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model_using_provider.dart';

class CounterPageUsingProvider extends StatelessWidget {
  final String title;

  const CounterPageUsingProvider({this.title='Demo', super.key});

  @override
  Widget build(BuildContext context) {
    print("Building CounterPageUsingProvider");
    final counterModel = Provider.of<CounterUsingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('You have pushed the button this many times: ${counterModel.counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterModel.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}