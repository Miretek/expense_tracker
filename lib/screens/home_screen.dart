import 'package:expense_tracker/providers/expenses.dart';
import 'package:expense_tracker/providers/incomes.dart';
import 'package:expense_tracker/providers/rates.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';
import 'package:expense_tracker/screens/add_income_screen.dart';
import 'package:expense_tracker/widgets/app_drawer.dart';
import 'package:expense_tracker/widgets/drop_down.dart';
import 'package:expense_tracker/widgets/expenses_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildAddExpenseButton() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AddExpenseScreen.routeName),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.red[800],
          radius: 50,
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            child: Center(
              child: Text(
                "EXPENSE",
                style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddIncomeButton() {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AddIncomeScreen.routeName),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.green[800],
          radius: 50,
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            child: Center(
              child: Text(
                "INCOME",
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<Expenses>(context, listen: false).setTotal();
    Provider.of<Incomes>(context, listen: false).setTotal();
    Provider.of<Rates>(context, listen: false).getRates();
    Provider.of<Expenses>(context, listen: false).calculateCategoryExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        actions: [
          Container(
            width: 100.00,
            padding: const EdgeInsets.fromLTRB(15.00, 0.00, 10.00, 0.00),
            margin: const EdgeInsets.fromLTRB(5.00, 0.00, 5.00, 5.00),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.00),
                color: Colors.grey[200]),
            child: DropDown(Provider.of<Rates>(context).selectedCurrency,
                const ["ETB", "USD", "EUR"]),
          )
        ],
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 200, child: const ExpensesView()),
            Provider.of<Rates>(context, listen: false).selectedCurrency == "ETB"
                ? Text(
                    "Balance: ${(Provider.of<Incomes>(context).totalIncome - Provider.of<Expenses>(context).totalExpense).toStringAsFixed(2)} ETB")
                : Provider.of<Rates>(context, listen: false).selectedCurrency ==
                        "USD"
                    ? Text(
                        "Balance: ${((Provider.of<Incomes>(context).totalIncome - Provider.of<Expenses>(context).totalExpense) * Provider.of<Rates>(context, listen: false).getUSDRate()).toStringAsFixed(2)} USD")
                    : Text(
                        "Balance: ${((Provider.of<Incomes>(context).totalIncome - Provider.of<Expenses>(context).totalExpense) * Provider.of<Rates>(context, listen: false).getEURRate()).toStringAsFixed(2)} EUR"),
            Provider.of<Rates>(context, listen: false).selectedCurrency == "ETB"
                ? Text(
                    "Total Income: ${Provider.of<Incomes>(context).totalIncome} ETB")
                : Provider.of<Rates>(context, listen: false).selectedCurrency ==
                        "USD"
                    ? Text(
                        "Total Income: ${(Provider.of<Incomes>(context).totalIncome * Provider.of<Rates>(context, listen: false).getUSDRate()).toStringAsFixed(2)} USD")
                    : Text(
                        "Total Income: ${(Provider.of<Incomes>(context).totalIncome * Provider.of<Rates>(context, listen: false).getEURRate()).toStringAsFixed(2)} EUR"),
            Provider.of<Rates>(context, listen: false).selectedCurrency == "ETB"
                ? Text(
                    "Total Expense: ${(Provider.of<Expenses>(context).totalExpense).toStringAsFixed(2)} ETB")
                : Provider.of<Rates>(context, listen: false).selectedCurrency ==
                        "USD"
                    ? Text(
                        "Total Expense: ${(Provider.of<Expenses>(context).totalExpense * Provider.of<Rates>(context, listen: false).getUSDRate()).toStringAsFixed(2)} USD")
                    : Text(
                        "Total Expense: ${(Provider.of<Expenses>(context).totalExpense * Provider.of<Rates>(context, listen: false).getEURRate()).toStringAsFixed(2)} EUR"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAddExpenseButton(),
                  _buildAddIncomeButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
