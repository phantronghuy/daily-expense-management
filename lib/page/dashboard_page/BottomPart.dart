import 'package:daily_expense_management/obj/TaskCard.dart';
import 'package:daily_expense_management/page/dashboard_page/TaskCardWidget.dart';
import 'package:daily_expense_management/page/dashboard_page/ToggleButton.dart';
import 'package:daily_expense_management/page/transaction_page/CreateTaskPage.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:flutter/material.dart';

class BottomPartWidget extends StatefulWidget {
  BottomPartWidget({super.key});

  @override
  State<BottomPartWidget> createState() => _BottomPartWidgetState();
}

class _BottomPartWidgetState extends State<BottomPartWidget> {
  List<TaskCard> tasksExpense = [
    TaskCard("Buy a new phone", "Iphone 13 Pro Max", 200),
    TaskCard("Buy a new laptop", "Macbook Pro 2021", 50000000),
    TaskCard("Buy a new car", "Tesla Model 3", 100000000),
    TaskCard("Buy a new house", "Vinhomes Grand Park", 500000000),
    TaskCard("Buy a new watch", "Apple Watch Series 7", 10000000),
  ];
  List<TaskCard> tasksIncome = [
    TaskCard("Salary", "Monthly salary", 20000000),
    TaskCard("Bonus", "Yearly bonus", 50000000),
  ];
  bool isExpenseEnable = true;

  void _toggleExpenseStatus(bool newValue) {
    setState(() {
      isExpenseEnable = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                children: [
                  // Expense & Income Toggle
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: MyColors.grayColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ToggleButton(
                        textBtn1: "Expense",
                        textBtn2: "Income",
                        currentStatusBtn1: isExpenseEnable,
                        onToggleStatus: _toggleExpenseStatus),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        itemCount: (isExpenseEnable)
                            ? tasksExpense.length
                            : tasksIncome.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return (isExpenseEnable)
                              ? TaskCardWidget(tasksExpense[index])
                              : TaskCardWidget(tasksIncome[index]);
                        }),
                  ),
                ],
              ),

              // Add Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateTaskScreen(isExpense: isExpenseEnable)),
                    );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8),
                  backgroundColor: const Color(MyColors.secondaryColor),
                  foregroundColor: const Color(MyColors.blackColor),
                ),
                child: const Icon(Icons.add, size: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
