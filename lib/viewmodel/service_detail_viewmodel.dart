import 'package:flutter/material.dart';
import 'package:service_app/utils/custom%20widgets/custom_card.dart';
import 'package:service_app/view/home_screen.dart';
import 'package:service_app/viewmodel/login_viewmodel.dart';

class ServiceDetailViewModel {
  final LoginViewModel viewModel = LoginViewModel();
  int? selectedPaymentOption;
  bool isSave = false;
  void onApplyButtonPressed(BuildContext context) {
    viewModel.onLoginPressed(context);
  }

  Widget buildDWorkerSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildCustomCard('assets/images/Avatar.png', 'Janet', 'Anderson',context),
          buildCustomCard('assets/images/Avatar (1).png', 'Jack', 'Middleton',context),
          buildCustomCard('assets/images/Avatar.png', 'Anna', 'Kimberly',context),
        ],
      ),
    );
  }

  Widget buildCustomCard(String imagePath, String text1, String text2,BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02,left: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.02),
      child: CustomCard(
        imagePath: imagePath,
        text1: text1,
        text2: text2,
      ),
    );
  }

  void onHomePressed(BuildContext context) {
    // Handle next action
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
