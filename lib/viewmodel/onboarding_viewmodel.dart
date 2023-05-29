import 'package:flutter/material.dart';
import 'package:service_app/view/Auth/login_screen.dart';
import 'package:service_app/view/Auth/signup_screen.dart';
import 'package:service_app/view/Onboarding/onboarding_screen_2.dart';
import 'package:service_app/view/Onboarding/onboarding_screen_3.dart';

class OnBoardingViewModel {
  void onSkipPressed(BuildContext context) {
    // Handle skip action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen3(),
      ),
    );
  }

  void onNextPressed(BuildContext context) {
    // Handle next action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen2(),
      ),
    );
  }

  void onBackPressed(BuildContext context) {
    // Handle skip action
    Navigator.pop(context);
  }

  void onNextPressed2(BuildContext context) {
    // Handle next action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen3(),
      ),
    );
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


