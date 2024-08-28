import 'package:expense_tracker/enums/expense_category.dart';
import 'package:expense_tracker/enums/currency.dart';
import 'package:hive/hive.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 1)
class ExpenseModel extends HiveObject {
  final now = DateTime.now();
  ExpenseModel({
    required this.category,
    this.note,
    required this.amount,
    required this.currency,
    required this.dateTime,
  });
  @HiveField(0)
  ExpenseCategory category;
  @HiveField(1)
  String? note;
  @HiveField(2)
  double amount;
  @HiveField(3)
  Currency currency;
  @HiveField(4)
  DateTime dateTime;
}
