import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/AppBarDelegate.dart';
import 'package:service_app/utils/custom%20widgets/CustomNavigationBar.dart';
import 'package:service_app/utils/custom%20widgets/Custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/TopPickSection.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/HomeViewModel.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel = HomeViewModel();

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
                  viewModel.buildGrid(context),
                  SizedBox(height: 16.0),
                  Text(
                    'Top Pick',
                    style: Heading_4.copyWith(color: myHeading3Color),
                  ),
                  SizedBox(height: 16.0),
                  const TopPickRow(),
                  SizedBox(height: 16.0),
                  viewModel.buildOffersSection(context),
                  SizedBox(height: 16.0),
                  Text(
                    'Explore',
                    style: Heading_4.copyWith(color: myHeading3Color),
                  ),
                  viewModel.buildExploreSection(context),
                  SizedBox(height: 16.0),
                  CustomButton4(
                      onPressed: () => HomeScreen(), text: 'Need more service?')
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
