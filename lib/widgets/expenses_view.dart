import 'package:expense_tracker/providers/expenses.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesView extends StatelessWidget {
  const ExpensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(child: Text("in ETB")),
        PieChart(
          swapAnimationCurve: Curves.easeIn,
          swapAnimationDuration: const Duration(milliseconds: 800),
          PieChartData(
            sections: [
              PieChartSectionData(
                value: Provider.of<Expenses>(context).totalFoodExpense,
                color: Colors.blue,
              ),
              PieChartSectionData(
                  value:
                      Provider.of<Expenses>(context).totalEntertainmentExpense,
                  color: Colors.deepOrange),
              PieChartSectionData(
                value: Provider.of<Expenses>(context).totalGasExpense,
                color: Colors.green,
              ),
              PieChartSectionData(
                value: Provider.of<Expenses>(context).totalRentExpenses,
                color: Colors.yellow,
              ),
              PieChartSectionData(
                value: Provider.of<Expenses>(context).totalClothesExpense,
                color: Colors.pink,
              ),
              PieChartSectionData(
                value: Provider.of<Expenses>(context).totalTaxiExpense,
                color: Colors.brown,
              ),
              PieChartSectionData(
                value: Provider.of<Expenses>(context).totalOtherExpenses,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
