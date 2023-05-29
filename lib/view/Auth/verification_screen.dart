import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_text_fields.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/verification_viewmodel.dart';

class VerifyScreen extends StatelessWidget {
  final bool isResetPassword;
  final VerificationViewModel viewModel = VerificationViewModel();

  VerifyScreen({super.key, required this.isResetPassword});

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
          'Verify',
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
      'assets/images/phone.png',
      fit: BoxFit.contain,
      height: 60,
      width: 90,
    );
  }

  Widget buildDescriptionText() {
    return Column(
      children: [
        Text(
          'Please enter the verification code sent to',
          style: paragraph_2.copyWith(color: myDarkGreyColor),
        ),
        Text(
          'your phone number',
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
              'Your code',
              style: heading_6,
            ),
            const FourDigitTextField(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
            buildResendCodeRow(),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildResendCodeRow() {
    return Row(
      children: [
        GestureDetector(
          //onTap: ()=>,
          child: const Text(
            'Resend your code',
            style: heading_7,
          ),
        ),
        const Spacer(),
        Text(
          'Expired after 23s',
          style: paragraph_4.copyWith(color: myDarkGreyColor),
        ),
      ],
    );
  }

  Widget buildConfirmButton(BuildContext context) {
    return CustomButton2(
      onPressed: () => viewModel.onConfirmPressed(context, isResetPassword),
      text: 'Confirm',
    );
  }
}
