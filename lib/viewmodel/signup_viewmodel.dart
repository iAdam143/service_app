import 'package:flutter/material.dart';
import 'package:service_app/view/Auth/verification_screen.dart';

class SignUpViewModel {
  void onSignUpPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifyScreen(isResetPassword: false),
      ),
    );
  }
}


