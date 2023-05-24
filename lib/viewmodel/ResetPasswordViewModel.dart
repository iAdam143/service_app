import 'package:flutter/material.dart';
import 'package:service_app/view/Auth/LoginScreen.dart';
import 'package:service_app/view/Auth/VerificationScreen.dart';

class ResetPasswordViewModel {
  void onSendMyCodePressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifyScreen(isResetPassword: true),
      ),
    );
  }

  void onConfirmPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}


