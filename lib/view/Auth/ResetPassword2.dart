import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/CustomTextFields.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/Auth/Verify.dart';

class ResetPassword2 extends StatelessWidget {
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
          'Create new password',
          style: Heading_3,
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
    return Text(
      'Please set a new and strong password',
      style: Paragraph_2.copyWith(color: myDarkGreyColor),
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
              'Password',
              style: Heading_6,
            ),
            PasswordTextField(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            const Text(
              'Retype your password',
              style: Heading_6,
            ),
            PasswordTextField(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildConfirmButton(BuildContext context) {
    return CustomButton2(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyScreen(),
          ),
        );
      },
      text: 'Confirm',
    );
  }
}