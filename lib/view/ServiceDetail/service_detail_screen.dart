import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_text_fields.dart';
import 'package:service_app/utils/custom%20widgets/toggle_button.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/service_detail_viewmodel.dart';

import '../../utils/custom widgets/custom_buttons.dart';

class ServiceDetailScreen extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const ServiceDetailScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  DateTime? _selectedDate;
  final ServiceDetailViewModel idViewModel = ServiceDetailViewModel();

  void handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverPersistentHeader(context),
          buildSliverList(context),
        ],
      ),
    );
  }

  Widget buildSliverPersistentHeader(BuildContext context) {
    return SliverPersistentHeader(
      delegate: MySliverAppBarDelegate(
        expandedHeight: 250,
        image: widget.image,
        title: widget.title,
        subTitle: widget.subTitle,
      ),
      pinned: true,
    );
  }

  Widget buildSliverList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildCustomContainer(
                'This pack includes cleaning all floors, removing trash.',
                'Paragraph_2',
                myLightPColor,
              ),
              const SizedBox(height: 16),
              buildHeadingWithColor('Working Day', myHeading3Color),
              const SizedBox(height: 16),
              DatePickerTextField(
                onDateSelected: handleDateSelected,
              ),
              const SizedBox(height: 16),
              buildHeadingWithColor('Start Time', myHeading3Color),
              const SizedBox(height: 16),
              const TimePickerTextField(),
              const SizedBox(height: 16),
              buildHeadingWithColor('Location', myHeading3Color),
              const SizedBox(height: 16),
              const IconTextField(
                svgPath: 'assets/images/location.svg',
                hintText: 'Select location',
              ),
              const SizedBox(height: 16),
              buildHeadingWithColor('Note', myHeading3Color),
              const SizedBox(height: 16),
              const IconTextField(
                svgPath: '',
                hintText:
                    'Anything for us to notice?Eg: Bathroom needs harder clean',
              ),
              const SizedBox(height: 16),
              const TextToggleButtonRow(),
              const SizedBox(height: 16),
              idViewModel.buildDWorkerSection(context),
              const SizedBox(height: 16),
              buildHeadingWithColor('Promotion code', myHeading3Color),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: IconTextField(
                      svgPath: 'assets/images/gift.svg',
                      hintText: 'Your code here',
                    ),
                  ),
                  const SizedBox(width: 16),
                  CustomButton1(
                    onPressed: () => idViewModel.onApplyButtonPressed(context),
                    text: 'Apply',
                    textColor: myPinkColor,
                    buttonColor: mySecondaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildHeadingWithColor(String text, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: heading_7.copyWith(color: color),
        textAlign: TextAlign.left,
      ),
    );
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
          style: paragraph_2.copyWith(color: color),
        ),
      ),
    );
  }
}

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String image;
  final String title;
  final String subTitle;

  MySliverAppBarDelegate({
    required this.expandedHeight,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final bool showtext = shrinkOffset < expandedHeight / 4.0;
    return Container(
      color: myLightPurpleColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showtext)
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Center(
                    child: Text(
                      'Pick a Service',
                      style: heading_5.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: heading_3.copyWith(color: Colors.white),
                      ),
                      Text(
                        subTitle,
                        style: heading_3.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
