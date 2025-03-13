import 'package:daily_expense_management/obj/TaskCard.dart';

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
  }

  void removeTaskCard(TaskCard taskCard) {
    taskCards.remove(taskCard);
  }

}