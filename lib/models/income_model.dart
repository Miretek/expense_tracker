import 'package:expense_tracker/enums/enums.dart';
import 'package:hive/hive.dart';

class IncomeModel extends HiveObject {
  final now = DateTime.now();
  IncomeModel({
    required this.category,
    this.note,
    required this.amount,
    required this.currency,
    required this.dateTime,
  });
  IncomeCategory category;
  String? note;
  double amount;
  Currency currency;
  DateTime dateTime;
}
