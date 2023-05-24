import 'package:flutter/material.dart';

import '../colors.dart';
import '../textstyles.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxAppBarHeight = 250.0; // Maximum height of the app bar

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool showSearchBar = shrinkOffset < maxAppBarHeight / 3.5;

    return Container(
      color: myLightPurpleColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi John,',
                      style: Heading_2.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Need some help today?',
                      style: Paragraph_1.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/images/Hamburger.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          if (showSearchBar)
            Padding(
              padding: EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Find it here',
                  hintStyle: Paragraph_1,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search), // Add the search icon here
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxAppBarHeight;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}