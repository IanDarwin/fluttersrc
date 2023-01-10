import 'package:flutter/material.dart';
import '../model/model_using_bloc.dart';

class CounterPageUsingBloc extends StatelessWidget {
  final CounterUsingBloc _counterBloc = CounterUsingBloc();

  final String title;

  CounterPageUsingBloc({this.title='Demo', super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _counterBloc.counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text('You have pushed the button this many times: ${snapshot.data}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterBloc.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}