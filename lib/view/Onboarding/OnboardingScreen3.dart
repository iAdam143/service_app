import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/Auth/LoginScreen.dart';
import 'package:service_app/view/Auth/SignUpScreen.dart';
import '../../../utils/custom widgets/PageIndicator.dart';

class Onboardingscreen3 extends StatefulWidget {
  @override
  _Onboardingscreen3State createState() => _Onboardingscreen3State();
}

class _Onboardingscreen3State extends State<Onboardingscreen3> {
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
                style: Heading_3,
              ),
              const Text(
                'a Wow feeling',
                style: Heading_3,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
              const Text(
                'We care about every small',
                style: Paragraph_1,
              ),
              const Text(
                'details to satisfy your needs',
                style: Paragraph_1,
              ),
              const Text(
                'when you use our service',
                style: Paragraph_1,
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
          style: Heading_5,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            text: 'Login',
            textColor: myDarkGreyColor,
            buttonColor: mybackbuttonColor,
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
          CustomButton1(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
            text: 'Signup',
          ),
        ],
      ),
    );
  }
}
