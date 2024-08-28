import 'package:hive/hive.dart';
part 'expense_category.g.dart';

@HiveType(typeId: 3)
enum ExpenseCategory {
  @HiveField(0)
  food,
  @HiveField(1)
  entertainment,
  @HiveField(2)
  rent,
  @HiveField(3)
  gas,
  @HiveField(4)
  clothes,
  @HiveField(5)
  taxi,
  @HiveField(6)
  other
}
