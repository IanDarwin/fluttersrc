import 'package:intl/intl.dart';

/// One Expense entry: something you spent money on that needs to be tracked.
class Expense {
  final int id;
  final DateTime expenseDate;
  final String description;
  final double amount;
  final Category category;
  final String imageFile;

  Expense(this.expenseDate, this.description, this.amount, this.category, { this.id = 0, this.imageFile = 'NOFILE' });

  Expense withId(int id) {
  	return Expense(expenseDate, description, amount, category, id: id, imageFile:imageFile);
  }

  static final dateFormatter = DateFormat().addPattern('yyyy-MM-dd');

  toMap() {
    return {
      'id': id,
      'expenseDate': dateFormatter.format(expenseDate),
      'description' : description,
      'amount': amount,
      'category': category.name,
      'imageFile': imageFile,
    };
  }
}

enum Category {
  restaurant,
  travel,
  accommodation,
  other;
}
