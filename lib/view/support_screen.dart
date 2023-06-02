import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  Set<String> expandedQuestions = {};

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 12.h),
              buildList(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
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

  Widget buildList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: faqs.length,
      itemBuilder: (BuildContext context, int index) {
        final faq = faqs[index];
        final isExpanded = expandedQuestions.contains(faq['question']);
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: mygreyColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          margin: EdgeInsets.only(bottom: 8.h),
          child: ExpansionTile(
            collapsedIconColor: Colors.grey,
            iconColor: myPrimaryColor,
            title: Text(
              faq['question'] ?? '',
              style: heading_6,
            ),
            onExpansionChanged: (expanded) {
              setState(() {
                if (expanded) {
                  expandedQuestions.add(faq['question']!);
                } else {
                  expandedQuestions.remove(faq['question']);
                }
              });
            },
            initiallyExpanded: isExpanded,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  faq['answer'] ?? '',
                  style: paragraph_2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
