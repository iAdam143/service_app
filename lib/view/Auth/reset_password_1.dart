import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_text_fields.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/reset_password_viewmodel.dart';

class ResetPassword1 extends StatelessWidget {
  ResetPassword1({super.key});

  final ResetPasswordViewModel viewModel = ResetPasswordViewModel();

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
        buildImage(),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
        const Text(
          'Reset your password',
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

  Widget buildImage() {
    return Image.asset(
      'assets/images/Frame.png',
      fit: BoxFit.contain,
      height: 60,
      width: 90,
    );
  }

  Widget buildDescriptionText() {
    return Column(
      children: [
        Text(
          'Please enter your number. We will send a',
          style: paragraph_2.copyWith(color: myDarkGreyColor),
        ),
        Text(
          'code to your phone to reset your password.',
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
              'Phone number',
              style: heading_6,
            ),
            const IconTextField(
              svgPath: 'assets/images/phone.svg',
              hintText: 'your phone number here',
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            buildSendCodeButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildSendCodeButton(BuildContext context) {
    return CustomButton2(
      onPressed: () => viewModel.onSendMyCodePressed(context),
      text: 'Send my code',
    );
  }
}
