import 'package:daily_expense_management/obj/TaskCard.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCardWidget extends StatelessWidget {
  TaskCard taskCard;
  TaskCardWidget(this.taskCard, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.blue.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.blue.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Icon Row
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.shopping_bag, color: Colors.blueAccent),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskCard.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    taskCard.description,
                    style: TextStyle(fontSize: 14, color: Colors.blue.shade900),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 15),

          // Progress Bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount
              Text(
                "\$" + formatAmount(taskCard.currentAmount),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // Progress Bar with Circular Handle
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // Background bar
                    Container(
                      height: 32,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(MyColors.primaryColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // Filled bar
                    Container(
                      height: 32,
                      width:
                          MediaQuery.of(context).size.width * 0.4, // 40% filled
                      decoration: BoxDecoration(
                        color: const Color(MyColors.secondaryColor),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // Circular handle
                    Positioned(
                      left:
                          MediaQuery.of(context).size.width * 0.34, // Near 40%
                      child: Container(
                        width: 25,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: const Center(
                          child:
                              Icon(Icons.pause, size: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Spent amount and total budget
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Spent \$${formatAmount(taskCard.currentAmount)} from ",
                    style: const TextStyle(
                        fontSize: 14, color: Color(MyColors.blackColor)),
                    children: [
                      TextSpan(
                        text: "\$${formatAmount(taskCard.amount)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatAmount(double amount) {
    final formatter = NumberFormat("###,###,###", "en_US");
    return formatter.format(amount).replaceAll(",", ".");
  }
}
