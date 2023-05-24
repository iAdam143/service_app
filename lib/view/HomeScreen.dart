import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/AppBarDelegate.dart';
import 'package:service_app/utils/custom%20widgets/CustomCard.dart';
import 'package:service_app/utils/custom%20widgets/CustomNavigationBar.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/HomeGrid.dart';
import 'package:service_app/utils/custom%20widgets/TopPickSection.dart';
import 'package:service_app/utils/textstyles.dart';

import '../utils/custom widgets/OfferSection.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: AppBarDelegate(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildGrid(context),
                  SizedBox(height: 16.0),
                  Text(
                    'Top Pick',
                    style: Heading_4.copyWith(color: myHeading3Color),
                  ),
                  SizedBox(height: 16.0),
                  const TopPickRow(),
                  SizedBox(height: 16.0),
                  OffersSection(),
                  SizedBox(height: 16.0),
                  Text(
                    'Explore',
                    style: Heading_4.copyWith(color: myHeading3Color),
                  ),
                  BuildExploreSection(context),
                  SizedBox(height: 16.0),
                  CustomButton4(onPressed: ()=>HomeScreen(), text: 'Need more service?')
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  Widget BuildGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double screenWidth = constraints.maxWidth;
        int crossAxisCount = screenWidth < 700 ? 3 : 6;

        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: const [
            GridItem(
              image: 'assets/images/home.png',
              text: 'All',
            ),
            GridItem(
              image: 'assets/images/clean.png',
              text: 'Clean',
            ),
            GridItem(
              image: 'assets/images/repair.png',
              text: 'Repair',
            ),
            GridItem(
              image: 'assets/images/pest.png',
              text: 'Pest',
            ),
            GridItem(
              image: 'assets/images/food.png',
              text: 'Food',
            ),
            GridItem(
              image: 'assets/images/laundry.png',
              text: 'Laundry',
            ),
          ],
        );
      },
    );
  }

  Widget BuildExploreSection(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.0, top: 16.0),
            child: CustomCard(
              imagePath: 'assets/images/Rectangle 17.png',
              text1: 'Bathroom',
              text2: 'Cleaning',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0, top: 16.0),
            child: CustomCard(
              imagePath: 'assets/images/Rectangle 17 (1).png',
              text1: 'Grocery',
              text2: 'Shopping',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0, top: 16.0),
            child: CustomCard(
              imagePath: 'assets/images/image3.jpg',
              text1: 'Item 3',
              text2: 'Bathroom',
            ),
          ),
        ],
      ),
    );
  }
}
