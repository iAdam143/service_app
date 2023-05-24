import 'package:flutter/material.dart';
import 'package:service_app/view/Auth/ResetPassword1.dart';
import 'package:service_app/view/HomeScreen.dart';

class LoginViewModel {
  void onLoginPressed(BuildContext context) {
    // Handle next action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  void onResetPasswordPressed(BuildContext context) {
    // Handle next action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPassword1(),
      ),
    );
  }
}


