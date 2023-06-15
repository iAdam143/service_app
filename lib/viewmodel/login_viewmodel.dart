import 'package:flutter/material.dart';
import 'package:service_app/utils/custom%20widgets/custom_navigation_bar.dart';
import 'package:service_app/view/Auth/reset_password_1.dart';

class LoginViewModel {
  void onLoginPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyBottomNavigationBar(),
      ),
    );
  }

  void onResetPasswordPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPassword1(),
      ),
    );
  }
}


