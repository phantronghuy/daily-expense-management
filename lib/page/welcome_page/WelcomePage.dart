import 'package:daily_expense_management/page/MainScreen.dart';
import 'package:daily_expense_management/page/dashboard_page/DashBoardPage.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:daily_expense_management/res/images/MyImagesPath.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  textWidget("Expense with", MyColors.blackColor),
                  textWidget("ExpenseMng", MyColors.secondaryColor),
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
                      onPressed: () => _naviGator(context),
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
      );
  }

  void _naviGator(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
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