import 'package:flutter/material.dart';

import '../model/expense_dao.dart';
import '../src/settings/settings_view.dart';
import 'expense_detail_view.dart';
import 'expense_detail_view_android.dart';

/// Displays a list of Expenses.
class ExpenseListView extends StatelessWidget {
  final dao = ExpenseDao();
  ExpenseListView({
    super.key,
  });

  static const routeName = '/';

  static const CategoryIcons = [
    Icon(Icons.restaurant),
    Icon(Icons.airplanemode_on),
    Icon(Icons.hotel),
    Icon(Icons.miscellaneous_services),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      body: ListView.builder( // Only build needed views in list
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'expenseListView',
        itemCount: dao.expenses.length,
        itemBuilder: (BuildContext context, int index) {
          final expense = dao.expenses[index];
          final int i = expense.category.index;
          final Icon icon = CategoryIcons[i];
          return ListTile(
            title: Text(expense.description),
            subtitle: Text("${expense.expenseDate} ${expense.amount}"),
            leading: icon,
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              // Navigator.restorablePush(
              //   context,
              //ExpenseDetailsViewAndroid.routeName,
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => (ExpenseDetailsViewAndroid(expense!))),
              );
            }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("FABulous! But nothing happens."),
        child: const Icon(Icons.add),
      ),
    );
  }
}
