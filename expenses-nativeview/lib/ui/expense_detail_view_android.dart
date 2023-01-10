import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/expense.dart';

/// Displays detailed information about one Expense item
class ExpenseDetailsViewAndroid extends StatelessWidget {

  final Expense expense;

  const ExpenseDetailsViewAndroid(this.expense, {super.key});

  static const routeName = '/expense_item_android';

  @override
  Widget build(BuildContext context) {
    // This is used on the platform side to register the view.
    const String viewType = '<platform-view-type>';
    // Pass Expense as Map parameters to the platform side.
    final Map<String, dynamic> creationParams = expense.toMap();

    return Scaffold(
      appBar: AppBar(
          title: const Text("Expense Details")
      ),
      body: Column(
        children: [
          Expanded(
            child:AndroidView(
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            ),
          ),
          ElevatedButton(
            child: const Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
