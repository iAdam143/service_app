import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            CustomButton1(
              onPressed: () {
                // Perform login logic
              },
              text: 'Login',
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Perform forgot password logic
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}
