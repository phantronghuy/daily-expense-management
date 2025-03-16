import 'package:daily_expense_management/obj/Task.dart';
import 'package:daily_expense_management/obj/enum/TypeOfExpense.dart';

class TaskCard extends Task{
  double _currentAmount;
  TypeOfExpense _typeOfExpense;
  // Regular constructor
  TaskCard(String title, String description, double amount) 
      : _currentAmount = 0.0, 
        _typeOfExpense = TypeOfExpense.Other,
        super(title, description, amount);
  
  // Constructor for creating from an existing Task
  TaskCard.withCard(Task task, double currentAmount, TypeOfExpense typeOfExpense) 
      : _currentAmount = currentAmount,
        _typeOfExpense = typeOfExpense,
        // Pass the existing task's ID to avoid incrementing twice
        super.fromExisting(task.id, task.title, task.description, task.amount);

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

  @override
  String toString() {
    return super.toString() + 'TaskCard{_currentAmount: $_currentAmount, _typeOfExpense: $_typeOfExpense}';
  }

}
