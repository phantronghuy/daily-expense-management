import 'package:daily_expense_management/obj/Task.dart';
import 'package:daily_expense_management/obj/TaskCard.dart';
import 'package:daily_expense_management/obj/enum/TasksCategories.dart';
import 'package:daily_expense_management/obj/enum/TypeOfExpense.dart';
import 'package:daily_expense_management/obj/manager/TaskCardManager.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:flutter/material.dart';

class CreateTaskScreen extends StatefulWidget {
  bool isExpense;
  CreateTaskScreen({required this.isExpense});
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedTask;
  late TaskCard taskCard;

  void _onTaskSelected(String? value) {
    setState(() {
      _selectedTask = value;
    });
  }

  void _onSubmitTask() {
    if (_selectedTask == null ||
        _amountController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Please select a task and enter an amount and enter description")),
      );
    } else {
      Task task = Task(_selectedTask!, _descriptionController.text,
          double.parse(_amountController.text));
      taskCard = TaskCard.withCard(task, 0.0,
          (widget.isExpense) ? TypeOfExpense.Expense : TypeOfExpense.Income);
      TaskCardManager taskCardManager = TaskCardManager();
      taskCardManager.addTaskCard(taskCard);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(MyColors.primaryColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Type",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(widget.isExpense ? "Expense" : "Income",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              const Text("Select Task",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: _selectedTask,
                hint: const Text("Choose a task"),
                items: TaskCategories.categories.keys
                    .map((String key) => DropdownMenuItem<String>(
                          value: key,
                          child: Text(key),
                        ))
                    .toList(),
                onChanged: _onTaskSelected,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const Text("Description",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                maxLines: 3, // Allows multiple lines
                decoration: InputDecoration(
                  labelText: "Description",
                  hintText: "Enter task details...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded edges
                  ),
                  filled: true,
                  fillColor: Colors
                      .grey[200], // Light background for better visibility
                ),
              ),
              const SizedBox(height: 16),
              const Text("Amount",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter amount",
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _onSubmitTask,
                  child: const Text("Create Task"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
