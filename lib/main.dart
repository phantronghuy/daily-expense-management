import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:daily_expense_management/res/images/MyImagesPath.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              MyImagesPath.teamWorkImg,
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget("Manage", MyColors.blackColor),
                  textWidget("your", MyColors.blackColor),
                  textWidget("Task with", MyColors.blackColor),
                  textWidget("DayTask", MyColors.secondaryColor),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(MyColors.secondaryColor),
                        foregroundColor: const Color(MyColors.blackColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Let's Start",
                        style: TextStyle(
                          fontSize: 18,
                          color:  Color(MyColors.blackColor),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textWidget(String text, int color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: Color(color),
      ),
    );
  }
}
