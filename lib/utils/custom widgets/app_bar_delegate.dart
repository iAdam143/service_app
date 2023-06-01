import 'package:flutter/material.dart';
import '../colors.dart';
import '../textstyles.dart';

class AppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxAppBarHeight = 250.0;

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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi John,',
                      style: heading_2.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Need some help today?',
                      style: paragraph_1.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Image.asset(
                    'assets/images/Hamburger.png',
                    fit: BoxFit.cover,
                    color: const Color.fromRGBO(255, 255, 255, 0.7),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ],
            ),
          ),
          if (showSearchBar)
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Find it here',
                  hintStyle: paragraph_1,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search),
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
