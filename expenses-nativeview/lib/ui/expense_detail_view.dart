import 'package:flutter/material.dart';

/// Displays detailed information about one Expense item - Flutter version
class ExpenseDetailsView extends StatelessWidget {
  const ExpenseDetailsView({super.key});

  static const routeName = '/expense_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
      ),
      body: const Center(
        child: Text('Detailed Expense Info Here'),
      ),
    );
  }
}
