import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_text_fields.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/signup_viewmodel.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpViewModel viewModel = SignUpViewModel();

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
          'Sign up',
          style: heading_3,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        buildDescriptionText(),
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

  Widget buildDescriptionText() {
    return Column(
      children: [
        Text(
          'Please enter your details to sign up and',
          style: paragraph_2.copyWith(color: myDarkGreyColor),
        ),
        Text(
          'create an account.',
          style: paragraph_2.copyWith(color: myDarkGreyColor),
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
              'Your name',
              style: heading_6,
            ),
            const IconTextField(
              svgPath: 'assets/images/man.svg',
              hintText: 'your name here',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
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
            const Text(
              'Retype your password',
              style: heading_6,
            ),
            const PasswordTextField(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            buildSignupButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildSignupButton(BuildContext context) {
    return CustomButton2(
      onPressed: () => viewModel.onSignUpPressed(context),
      text: 'Sign up',
    );
  }
}
