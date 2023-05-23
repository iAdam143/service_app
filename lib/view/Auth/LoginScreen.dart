import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/CustomTextFields.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/Auth/ResetPassword1.dart';
import 'package:service_app/view/Auth/SignUpScreen.dart';
import 'package:service_app/view/Auth/Verify.dart';

class LoginScreen extends StatelessWidget {
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
          style: Heading_3,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        Text(
          'Welcome back!',
          style: Paragraph_2.copyWith(color: myDarkGreyColor),
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
          style: Paragraph_2.copyWith(color: myDarkGreyColor),
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
              style: Heading_6,
            ),
            IconTextField(
              icon: Icons.person,
              hintText: 'your phone number here',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            const Text(
              'Password',
              style: Heading_6,
            ),
            PasswordTextField(),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResetPassword1(),
          ),
        );
      },
      child: const Text(
        'Forgot your password?',
        style: Heading_7,
      ),
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return CustomButton2(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyScreen(),
          ),
        );
      },
      text: 'Login',
    );
  }
}
