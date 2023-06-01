import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';

import '../../viewmodel/login_viewmodel.dart';
import '../colors.dart';

class CustomCard extends StatefulWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final bool showCheckbox;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.text1,
    required this.text2,
    this.showCheckbox = true, // Set a default value for the checkbox parameter
  });

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isChecked = false; // Add a variable to track the checkbox state
  final LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    final containerHeight = 90.h;

    Widget buildCheckbox() {
      if (widget.showCheckbox) {
        return Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              setState(() {
                isChecked = !isChecked; // Toggle the checkbox state
              });
            },
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: isChecked ? myPrimaryColor : mygreyColor,
                border: Border.all(
                  color: isChecked ? myPrimaryColor : mygreyColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15.0,
                    )
                  : null,
            ),
          ),
        );
      } else {
        return const SizedBox
            .shrink(); // If showCheckbox is false, return an empty SizedBox
      }
    }

    Widget buildAdditionalContent() {
      if (widget.showCheckbox) {
        return Column(
          children: [
            const SizedBox(height: 8.0),
            const Text(
              '5.0⭐',
              style: paragraph_3,
            ),
            const SizedBox(height: 8.0),
            CustomButton3(
              onPressed: () => viewModel.onLoginPressed(context),
              text: 'View',
              buttonColor: myLPurplelColor,
              textColor: myPrimaryColor,
            )
          ],
        );
      } else {
        return const SizedBox
            .shrink(); // If showCheckbox is false, return an empty SizedBox
      }
    }

    return Container(
      width: 60.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: mygreyColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: containerHeight,
      child: Stack(
        children: [
          buildCheckbox(), // Call the buildCheckbox method
          Padding(
            padding: const EdgeInsets.all(20), // Add space below the checkbox
            child: Column(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage(widget.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.text1,
                  style: heading_6,
                ),
                Text(
                  widget.text2,
                  style: heading_6,
                ),
                buildAdditionalContent(),
                // Call the buildAdditionalContent method
              ],
            ),
          ),
        ],
      ),
    );
  }
}
