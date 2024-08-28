import 'package:expense_tracker/screens/transaction_list_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.9,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Divider(
              height: 3,
              color: Colors.grey,
            ),

            //Home Menu Item
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 3.0,
                bottom: 1.5,
              ),
              child: ListTile(
                splashColor: Colors.white,
                leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.list_outlined)),
                title: const Text(
                  "Expenses",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TransactionListScreen(mode: "expense"),
                  ),
                ),
              ),
            ),
            const Divider(
              height: 3,
              color: Colors.grey,
            ),

            //Home Menu Item
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 3.0,
                bottom: 1.5,
              ),
              child: ListTile(
                splashColor: Colors.white,
                leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.list_outlined)),
                title: const Text(
                  "Incomes",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const TransactionListScreen(mode: "income"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
