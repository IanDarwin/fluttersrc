import 'dart:collection';

import 'package:flutter/material.dart';

import 'expense.dart';

/// The "Flutter Provider" API-based Model for a list<Expense>.
class ExpenseModel extends ChangeNotifier {
  final List<Expense> _items = [];

  UnmodifiableListView<Expense> get items => UnmodifiableListView(_items);

  int get expenseCount => _items.length;

  addExpense(Expense expense) {
    _items.add(expense);
    notifyListeners();
  }

  updateExpense(Expense expense) {
    for (int i = 0; i < items.length; i++) {
      var item = items[i];
      if (item.id == expense.id) {
        items[i] = expense;
        return;
      }
    }
    throw Exception("Could not update $expense because it was not found");
  }
  removeExpense(Expense expense) {
    _items.remove(expense);
    notifyListeners();
  }
}
