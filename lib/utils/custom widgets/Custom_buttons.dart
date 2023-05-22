import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';

class CustomButton1 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;

  const CustomButton1({
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white, // Default text color is white
    this.buttonColor = myPrimaryColor, // Default button color is blue
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(145, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    );
  }
}
