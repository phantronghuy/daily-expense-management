import 'package:daily_expense_management/page/welcome_page/WelcomePage.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:daily_expense_management/res/images/MyImagesPath.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';


void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WelcomePage(),
    );
  }
}
