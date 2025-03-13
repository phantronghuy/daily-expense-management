import 'package:daily_expense_management/obj/Task.dart';
import 'package:daily_expense_management/obj/enum/TypeOfExpense.dart';

class TaskCard extends Task{
  double _currentAmount;
  TypeOfExpense _typeOfExpense;
  TaskCard(super.title, super.description, super.amount) : _currentAmount = 0.0, _typeOfExpense = TypeOfExpense.Other;
  TaskCard.withCard(Task task , double currentAmount, TypeOfExpense typeOfExpense) 
    : _currentAmount = currentAmount,
      _typeOfExpense = typeOfExpense,
      super(task.title, task.description, task.amount);

  TypeOfExpense get typeOfExpense => _typeOfExpense;

  set typeOfExpense(TypeOfExpense typeOfExpense) {
    _typeOfExpense = typeOfExpense;
  }

  double get currentAmount => _currentAmount;

  set currentAmount(double currentAmount) {
    _currentAmount = currentAmount;
  }

  void addAmount(double amount) {
    _currentAmount += amount;
  }

}
