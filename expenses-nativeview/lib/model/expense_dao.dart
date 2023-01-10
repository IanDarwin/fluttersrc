import 'expense.dart';

class ExpenseDao {
  final List<Expense> expenses = [
    Expense(DateTime.now(), 'Restaurant on the edge of forever', 5678.90, Category.restaurant),
    Expense(DateTime.now(), 'Trip to the edge of forever', 1234.56, Category.travel),
    Expense(DateTime.now(), 'Overnight at the edge of forever', 45678.90, Category.accommodation),
    Expense(DateTime.now(), 'Return flight', 1234.90, Category.travel),
  ];
  //get expenses => _expenses;
}