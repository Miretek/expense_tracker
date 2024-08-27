import 'package:expense_tracker/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  static const routeName = "add-expense";
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final currencyList = ["ETB", "USD", "EUR"];
  DateTime? _pickedDate, _currentDate = DateTime.now();
  DateFormat format = DateFormat.yMMMd();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
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
                        onSaved: (value) {},
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
                onTap: () {},
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
                        child: Text("Choose Category"),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.emoji_transportation_rounded,
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
                onSaved: (value) {},
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
                        firstDate: DateTime(_currentDate!.year - 150),
                        lastDate: _currentDate!,
                      );
                    },
                    child: Text(
                      _pickedDate != null
                          ? "${format.format(_pickedDate!)}"
                          : "${format.format(_currentDate!)}",
                      style: TextStyle(
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
                      onPressed: () {},
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
        ));
  }
}
