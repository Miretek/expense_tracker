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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Provider.of<Rates>(context, listen: false).selectedCurrency ==
                      "ETB"
                  ? Text(
                      "Balance: ${(Provider.of<Incomes>(context).totalIncome - Provider.of<Expenses>(context).totalExpense).toStringAsFixed(2)} ETB")
                  : Provider.of<Rates>(context, listen: false)
                              .selectedCurrency ==
                          "USD"
                      ? Text(
                          "Balance: ${((Provider.of<Incomes>(context).totalIncome - Provider.of<Expenses>(context).totalExpense) * Provider.of<Rates>(context, listen: false).getUSDRate()).toStringAsFixed(2)} USD")
                      : Text(
                          "Balance: ${((Provider.of<Incomes>(context).totalIncome - Provider.of<Expenses>(context).totalExpense) * Provider.of<Rates>(context, listen: false).getEURRate()).toStringAsFixed(2)} EUR"),
              Provider.of<Rates>(context, listen: false).selectedCurrency ==
                      "ETB"
                  ? Text(
                      "Total Income: ${Provider.of<Incomes>(context).totalIncome} ETB")
                  : Provider.of<Rates>(context, listen: false)
                              .selectedCurrency ==
                          "USD"
                      ? Text(
                          "Total Income: ${(Provider.of<Incomes>(context).totalIncome * Provider.of<Rates>(context, listen: false).getUSDRate()).toStringAsFixed(2)} USD")
                      : Text(
                          "Total Income: ${(Provider.of<Incomes>(context).totalIncome * Provider.of<Rates>(context, listen: false).getEURRate()).toStringAsFixed(2)} EUR"),
              Provider.of<Rates>(context, listen: false).selectedCurrency ==
                      "ETB"
                  ? Text(
                      "Total Expense: ${(Provider.of<Expenses>(context).totalExpense).toStringAsFixed(2)} ETB")
                  : Provider.of<Rates>(context, listen: false)
                              .selectedCurrency ==
                          "USD"
                      ? Text(
                          "Total Expense: ${(Provider.of<Expenses>(context).totalExpense * Provider.of<Rates>(context, listen: false).getUSDRate()).toStringAsFixed(2)} USD")
                      : Text(
                          "Total Expense: ${(Provider.of<Expenses>(context).totalExpense * Provider.of<Rates>(context, listen: false).getEURRate()).toStringAsFixed(2)} EUR"),
              const SizedBox(
                height: 20,
              ),
              if (Provider.of<Expenses>(context).totalExpense != 0.0)
                Container(height: 200, child: const ExpensesView()),
              const SizedBox(
                height: 20,
              ),
              if (Provider.of<Expenses>(context).totalExpense != 0.0)
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 10,
                          height: 10,
                          color: Colors.blue,
                        ),
                        const Text("Food")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 10,
                          height: 10,
                          color: Colors.green,
                        ),
                        const Text("Gas")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 10,
                          height: 10,
                          color: Colors.deepOrange,
                        ),
                        const Text("Entertainment")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 10,
                          height: 10,
                          color: Colors.yellow,
                        ),
                        const Text("Rent")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 10,
                          height: 10,
                          color: Colors.pink,
                        ),
                        const Text("Clothes")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 10,
                          height: 10,
                          color: Colors.brown,
                        ),
                        const Text("Taxi")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 10,
                          height: 10,
                          color: Colors.red,
                        ),
                        const Text("Other")
                      ],
                    ),
                  ],
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
      ),
    );
  }
}
