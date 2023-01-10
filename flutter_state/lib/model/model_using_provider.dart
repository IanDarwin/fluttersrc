import 'package:flutter/material.dart';

/// A simple Provider-based model. Notifies listeners on change.
class CounterUsingProvider extends ChangeNotifier {

  CounterUsingProvider() {
    print("Creating CounterModelUsingProvider");
  }
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}