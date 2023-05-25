import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/textstyles.dart';

import '../colors.dart';

class GridItem extends StatelessWidget {
  final String image;
  final String text;

  const GridItem({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: mygreyColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            width: 25,
            height: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8.0),
          Text(text,style: Heading_7.copyWith(color: myLightGreyColor)),
        ],
      ),
    );
  }
}