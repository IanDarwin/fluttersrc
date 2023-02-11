import 'currency.dart';
import 'package:intl/intl.dart';

class Expense {
  static final DateFormat df = DateFormat('y-M-d');
  int id;
  DateTime when;
  double lat, long;
  String detail;
  double amount;
  Currency currency;
  Expense(this.id, this.when, this.lat, this.long, this.detail, this.amount, this.currency);

  @override
  String toString() {
    return "Expense ${df.format(when)} For $detail  ${currency.name}$amount";
  }
}
