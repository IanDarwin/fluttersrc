import 'package:expenses_provider/model/expense_model.dart';
import 'package:expenses_provider/ui/expense_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Main program, and also the ListView which is usually showing.
void main() {
  print("main->runapp");
  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpenseModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("MyApp::build");
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Expenses App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _addExpense(BuildContext context) async {
    await Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => ExpenseForm('Add Expense Item', true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("_MyHomePageState::build");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
            child: Consumer<ExpenseModel>(
             builder: (context, expenseModel, child) {
              return ListView.builder(
                itemCount: expenseModel.expenseCount,
                prototypeItem: const ListTile(
                  title: Text("Expenses 2020-02-02 Someplace 123.45"),
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(expenseModel.items[index].toString()),
                  );
                },
              );
              },
            ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addExpense(context),
        tooltip: 'Add expense',
        child: const Icon(Icons.add),
      ),
    );
  }
}
