import 'package:expense_tracker/enums/currency.dart';
import 'package:expense_tracker/enums/income_category.dart';
import 'package:expense_tracker/helpers/hive_db.dart';
import 'package:expense_tracker/models/income_model.dart';
import 'package:flutter/material.dart';

class Incomes with ChangeNotifier {
  IncomeModel? _income;
  IncomeCategory? _incomeCategory;
  Currency _currency = Currency.ETB;

  final List<IncomeModel> _incomesList = [];
  String _selectedIncomeIcon = "";

  IncomeModel? get income {
    return _income;
  }

  String get selectedIncomeIcon {
    return _selectedIncomeIcon;
  }

  void setSelectedIncomeIcon(String url) {
    _selectedIncomeIcon = url;
    notifyListeners();
  }

  List<IncomeModel> get incomesList {
    return _incomesList;
  }

  void setIncomeCategory(IncomeCategory ic) {
    _incomeCategory = ic;
    notifyListeners();
  }

  IncomeCategory? get incomeCategory {
    return _incomeCategory;
  }

  void setCurrency(Currency cur) {
    _currency = cur;
  }

  Currency get currency {
    return _currency;
  }

  Future<bool> addIncome(IncomeModel income) async {
    _incomesList.add(income);
    await HiveDb.incomeBox!.add(income);
    setTotal();
    print(HiveDb.incomeBox!.values.length);
    notifyListeners();
    return true;
  }

  bool removeIncome(IncomeModel income) {
    _incomesList.remove(income);
    notifyListeners();
    return true;
  }

  double _totalIncome = 0.0;
  double get totalIncome {
    return _totalIncome;
  }

  void setTotal() {
    double incomesum = 0.0;
    for (var value in HiveDb.incomeBox!.values) {
      incomesum += value.amount;
    }

    _totalIncome = incomesum;
    // notifyListeners();
  }
}
