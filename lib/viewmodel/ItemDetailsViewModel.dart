import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/CustomCard.dart';
import 'package:service_app/viewmodel/LoginViewModel.dart';

class ItemDetailsViewModel {
  final LoginViewModel viewModel = LoginViewModel();
  void onApplyButtonPressed(BuildContext context) {
    // Perform the desired action when the Apply button is pressed
    viewModel.onLoginPressed(context);
  }
  Widget buildCustomContainer(String text, String textStyle, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: mygreyColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: TextStyle(color: color, fontSize: getTextSize(textStyle)),
        ),
      ),
    );
  }

  double getTextSize(String textStyle) {
    switch (textStyle) {
      case 'Paragraph_2':
        return 16.0;
      default:
        return 0.0;
    }
  }

  Widget buildCustomText(String text, String textStyle, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: getTextSize(textStyle)),
    );
  }

  Widget buildDWorkerSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildCustomCard('assets/images/Avatar.png', 'Janet', 'Anderson'),
          buildCustomCard('assets/images/Avatar (1).png', 'Jack', 'Middleton'),
          buildCustomCard('assets/images/Avatar.png', 'Anna', 'Kimberly'),
        ],
      ),
    );
  }

  Widget buildCustomCard(String imagePath, String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 16.0),
      child: CustomCard(
        imagePath: imagePath,
        text1: text1,
        text2: text2,
      ),
    );
  }
}
