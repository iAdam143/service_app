import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/onboarding_viewmodel.dart';
import '../../../utils/custom widgets/page_indicator.dart';

class OnBoardingScreen3 extends StatefulWidget {
  const OnBoardingScreen3({super.key});

  @override
  _OnBoardingScreen3State createState() => _OnBoardingScreen3State();
}

class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  final OnBoardingViewModel viewModel = OnBoardingViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Center(
        child: buildContent(context),
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildImage(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              const Text(
                'Give your home',
                style: heading_3,
              ),
              const Text(
                'a Wow feeling',
                style: heading_3,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              const Text(
                'We care about every small',
                style: paragraph_1,
              ),
              const Text(
                'details to satisfy your needs',
                style: paragraph_1,
              ),
              const Text(
                'when you use our service',
                style: paragraph_1,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              const PageIndicator(
                currentPage: 2,
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
        const Text(
          'Welcome, let’s get started!',
          style: heading_5,
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
        buildButtons(context),
      ],
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/images/feature 3@2x 1.png',
      fit: BoxFit.cover,
      height: 200,
      width: 200,
    );
  }

  Widget buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton1(
            onPressed: () => viewModel.onLoginPressed(context),
            text: 'Login',
            textColor: myDarkGreyColor,
            buttonColor: mybackbuttonColor,
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
          CustomButton1(
            onPressed: () => viewModel.onSignUpPressed(context),
            text: 'Signup',
          ),
        ],
      ),
    );
  }
}
