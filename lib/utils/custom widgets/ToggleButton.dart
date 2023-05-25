import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';

import '../textstyles.dart';

class TextToggleButtonRow extends StatefulWidget {
  const TextToggleButtonRow({super.key});

  @override
  _TextToggleButtonRowState createState() => _TextToggleButtonRowState();
}

class _TextToggleButtonRowState extends State<TextToggleButtonRow> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Domestic worker',
          style: Heading_7.copyWith(color: myLightPColor),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.5,
          child: CupertinoSwitch(
            value: isFavourite,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                isFavourite = value;
              });
            },
          ),
        ),
        Text('My Favourite', style: Paragraph_3.copyWith(color: myLightPColor,fontSize: 14)),
      ],
    );
  }
}
