// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IncomeCategoryAdapter extends TypeAdapter<IncomeCategory> {
  @override
  final int typeId = 4;

  @override
  IncomeCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return IncomeCategory.salary;
      case 1:
        return IncomeCategory.passive;
      case 2:
        return IncomeCategory.portfolio;
      case 3:
        return IncomeCategory.other;
      default:
        return IncomeCategory.salary;
    }
  }

  @override
  void write(BinaryWriter writer, IncomeCategory obj) {
    switch (obj) {
      case IncomeCategory.salary:
        writer.writeByte(0);
        break;
      case IncomeCategory.passive:
        writer.writeByte(1);
        break;
      case IncomeCategory.portfolio:
        writer.writeByte(2);
        break;
      case IncomeCategory.other:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IncomeCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
