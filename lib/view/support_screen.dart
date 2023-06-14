import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';

List<Map<String, String>> faqs = [
  {
    'question': 'What is our process?',
    'answer': 'Answer to Question 1',
  },
  {
    'question': 'How the rate is calculated?',
    'answer':
        'We have a timer for our worker to confirm their start time and their end time with you. ',
  },
  {
    'question': 'Can I get a compensation?',
    'answer': 'Answer to Question 3',
  },
  {
    'question': 'How can I complain?',
    'answer': 'Answer to Question 3',
  },
  {
    'question': 'Where to get my invoice?',
    'answer': 'Answer to Question 3',
  },
  {
    'question': 'Can I change a worker?',
    'answer': 'Answer to Question 3',
  },
];

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                CustomButton5(
                  onPressed: () {
                    // Your onPressed callback implementation
                  },
                  text: 'Chat',
                  svgPath: 'assets/images/support.svg',
                  textColor: myPrimaryColor,
                  buttonColor: myLPurplelColor,
                ),
                const Spacer(),
                CustomButton5(
                  onPressed: () {
                    // Your onPressed callback implementation
                  },
                  text: 'Call',
                  svgPath: 'assets/images/support.svg',
                  textColor: myPinkColor,
                  buttonColor: mySecondaryColor,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            const Text(
              'Frequently asked questions',
              style: heading_6,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: mygreyColor),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ExpansionTile(
                        title: Text(faqs[index]['question'] ?? ''),
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 8.h),
                            child: Text(
                              faqs[index]['answer'] ?? '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: Text(
        'Support',
        style: heading_5.copyWith(color: myHeading3Color),
      ),
    );
  }
}
