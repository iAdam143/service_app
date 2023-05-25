import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/CustomNavigationBar2.dart';
import 'package:service_app/utils/custom%20widgets/CustomTextFields.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/ToggleButton.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/ItemDetailsViewModel.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final ItemDetailsViewModel IDviewModel = ItemDetailsViewModel();

  ItemDetailsScreen({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverAppBarDelegate(
              expandedHeight: 250,
              image: image,
              title: title,
              subTitle: subTitle,
            ),
            pinned: true,
          ),
          buildSliverList(context),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
  Widget buildSliverList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IDviewModel.buildCustomContainer(
                  'This pack includes cleaning all floors, removing trash.',
                  'Paragraph_2',
                  myLightPColor,
                ),
                const SizedBox(height: 16),
                IDviewModel.buildCustomText(
                    'Working Day', 'Heading_7', myHeading3Color),
                const SizedBox(height: 16),
                DatePickerTextField(),
                const SizedBox(height: 16),
                IDviewModel.buildCustomText(
                    'Start Time', 'Heading_7', myHeading3Color),
                const SizedBox(height: 16),
                TimePickerTextField(),
                const SizedBox(height: 16),
                IDviewModel.buildCustomText(
                    'Location', 'Heading_7', myHeading3Color),
                const SizedBox(height: 16),
                const IconTextField(
                    svgPath: 'assets/images/location.svg',
                    hintText: 'Select location'),
                const SizedBox(height: 16),
                IDviewModel.buildCustomText(
                    'Note', 'Heading_7', myHeading3Color),
                const SizedBox(height: 16),
                const IconTextField(
                  svgPath: '',
                  hintText:
                  'Anything for us to notice?Eg: Bathroom needs harder clean',
                ),
                const SizedBox(height: 16),
                const TextToggleButtonRow(),
                const SizedBox(height: 16),
                IDviewModel.buildDWorkerSection(),
                const SizedBox(height: 16),
                IDviewModel.buildCustomText(
                    'Promotion code', 'Heading_7', myHeading3Color),
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
                      onPressed: () =>
                          IDviewModel.onApplyButtonPressed(context),
                      text: 'Apply',
                      textColor: myPinkColor,
                      buttonColor: mySecondaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool showtext = shrinkOffset < expandedHeight / 4.0;
    return Container(
      color: myLightPurpleColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(showtext)
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      // Handle back button press here
                    },
                  ),

                  Center(
                    child: Text(
                      'Pick a Service',
                      style: Heading_5.copyWith(color: Colors.white),
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
                        style: Heading_3.copyWith(color: Colors.white),
                      ),
                      Text(
                        subTitle,
                        style: Heading_3.copyWith(color: Colors.white),
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
