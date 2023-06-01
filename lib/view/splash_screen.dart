import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/onboarding_screen.dart';

import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/splashlogobackground.svg',
                    fit: BoxFit.cover,
                  ),
                  SvgPicture.asset(
                    'assets/images/splashlogo.svg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              const Column(
                children: [
                  Text(
                    'Service',
                    style: heading_1,
                  ),
                  Text(
                    'App',
                    style: heading_1,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
