import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/textstyles.dart';

class TopPickRow extends StatelessWidget {
  const TopPickRow({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = screenWidth > 700 ? 420 : 250;
    double containerHeight2 = screenWidth > 700 ? 200 : 115;
    return Row(
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: mySecondaryColor,
            ),
            height: containerHeight,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Expanded(
                  child: Image(
                    image: AssetImage('assets/images/Rectangle 15.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Full house',
                  style: Heading_5.copyWith(color: myLightPColor),
                ),
                Text(
                  'Cleaning',
                  style: Heading_5.copyWith(color: myLightPColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: myLightTealColor,
                ),
                height: containerHeight2,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Expanded(
                      child: Image(
                        image: AssetImage('assets/images/Rectangle 16.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Plumbing',
                      style: Heading_6.copyWith(color: myLightPColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: mygreyColor,
                ),
                height: containerHeight2,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Expanded(
                      child: Image(
                        image: AssetImage('assets/images/Rectangle 16 (1).png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Cooking',
                      style: Heading_6.copyWith(color: myLightPColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
