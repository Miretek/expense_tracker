import 'package:expense_tracker/enums/currency.dart';
import 'package:expense_tracker/enums/expense_category.dart';
import 'package:expense_tracker/helpers/hive_db.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class Expenses with ChangeNotifier {
  ExpenseModel? _expense;
  ExpenseCategory? _expenseCategory;
  Currency _currency = Currency.ETB;

  List<ExpenseModel> _expensesList = [];
  String _selectedExpenseIcon = "";

  ExpenseModel? get expense {
    return _expense;
  }

  String get selectedExpenseIcon {
    return _selectedExpenseIcon;
  }

  void setSelectedExpenseIcon(String url) {
    _selectedExpenseIcon = url;
    notifyListeners();
  }

  List<ExpenseModel> get expensesList {
    return _expensesList;
  }

  void setExpenseCategory(ExpenseCategory ec) {
    _expenseCategory = ec;
    notifyListeners();
  }

  ExpenseCategory? get expenseCategory {
    return _expenseCategory;
  }

  void setCurrency(Currency cur) {
    _currency = cur;
  }

  Currency get currency {
    return _currency;
  }

  Future<bool> addExpense(ExpenseModel expense) async {
    await HiveDb.expenseBox!.add(expense);
    _expensesList = HiveDb.expenseBox!.values as List<ExpenseModel>;
    setTotal();
    calculateCategoryExpenses();
    notifyListeners();
    return true;
  }

  bool removeExpense(ExpenseModel expense) {
    _expensesList.remove(expense);
    notifyListeners();
    return true;
  }

  double _totalExpense = 0.0;
  double get totalExpense {
    return _totalExpense;
  }

  void setTotal() {
    double sum = 0.0;
    for (var value in HiveDb.expenseBox!.values) {
      sum += value.amount;
    }

    _totalExpense = sum;
    // notifyListeners();
  }

  double foodExpense = 0.0,
      entertainmentExpense = 0.0,
      rentExpense = 0.0,
      clothesExpense = 0.0,
      gasExpense = 0.0,
      taxiExpenses = 0.0,
      otherExpenses = 0.0;

  double get totalFoodExpense {
    return foodExpense;
  }

  double get totalEntertainmentExpense {
    return entertainmentExpense;
  }

  double get totalRentExpenses {
    return rentExpense;
  }

  double get totalClothesExpense {
    return clothesExpense;
  }

  double get totalGasExpense {
    return gasExpense;
  }

  double get totalTaxiExpense {
    return taxiExpenses;
  }

  double get totalOtherExpenses {
    return otherExpenses;
  }

  void calculateFoodExpenses() {
    double totalFoodExpense = 0.0;
    for (var exp in HiveDb.expenseBox!.values) {
      if (exp.category == ExpenseCategory.food) totalFoodExpense += exp.amount;
    }
    foodExpense = totalFoodExpense;
  }

  void calculateEntertainmentExpenses() {
    double totalEntertainmentExpense = 0.0;
    for (var exp in HiveDb.expenseBox!.values) {
      if (exp.category == ExpenseCategory.entertainment)
        totalEntertainmentExpense += exp.amount;
    }
    entertainmentExpense = totalEntertainmentExpense;
  }

  void calculateRentExpenses() {
    double totalRentExpense = 0.0;
    for (var exp in HiveDb.expenseBox!.values) {
      if (exp.category == ExpenseCategory.rent) totalRentExpense += exp.amount;
    }
    rentExpense = totalRentExpense;
  }

  void calculateClothesExpenses() {
    double totalClothesExpense = 0.0;
    for (var exp in HiveDb.expenseBox!.values) {
      if (exp.category == ExpenseCategory.clothes)
        totalClothesExpense += exp.amount;
    }
    clothesExpense = totalClothesExpense;
  }

  void calculateGasExpenses() {
    double totalGasExpense = 0.0;
    for (var exp in HiveDb.expenseBox!.values) {
      if (exp.category == ExpenseCategory.gas) totalGasExpense += exp.amount;
    }
    gasExpense = totalGasExpense;
  }

  void calculateTaxiExpenses() {
    double totalTaxiExpense = 0.0;
    for (var exp in HiveDb.expenseBox!.values) {
      if (exp.category == ExpenseCategory.taxi) totalTaxiExpense += exp.amount;
    }
    taxiExpenses = totalTaxiExpense;
  }

  void calculateOtherExpenses() {
    double totalOtherExpense = 0.0;
    for (var exp in HiveDb.expenseBox!.values) {
      if (exp.category == ExpenseCategory.other)
        totalOtherExpense += exp.amount;
    }
    otherExpenses = totalOtherExpense;
  }

  void calculateCategoryExpenses() {
    calculateClothesExpenses();
    calculateEntertainmentExpenses();
    calculateFoodExpenses();
    calculateGasExpenses();
    calculateRentExpenses();
    calculateTaxiExpenses();
    calculateOtherExpenses();
    // notifyListeners();
  }
}
