import 'package:expenses_provider/model/currency.dart';
import 'package:flutter/material.dart';
import 'package:expenses_provider/model/expense.dart';
import 'package:expenses_provider/model/expense_model.dart';
import 'package:provider/provider.dart';

class ExpenseForm extends StatefulWidget {
  final String title;
  final bool createNew;
  const ExpenseForm(this.title, this.createNew, {super.key});

  @override
  State<StatefulWidget> createState() {
    return ExpenseFormState();
  }
}

class ExpenseFormState extends State<ExpenseForm>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ExpenseModel model = Provider.of<ExpenseModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children:[
          Text("There are ${model.expenseCount} expenses"),
          ElevatedButton(
          onPressed: () {
            // id, when, lat, long, detail, amount, currency);
            model.addExpense(Expense(0, DateTime.now(), 0, 0, "Food", 123.45, Currency.CAD));
            Navigator.of(context).pop();
            },
          child: const Text("Save")),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Discard")),
      ],
    )
    );
  }
}