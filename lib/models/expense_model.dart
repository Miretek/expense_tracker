import 'package:expense_tracker/enums/enums.dart';
import 'package:hive/hive.dart';

class ExpenseModel extends HiveObject {
  final now = DateTime.now();
  ExpenseModel({
    required this.category,
    this.note,
    required this.amount,
    required this.currency,
    required this.dateTime,
  });
  ExpenseCategory category;
  String? note;
  double amount;
  Currency currency;
  DateTime dateTime;
}
