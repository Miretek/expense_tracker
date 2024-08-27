import 'package:expense_tracker/screens/add_expense_screen.dart';
import 'package:flutter/material.dart';

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
      onTap: () {},
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
    );
  }
}
