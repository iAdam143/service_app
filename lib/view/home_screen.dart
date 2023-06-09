import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/app_bar_delegate.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/custom%20widgets/top_pick_section.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/view/settings_screen.dart';
import 'package:service_app/view/support_screen.dart';
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
      //bottomNavigationBar: const MyBottomNavigationBar(),
      endDrawer: buildDrawer(context),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: mygreyColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: SvgPicture.asset('assets/images/camera.svg'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Janet Anderson',
                        style: heading_4.copyWith(color: myHeading3Color)),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/Home.svg'),
                        Text('123 points',
                            style:
                                paragraph_2.copyWith(color: myHeading3Color)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/man.svg'),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/images/support.svg'),
            title: const Text('Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SupportScreen(),
                ),
              );
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
