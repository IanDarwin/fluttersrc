
import 'package:flutter_test/flutter_test.dart';

import 'package:expenses/model/expense.dart';

main() {
    
    late Expense expense;
    
    setUp(() {
	// Expense(this.expenseDate, this.description, this.amount, this.category...
        expense = Expense(DateTime(2024,12,12), 'Hotel by the Bay', 124.95, Category.accommodation);
    });
    
    test('Expense knows its amount', () {
        expect(expense.amount, 124.95);
    });

    test('Expense knows its date', () {
        expect(expense.expenseDate, DateTime.parse('2024-12-12'));
    });
}
