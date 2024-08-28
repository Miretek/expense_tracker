import 'package:hive/hive.dart';
part 'currency.g.dart';

@HiveType(typeId: 2)
enum Currency {
  @HiveField(0)
  // ignore: constant_identifier_names
  ETB,
  @HiveField(1)
  // ignore: constant_identifier_names
  USD,
  @HiveField(2)
  // ignore: constant_identifier_names
  EUR
}
