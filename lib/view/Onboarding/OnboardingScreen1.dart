import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/PageIndicator.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/Onboarding/OnboardingScreen2.dart';

class Onboardingscreen1 extends StatefulWidget {
  @override
  _Onboardingscreen1State createState() => _Onboardingscreen1State();
}

class _Onboardingscreen1State extends State<Onboardingscreen1> {
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
                'Quick and Easy',
                style: Heading_3,
              ),
              const Text(
                'Booking',
                style: Heading_3,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              const Text(
                'We offer a 3-step booking',
                style: Paragraph_1,
              ),
              const Text(
                'which solves your problem',
                style: Paragraph_1,
              ),
              const Text(
                'quickly and easily',
                style: Paragraph_1,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
              const PageIndicator(
                currentPage: 0,
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
      'assets/images/feature 1@2x 1.png',
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
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Skip',
            textColor: myDarkGreyColor,
            buttonColor: mybackbuttonColor,
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
          CustomButton1(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Onboardingscreen2(),
                ),
              );
            },
            text: 'Next',
          ),
        ],
      ),
    );
  }
}
