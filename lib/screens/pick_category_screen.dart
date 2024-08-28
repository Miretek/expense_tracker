import 'package:expense_tracker/enums/expense_category.dart';
import 'package:expense_tracker/enums/income_category.dart';
import 'package:expense_tracker/providers/expenses.dart';
import 'package:expense_tracker/providers/incomes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PickCategoryScreen extends StatelessWidget {
  static const routeName = "pick-category";
  final String mode;
  PickCategoryScreen({this.mode = "expense", super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _categoryList = [
      {"url": "assets/expense-icons/healthy-food.png", "text": "Food"},
      {"url": "assets/expense-icons/clothes.png", "text": "Clothes"},
      {
        "url": "assets/expense-icons/entertainment.png",
        "text": "Entertainment"
      },
      {"url": "assets/expense-icons/gas.png", "text": "Gas"},
      {"url": "assets/expense-icons/house_rent.png", "text": "Rent"},
      {"url": "assets/expense-icons/taxi.png", "text": "Taxi"},
      {"url": "assets/expense-icons/other.png", "text": "Other"},
    ];
    List<Map<String, String>> _incomeCategoryList = [
      {"url": "assets/income-icons/salary.png", "text": "Salary"},
      {"url": "assets/income-icons/passive_income.png", "text": "Passive"},
      {"url": "assets/income-icons/portfolio_income.png", "text": "Portfolio"},
      {"url": "assets/expense-icons/other.png", "text": "Other"},
    ];
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: const Text(
                "Pick Category",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                mainAxisExtent: 120,
              ),
              itemCount: mode == "expense"
                  ? _categoryList.length
                  : _incomeCategoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      if (mode == "expense") {
                        Provider.of<Expenses>(context, listen: false)
                            .setSelectedExpenseIcon(
                                _categoryList[index]["url"].toString());
                        if (_categoryList[index]["text"].toString() == "Food") {
                          Provider.of<Expenses>(context, listen: false)
                              .setExpenseCategory(ExpenseCategory.food);
                        } else if (_categoryList[index]["text"].toString() ==
                            "Clothes") {
                          Provider.of<Expenses>(context, listen: false)
                              .setExpenseCategory(ExpenseCategory.clothes);
                        } else if (_categoryList[index]["text"].toString() ==
                            "Entertainment") {
                          Provider.of<Expenses>(context, listen: false)
                              .setExpenseCategory(
                                  ExpenseCategory.entertainment);
                        } else if (_categoryList[index]["text"].toString() ==
                            "Gas") {
                          Provider.of<Expenses>(context, listen: false)
                              .setExpenseCategory(ExpenseCategory.gas);
                        } else if (_categoryList[index]["text"].toString() ==
                            "Rent") {
                          Provider.of<Expenses>(context, listen: false)
                              .setExpenseCategory(ExpenseCategory.rent);
                        } else if (_categoryList[index]["text"].toString() ==
                            "Taxi") {
                          Provider.of<Expenses>(context, listen: false)
                              .setExpenseCategory(ExpenseCategory.taxi);
                        } else if (_categoryList[index]["text"].toString() ==
                            "Other") {
                          Provider.of<Expenses>(context, listen: false)
                              .setExpenseCategory(ExpenseCategory.other);
                        }
                      } else {
                        Provider.of<Incomes>(context, listen: false)
                            .setSelectedIncomeIcon(
                                _categoryList[index]["url"].toString());
                        if (_incomeCategoryList[index]["text"].toString() ==
                            "Salary") {
                          Provider.of<Incomes>(context, listen: false)
                              .setIncomeCategory(IncomeCategory.salary);
                        } else if (_incomeCategoryList[index]["text"]
                                .toString() ==
                            "Passive") {
                          Provider.of<Incomes>(context, listen: false)
                              .setIncomeCategory(IncomeCategory.passive);
                        } else if (_incomeCategoryList[index]["text"]
                                .toString() ==
                            "Portfolio") {
                          Provider.of<Incomes>(context, listen: false)
                              .setIncomeCategory(IncomeCategory.portfolio);
                        } else if (_categoryList[index]["text"].toString() ==
                            "Other") {
                          Provider.of<Incomes>(context, listen: false)
                              .setIncomeCategory(IncomeCategory.other);
                        }
                      }
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(mode == "expense"
                                ? _categoryList[index]["url"].toString()
                                : _incomeCategoryList[index]["url"]
                                    .toString())),
                        Center(
                            // width: 70,
                            // margin: const EdgeInsets.only(
                            //   left: 10.0,
                            // ),
                            child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            mode == "expense"
                                ? _categoryList[index]["text"].toString()
                                : _incomeCategoryList[index]["text"].toString(),
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
