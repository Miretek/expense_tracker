import 'package:expense_tracker/helpers/hive_db.dart';
import 'package:expense_tracker/providers/expenses.dart';
import 'package:expense_tracker/providers/incomes.dart';
import 'package:expense_tracker/providers/rates.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';
import 'package:expense_tracker/screens/add_income_screen.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/pick_category_screen.dart';
import 'package:expense_tracker/screens/transaction_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDb.openBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Expenses(),
        ),
        ChangeNotifierProvider.value(
          value: Incomes(),
        ),
        ChangeNotifierProvider.value(
          value: Rates(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          AddExpenseScreen.routeName: (ctx) => const AddExpenseScreen(),
          AddIncomeScreen.routeName: (ctx) => const AddIncomeScreen(),
          PickCategoryScreen.routeName: (ctx) => PickCategoryScreen(),
          TransactionListScreen.routeName: (ctx) =>
              const TransactionListScreen(),
        },
      ),
    );
  }
}
