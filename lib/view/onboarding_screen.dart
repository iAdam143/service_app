import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/page_indicator.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/onboarding_viewmodel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnBoardingViewModel viewModel = OnBoardingViewModel();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          child: PageView(
            controller: _pageController,
            children: [
              buildPage(
                  'assets/images/feature 1@2x 1.png',
                  'Quick and Easy',
                  'Booking',
                  'We offer a 3-step booking\nwhich solves your problem\nquickly and easily',
                  0),
              buildPage(
                  'assets/images/feature 2@2x 1.png',
                  'Security and',
                  'Professionalism',
                  'All our domestic workers have\ntransparent background and\nare well-trained ',
                  1),
              buildPage(
                  'assets/images/feature 3@2x 1.png',
                  'Give your home',
                  'a Wow feeling',
                  'We care about every small\ndetails to satisfy your needs\nwhen you use our service',
                  2),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        buildButtons(context),
      ],
    );
  }

  Widget buildPage(String image, String title1, String title2,
      String description, int currentPage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, fit: BoxFit.cover, height: 200, width: 200),
        SizedBox(height: 12.h),
        Text(title1, style: heading_3),
        Text(title2, style: heading_3),
        SizedBox(height: 5.h),
        Text(description, style: paragraph_1),
        SizedBox(height: 8.h),
        PageIndicator(currentPage: currentPage),
      ],
    );
  }

  Widget buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 12.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentPage == 1)
            CustomButton1(
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                text: 'Back',
                textColor: myDarkGreyColor,
                buttonColor: mybackbuttonColor)
          else if (_currentPage == 2)
            CustomButton1(
                onPressed: () => viewModel.onLoginPressed(context),
                text: 'Login',
                textColor: myDarkGreyColor,
                buttonColor: mybackbuttonColor)
          else
            CustomButton1(
                onPressed: () => _pageController.jumpToPage(2),
                text: 'Skip',
                textColor: myDarkGreyColor,
                buttonColor: mybackbuttonColor),
          SizedBox(height: 12.h),
          if (_currentPage == 2)
            CustomButton1(
                onPressed: () => viewModel.onSignUpPressed(context),
                text: 'SignUp')
          else
            CustomButton1(
                onPressed: () {
                  if (_pageController.page != null &&
                      _pageController.page!.round() <
                          _pageController.position.maxScrollExtent) {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
                text: 'Next'),
        ],
      ),
    );
  }
}
