import 'package:daily_expense_management/obj/TaskCard.dart';
import 'package:daily_expense_management/obj/enum/MyLogger.dart';
import 'package:daily_expense_management/obj/enum/TypeOfExpense.dart';

class TaskCardManager {
  static final TaskCardManager _singleton = TaskCardManager._internal();

  factory TaskCardManager() {
    return _singleton;
  }

  TaskCardManager._internal();

  List<TaskCard> taskCards = [];
  List<TaskCard> getTaskCards() {
    return taskCards;
  }

  void addTaskCard(TaskCard taskCard) {
    taskCards.add(taskCard);
    MyLogger.log.info(taskCard.toString());
  }

  void removeTaskCard(TaskCard taskCard) {
    taskCards.remove(taskCard);
  }

  int getNumberOfIncomeTask () {
    int income = 0;
    for (TaskCard taskCard in taskCards) {
      if (taskCard.typeOfExpense == TypeOfExpense.Income) {
        income ++;
      }
    }
    return income;
  }

  int getNumberOfExpenseTask () {
    int expense = 0;
    for (TaskCard taskCard in taskCards) {
      if (taskCard.typeOfExpense == TypeOfExpense.Expense) {
        expense ++;
      }
    }
    return expense;
  }

  double getTotalPerNameTask(String type) {
    double total = 0.0;
    for (TaskCard taskCard in taskCards) {
      if (taskCard.title.toLowerCase().compareTo(type.toLowerCase()) == 0) {
        total += taskCard.currentAmount;
      }
    }
    return total;
  }


}