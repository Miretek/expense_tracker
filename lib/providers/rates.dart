import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Rates with ChangeNotifier {
  String selectedCurrency = "ETB";
  void changeSelectedCurrency(String curr) {
    selectedCurrency = curr;
    notifyListeners();
  }

  Map<String, dynamic> _rates = {
    "USD": 0.0,
    "EUR": 0.0,
  };
  Future<bool> getRates() async {
    final url = Uri.parse(
        'https://api.currencyfreaks.com/v2.0/rates/latest?apikey=8d51a4f2e31044c49f365568d4c291b8&symbols=EUR,ETB');

    try {
      final response = await http.get(
        url,
      );

      final responseData = json.decode(response.body);
      _rates = responseData["rates"];
      // print(response.body);
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  double getUSDRate() {
    return 1 / double.parse(_rates["ETB"]!);
  }

  double getEURRate() {
    return double.parse(_rates["EUR"]!) / double.parse(_rates["ETB"]!);
  }
}
