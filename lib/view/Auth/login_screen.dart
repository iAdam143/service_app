import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_text_fields.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/Auth/signup_screen.dart';
import 'package:service_app/viewmodel/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel viewModel = LoginViewModel();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: buildContent(context),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildLogo(),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        const Text(
          'Login',
          style: heading_3,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        Text(
          'Welcome back!',
          style: paragraph_2.copyWith(color: myDarkGreyColor),
        ),
        buildSignupText(context),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: buildContainer(context),
        ),
      ],
    );
  }

  Widget buildLogo() {
    return Image.asset(
      'assets/images/logo_icon.png',
      fit: BoxFit.contain,
      height: 60,
      width: 90,
    );
  }

  Widget buildSignupText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: paragraph_2.copyWith(color: myDarkGreyColor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          child: const Text(
            'Sign up',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'SFPro',
              color: myPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: mygreyColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phone number',
              style: heading_6,
            ),
            const IconTextField(
              svgPath: 'assets/images/phone.svg',
              hintText: 'your phone number here',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            const Text(
              'Password',
              style: heading_6,
            ),
            const PasswordTextField(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            buildForgotPasswordText(context),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildForgotPasswordText(BuildContext context) {
    return GestureDetector(
      onTap: () =>viewModel.onResetPasswordPressed(context),
      child: const Text(
        'Forgot your password?',
        style: heading_7,
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return CustomButton2(
      onPressed: () =>viewModel.onLoginPressed(context),
      text: 'Login',
    );
  }
}
