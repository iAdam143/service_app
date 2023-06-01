import 'package:flutter/material.dart';
import 'package:service_app/view/Auth/login_screen.dart';
import 'package:service_app/view/Auth/signup_screen.dart';

class OnBoardingViewModel {
  void onBackPressed(BuildContext context) {
    // Handle skip action
    Navigator.pop(context);
  }

  void onLoginPressed(BuildContext context) {
    // Handle next action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void onSignUpPressed(BuildContext context) {
    // Handle next action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }
}
