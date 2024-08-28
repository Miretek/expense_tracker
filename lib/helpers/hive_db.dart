import 'package:expense_tracker/enums/currency.dart';
import 'package:expense_tracker/enums/expense_category.dart';
import 'package:expense_tracker/enums/income_category.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/models/income_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDb {
  // ignore: prefer_typing_uninitialized_variables
  static Box<dynamic>? expenseBox, incomeBox;
  static Future openBoxes() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseModelAdapter());
    Hive.registerAdapter(IncomeModelAdapter());
    Hive.registerAdapter(CurrencyAdapter());
    Hive.registerAdapter(ExpenseCategoryAdapter());
    Hive.registerAdapter(IncomeCategoryAdapter());
    expenseBox = await Hive.openBox("expense");
    incomeBox = await Hive.openBox("income");
  }
}
