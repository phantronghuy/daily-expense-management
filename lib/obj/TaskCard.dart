import 'package:daily_expense_management/obj/Task.dart';

class TaskCard extends Task{
  double _currentAmount;
  TaskCard(super.title, super.description, super.amount) : _currentAmount = 0.0;

  double get currentAmount => _currentAmount;

  set currentAmount(double currentAmount) {
    _currentAmount = currentAmount;
  }

  void addAmount(double amount) {
    _currentAmount += amount;
  }

}
