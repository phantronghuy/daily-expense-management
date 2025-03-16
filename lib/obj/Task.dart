import 'package:daily_expense_management/obj/enum/IdTask.dart';

class Task {
  late int _id;
  late String _title;
  late String _description;
  late double _amount;

  // Regular constructor
  Task(this._title, this._description, this._amount) {
    _id = IdTask.id++;
  }
  
  // Add this constructor for creating from existing values
  Task.fromExisting(int id, String title, String description, double amount) {
    _id = id;
    _title = title;
    _description = description;
    _amount = amount;
  }
  
  int get id => _id;

  String get title => _title;
  String get description => _description;
  double get amount => _amount;

  set title(String title) {
    _title = title;
  }

  set description(String description) {
    _description = description;
  }

  set amount(double amount) {
    _amount = amount;
  }

  @override
  String toString() {
    return 'Task{_id: $_id, _title: $_title, _description: $_description, _amount: $_amount}';
  }
}
