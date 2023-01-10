import 'dart:async';

/// A simple BLoC-based model. Notifies listeners on change.
class CounterUsingBloc {

  CounterUsingBloc() {
    print("Constructing CounterUsingBloc");
  }
  int _counter = 0;

  final _counterController = StreamController<int>();
  StreamSink<int> get counter => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  void incrementCounter() {
    _counter++;
    counter.add(_counter);
  }

  void decrementCounter() {
    _counter--;
    counter.add(_counter);
  }

  void dispose() {
    _counterController.close();
  }
}