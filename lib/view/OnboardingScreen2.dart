import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/PageIndicator.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/OnboardingScreen3.dart';

class Onboardingscreen2 extends StatefulWidget {
  @override
  _Onboardingscreen2State createState() => _Onboardingscreen2State();
}

class _Onboardingscreen2State extends State<Onboardingscreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/feature 2@2x 1.png',
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
                  const Text(
                    'Security and',
                    style: Heading_3,
                  ),
                  const Text(
                    'Professionalism',
                    style: Heading_3,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                  const Text(
                    'All our domestic workers have',
                    style: Paragraph_1,
                  ),
                  const Text(
                    'transparent background and',
                    style: Paragraph_1,
                  ),
                  const Text(
                    'are well-trained',
                    style: Paragraph_1,
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  const PageIndicator(
                    currentPage: 1,
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton1(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Back',
                    textColor: myParagraph1Color,
                    buttonColor: mybackbuttonColor,
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
                  CustomButton1(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboardingscreen3(),
                        ),
                      );
                    },
                    text: 'Next',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
