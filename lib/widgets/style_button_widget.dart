// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class StyleButtonWidget extends StatelessWidget {
  final String buttonName;
  final onTap;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Color buttonTextColor;

  const StyleButtonWidget({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(color: buttonTextColor),
        )),
      ),
    );
  }
}
