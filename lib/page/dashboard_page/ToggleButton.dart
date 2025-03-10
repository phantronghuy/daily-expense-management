import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  String textBtn1;
  String textBtn2;
  bool currentStatusBtn1;
  ToggleButton({required this.textBtn1, required this.textBtn2, required this.currentStatusBtn1, super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return _toggleButton(widget.textBtn1, widget.textBtn2, widget.currentStatusBtn1);
  }

  void _toggleStatusOnClick() {
    setState(() {
      widget.currentStatusBtn1 = !widget.currentStatusBtn1;
    });
  }

  Widget _toggleButton(String textBtn1, String textBtn2, bool currentStatusBtn1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => _toggleStatusOnClick(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: currentStatusBtn1 ? Colors.white : MyColors.grayColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              textBtn1,
              style: TextStyle(
                color: currentStatusBtn1 ? const Color(MyColors.purpleColor) : const Color(MyColors.blackColor),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        InkWell(
          onTap: () => _toggleStatusOnClick(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: !currentStatusBtn1 ? Colors.white : MyColors.grayColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              textBtn2,
              style: TextStyle(
                color: !currentStatusBtn1 ? const Color(MyColors.purpleColor) : const Color(MyColors.blackColor),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}