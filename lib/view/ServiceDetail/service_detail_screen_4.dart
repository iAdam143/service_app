import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/service_detail_viewmodel.dart';

class ServiceDetailScreen4 extends StatefulWidget {
  const ServiceDetailScreen4({super.key});

  @override
  _ServiceDetailScreen4State createState() => _ServiceDetailScreen4State();
}

class _ServiceDetailScreen4State extends State<ServiceDetailScreen4> {
  final ServiceDetailViewModel viewModel = ServiceDetailViewModel();

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
    return Center(
      // Wrap the Column with Center widget
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImage(),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
          const Text(
            'Success!',
            style: heading_3,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          const Text(
            'Ready to say Wow?',
            style: paragraph_1,
          ),
          const SizedBox(height: 8.0),
          const Text(
            'Now you can track your booking or',
            style: paragraph_1,
          ),
          const Text(
            'go back to home screen',
            style: paragraph_1,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          buildButtons(context),
        ],
      ),
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/images/finish@4x 1.png',
      fit: BoxFit.cover,
      height: 200,
      width: 200,
    );
  }

  Widget buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * 0.2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton1(
            onPressed: () => viewModel.onHomePressed(context),
            text: 'Track',
            textColor: myPrimaryColor,
            buttonColor: myLPurplelColor,
          ),
          SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
          CustomButton1(
            onPressed: () => viewModel.onHomePressed(context),
            text: 'Home',
            textColor: myPinkColor,
            buttonColor: mySecondaryColor,
          ),
        ],
      ),
    );
  }
}
