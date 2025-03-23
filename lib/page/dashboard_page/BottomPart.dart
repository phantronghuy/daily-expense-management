import 'package:daily_expense_management/obj/TaskCard.dart';
import 'package:daily_expense_management/obj/enum/TypeOfExpense.dart';
import 'package:daily_expense_management/obj/manager/TaskCardManager.dart';
import 'package:daily_expense_management/page/dashboard_page/TaskCardWidget.dart';
import 'package:daily_expense_management/page/dashboard_page/TaskCategoriesScreen.dart';
import 'package:daily_expense_management/page/dashboard_page/ToggleButton.dart';
import 'package:daily_expense_management/page/dashboard_page/CreateTaskPage.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:flutter/material.dart';

class BottomPartWidget extends StatefulWidget {
  BottomPartWidget({super.key});
  @override
  State<BottomPartWidget> createState() => _BottomPartWidgetState();
}

class _BottomPartWidgetState extends State<BottomPartWidget> {
  bool isExpenseEnable = true;
  late TaskCardManager tskMng;

  void _toggleExpenseStatus(bool newValue) {
    setState(() {
      isExpenseEnable = newValue;
    });
  }

  void _navigateToCreateTaskScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTaskScreen(isExpense: isExpenseEnable),
      ),
    );
    setState(() {
      tskMng.getTaskCards();
    });
  }

  void _navigateToTaskCategoriesScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskCategoriesScreen(),
      ),
    );

    setState(() {
      tskMng.getTaskCards();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tskMng = TaskCardManager();
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
                        itemCount: tskMng.taskCards.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if ((isExpenseEnable &&
                                  tskMng.taskCards[index].typeOfExpense ==
                                      TypeOfExpense.Expense) ||
                              (!isExpenseEnable &&
                                  tskMng.taskCards[index].typeOfExpense ==
                                      TypeOfExpense.Income)) {
                            return TaskCardWidget(tskMng.taskCards[index]);
                          }
                          return const SizedBox.shrink();
                        }),
                  ),
                ],
              ),

              // Add Button
              ElevatedButton(
                onPressed: _navigateToTaskCategoriesScreen,
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
