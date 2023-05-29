import 'package:flutter/material.dart';
import 'package:service_app/view/Auth/reset_password_1.dart';
import 'package:service_app/view/home_screen.dart';

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


