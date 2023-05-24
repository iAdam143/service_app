import 'package:flutter/material.dart';
import 'package:service_app/view/Auth/LoginScreen.dart';
import 'package:service_app/view/Auth/ResetPassword2.dart';

class VerificationViewModel {
  void onConfirmPressed(BuildContext context, bool isResetPassword) {
    // Handle next action
    if (isResetPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPassword2(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }
}
