// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseCategoryAdapter extends TypeAdapter<ExpenseCategory> {
  @override
  final int typeId = 3;

  @override
  ExpenseCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExpenseCategory.food;
      case 1:
        return ExpenseCategory.entertainment;
      case 2:
        return ExpenseCategory.rent;
      case 3:
        return ExpenseCategory.gas;
      case 4:
        return ExpenseCategory.clothes;
      case 5:
        return ExpenseCategory.taxi;
      case 6:
        return ExpenseCategory.other;
      default:
        return ExpenseCategory.food;
    }
  }

  @override
  void write(BinaryWriter writer, ExpenseCategory obj) {
    switch (obj) {
      case ExpenseCategory.food:
        writer.writeByte(0);
        break;
      case ExpenseCategory.entertainment:
        writer.writeByte(1);
        break;
      case ExpenseCategory.rent:
        writer.writeByte(2);
        break;
      case ExpenseCategory.gas:
        writer.writeByte(3);
        break;
      case ExpenseCategory.clothes:
        writer.writeByte(4);
        break;
      case ExpenseCategory.taxi:
        writer.writeByte(5);
        break;
      case ExpenseCategory.other:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
