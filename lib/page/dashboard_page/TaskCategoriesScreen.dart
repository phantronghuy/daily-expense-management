import 'package:daily_expense_management/obj/enum/MyLogger.dart';
import 'package:daily_expense_management/obj/enum/TasksCategories.dart';
import 'package:daily_expense_management/page/dashboard_page/CreateTaskPage.dart';
import 'package:daily_expense_management/page/dashboard_page/TaskCategoryCardWidget.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:flutter/material.dart';

class TaskCategoriesScreen extends StatefulWidget {
  TaskCategoriesScreen({super.key});

  @override
  State<TaskCategoriesScreen> createState() => _TaskCategoriesScreenState();
}

class _TaskCategoriesScreenState extends State<TaskCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    BuildContext classContext = context;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Task Categories"),
        backgroundColor: const Color(MyColors.primaryColor),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: TaskCategories.categories.length,
        itemBuilder: (context, index) {
          if (TaskCategories.getItemCategoryAtIndex(index).isEmpty) {
            return const SizedBox.shrink();
          }
          return InkWell(
              onTap: () => onClickOnEachItem(
                  TaskCategories.getItemCategoryAtIndex(index).keys.first,
                  context,
                  classContext),
              //onTap:() => _navigateToPrevScreen(context),
              child: TaskCategoryCardWidget(
                  categoryItem: TaskCategories.getItemCategoryAtIndex(index)));
        },
      ),
    ));
  }

  void _navigateToPrevScreen(BuildContext context) {
    if (!mounted) {
      MyLogger.log.warning("Context is not mounted, cannot navigate");
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateTaskScreen(isExpense: true)));
  }

  void onClickOnEachItem(
      String nameCategory, BuildContext context, BuildContext classContext) {
    if (nameCategory.isNotEmpty) {
      if (nameCategory.toLowerCase().replaceAll(" ", "") == "addnew") {
        MyLogger.log.info("Add new Category");
        _navigateToPrevScreen(classContext);
      } else {
        MyLogger.log.info("Category: $nameCategory");
      }
    }
  }
}
