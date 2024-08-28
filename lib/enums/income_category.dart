import 'package:hive/hive.dart';
part 'income_category.g.dart';

@HiveType(typeId: 4)
enum IncomeCategory {
  @HiveField(0)
  salary,
  @HiveField(1)
  passive,
  @HiveField(2)
  portfolio,
  @HiveField(3)
  other
}
