import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/app_bar_delegate.dart';
import 'package:service_app/utils/custom%20widgets/custom_navigation_bar.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/top_pick_section.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/user_profile_screen.dart';
import 'package:service_app/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel = HomeViewModel();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: AppBarDelegate(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 8.w,
                left: 8.w,
                right: 8.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  viewModel.buildGrid(context),
                  const SizedBox(height: 16.0),
                  Text(
                    'Top Pick',
                    style: heading_4.copyWith(color: myHeading3Color),
                  ),
                  const SizedBox(height: 16.0),
                  const TopPickRow(),
                  const SizedBox(height: 16.0),
                  viewModel.buildOffersSection(context),
                  const SizedBox(height: 16.0),
                  Text(
                    'Explore',
                    style: heading_4.copyWith(color: myHeading3Color),
                  ),
                  viewModel.buildExploreSection(context),
                  const SizedBox(height: 16.0),
                  CustomButton4(
                    onPressed: () => HomeScreen(),
                    text: 'Need more service?',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      endDrawer: buildDrawer(context),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/man.svg'),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/gift.svg'),
            title: const Text('Promotion'),
            onTap: () {
              // Handle settings tap
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/setting.svg'),
            title: const Text('Settings'),
            onTap: () {
              // Handle settings tap
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/support.svg'),
            title: const Text('Support'),
            onTap: () {
              // Handle settings tap
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/policy.svg'),
            title: const Text('Policy'),
            onTap: () {
              // Handle settings tap
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/log out.svg'),
            title: const Text('Log out'),
            onTap: () {
              // Handle settings tap
            },
          ),
        ],
      ),
    );
  }
}
