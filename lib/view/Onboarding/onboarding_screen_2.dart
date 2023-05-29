import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/page_indicator.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/onboarding_viewmodel.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({super.key});

  @override
  _OnBoardingScreen2State createState() => _OnBoardingScreen2State();
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> {
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
                'Security and',
                style: heading_3,
              ),
              const Text(
                'Professionalism',
                style: heading_3,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              const Text(
                'All our domestic workers have',
                style: paragraph_1,
              ),
              const Text(
                'transparent background and',
                style: paragraph_1,
              ),
              const Text(
                'are well-trained',
                style: paragraph_1,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              const PageIndicator(
                currentPage: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        buildButtons(context),
      ],
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/images/feature 2@2x 1.png',
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
            onPressed: () => viewModel.onBackPressed(context),
            text: 'Back',
            textColor: myDarkGreyColor,
            buttonColor: mybackbuttonColor,
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
          CustomButton1(
            onPressed: () => viewModel.onNextPressed2(context),
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
