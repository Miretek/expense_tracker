import 'package:expense_tracker/helpers/hive_db.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/models/income_model.dart';
import 'package:flutter/material.dart';

class TransactionListScreen extends StatefulWidget {
  static const routeName = "transactions";
  final String mode;
  const TransactionListScreen({this.mode = "expense", super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  Widget _buildListIncomeTile(Size deviceSize, IncomeModel income) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text("Category: ${income.category.name}"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text("Amount: ${income.amount} ETB"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text("Date: ${income.dateTime} "),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListExpenseTile(Size deviceSize, ExpenseModel expense) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text("Category: ${expense.category.name}"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text("Amount: ${expense.amount} ETB"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text("Date: ${expense.dateTime} "),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
          title: Text(
            widget.mode == "expense" ? 'List of Expenses' : "List of Income",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: widget.mode == "expense"
              ? HiveDb.expenseBox!.values.length
              : HiveDb.incomeBox!.values.length,
          itemBuilder: (ctx, index) {
            return widget.mode == "expense"
                ? _buildListExpenseTile(
                    deviceSize, HiveDb.expenseBox!.values.toList()[index])
                : _buildListIncomeTile(
                    deviceSize, HiveDb.incomeBox!.values.toList()[index]);
          },
        ));
  }
}
