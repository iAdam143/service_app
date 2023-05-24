import 'package:flutter/material.dart';
import 'package:service_app/utils/textstyles.dart';

import '../colors.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;

  const CustomCard({
    Key? key,
    required this.imagePath,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerHeight = MediaQuery.of(context).size.height * 0.2;
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: mygreyColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: containerHeight,
      padding: EdgeInsets.all(22.0),
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            text1,
            style: Heading_6,
          ),
          Text(
            text2,
            style: Heading_6,
          ),
        ],
      ),
    );
  }
}
