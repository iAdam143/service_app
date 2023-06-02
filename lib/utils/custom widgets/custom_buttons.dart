import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/textstyles.dart';

class CustomButton1 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;

  const CustomButton1({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.buttonColor = myPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(145, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: paragraph_2.copyWith(color: textColor),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;

  const CustomButton2({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.buttonColor = myPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(310, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: paragraph_2.copyWith(color: textColor),
      ),
    );
  }
}

class CustomButton3 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;

  const CustomButton3({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.buttonColor = myLPurplelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(100, 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0, // Set elevation to 0
      ),
      child: Text(
        text,
        style: paragraph_2.copyWith(color: textColor),
      ),
    );
  }
}

class CustomButton4 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;

  const CustomButton4({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor = myPrimaryColor,
    this.buttonColor = myLPurplelColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(350, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: textColor,
          ),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: paragraph_2.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}


class CustomButton5 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final String svgPath;

  const CustomButton5({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = Colors.white,
    this.buttonColor = myPrimaryColor,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size(145, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
          ),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: paragraph_2.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}

