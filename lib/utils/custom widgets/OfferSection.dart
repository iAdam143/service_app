import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/LoginViewModel.dart';

final List<Map<String, dynamic>> _offers = [
  {
    'image': 'assets/images/offerimage.png',
    'text': '50% off',
    'text1': 'Full Pack',
  },
  {
    'image': 'assets/images/offerimage.png',
    'text': 'Buy 1 get 1 free',
    'text1': 'Full Pack',
  },
  {
    'image': 'assets/images/offerimage.png',
    'text': '20% off',
    'text1': 'Full Pack',
  },
];

class OffersSection extends StatelessWidget {
  final LoginViewModel viewModel = LoginViewModel();

  OffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: PageView.builder(
        itemCount: _offers.length,
        itemBuilder: (BuildContext context, int index) {
          return buildOfferItem(context, index);
        },
      ),
    );
  }

  Widget buildOfferItem(BuildContext context, int index) {
    return Stack(
      children: [
        buildImageContainer(context, _offers[index]['image']),
        buildPositionedContent(
            context, _offers[index]['text'], _offers[index]['text1']),
      ],
    );
  }

  Widget buildImageContainer(BuildContext context, String imagePath) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildPositionedContent(
      BuildContext context, String text, String text1) {
    return Positioned(
      top: 0,
      right: 0,
      left: MediaQuery.of(context).size.width * 0.5,
      bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: Heading_5.copyWith(color: Colors.white),
          ),
          Text(
            text,
            style: Heading_2.copyWith(color: Colors.white),
          ),
          CustomButton3(
            onPressed: () => viewModel.onLoginPressed(context),
            text: 'Book Now',
            textColor: myPrimaryColor,
          ),
        ],
      ),
    );
  }
}
