import 'package:expense_tracker/models/income_model.dart';
import 'package:expense_tracker/providers/incomes.dart';
import 'package:expense_tracker/screens/pick_category_screen.dart';
import 'package:expense_tracker/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddIncomeScreen extends StatefulWidget {
  static const routeName = "add-income";
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final currencyList = ["ETB"];
  DateTime? _pickedDate;
  final _currentDate = DateTime.now();
  DateFormat format = DateFormat.yMMMd();
  Map<String, dynamic> _temp = {};
  final GlobalKey<FormState> _formKey = GlobalKey();
  IncomeModel? income;
  void _addHandler(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    bool added = await Provider.of<Incomes>(context, listen: false)
        .addIncome(IncomeModel(
      category: Provider.of<Incomes>(context, listen: false).incomeCategory!,
      amount: _temp["amount"],
      currency: Provider.of<Incomes>(context, listen: false).currency,
      dateTime: _pickedDate != null ? _pickedDate! : DateTime.now(),
    ));
    if (added) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[900],
          title: const Text(
            'Add Income',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: deviceSize.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.00,
                      padding:
                          const EdgeInsets.fromLTRB(15.00, 0.00, 10.00, 0.00),
                      margin: const EdgeInsets.fromLTRB(5.00, 0.00, 5.00, 5.00),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.00),
                          color: Colors.grey[200]),
                      child: DropDown("ETB", currencyList),
                    ),
                    Expanded(
                      child: Container(
                        height: 46,
                        // width: 200,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 5.0,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return 'Amount is required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _temp["amount"] = double.parse(value!);
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: "Poppins",
                          ),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            labelText: "Amount (required)",
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: "Poppins",
                            ),
                            floatingLabelStyle: const TextStyle(
                              // height: 5,
                              color: Color.fromRGBO(13, 71, 161, 1),
                            ),
                            border: OutlineInputBorder(
                              // borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(13, 71, 161, 1),
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // width: deviceSize.width,
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PickCategoryScreen(mode: "income")),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 46,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                              Provider.of<Incomes>(context).incomeCategory ==
                                      null
                                  ? "Choose Category"
                                  : Provider.of<Incomes>(context)
                                      .incomeCategory!
                                      .name),
                        ),
                      ),
                      Container(
                        child: Provider.of<Incomes>(context).incomeCategory ==
                                null
                            ? Icon(
                                Icons.emoji_transportation_rounded,
                              )
                            : Container(
                                height: 20,
                                width: 20,
                                child: Image.asset(Provider.of<Incomes>(context)
                                    .selectedIncomeIcon),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 46,
                // width: 150,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // validator: (val) {
                  //   if (val.toString().isEmpty) {
                  //     return 'Note is required';
                  //   }
                  //   return null;
                  // },
                  onSaved: (value) {
                    _temp["note"] = value!;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: "Poppins",
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    labelText: "Note",
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: "Poppins",
                    ),
                    floatingLabelStyle: const TextStyle(
                      // height: 5,
                      color: Color.fromRGBO(13, 71, 161, 1),
                    ),
                    border: OutlineInputBorder(
                      // borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(13, 71, 161, 1),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Date Picker
                  Padding(
                    padding: const EdgeInsets.only(
                      // vertical: 5,
                      left: 30,
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue[900],
                        // foregroundColor: Colors.white,
                        // padding: const EdgeInsets.symmetric(
                        //     horizontal: 100, vertical: 15),
                      ),
                      onPressed: () async {
                        _pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _currentDate,
                          firstDate: DateTime(_currentDate.year - 150),
                          lastDate: _currentDate,
                        );
                      },
                      child: Text(
                        _pickedDate != null
                            ? format.format(_pickedDate!)
                            : format.format(_currentDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          backgroundColor: Colors.blue[900],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 112, vertical: 15),
                        ),
                        onPressed: () => _addHandler(context),
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            // fontSize: 18,
                            fontFamily: "Poppins",
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
