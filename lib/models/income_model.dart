import 'package:expense_tracker/enums/currency.dart';
import 'package:expense_tracker/enums/income_category.dart';
import 'package:hive/hive.dart';
part 'income_model.g.dart';

@HiveType(typeId: 5)
class IncomeModel extends HiveObject {
  final now = DateTime.now();
  IncomeModel({
    required this.category,
    this.note,
    required this.amount,
    required this.currency,
    required this.dateTime,
  });
  @HiveField(0)
  IncomeCategory category;
  @HiveField(1)
  String? note;
  @HiveField(2)
  double amount;
  @HiveField(3)
  Currency currency;
  @HiveField(4)
  DateTime dateTime;
}
