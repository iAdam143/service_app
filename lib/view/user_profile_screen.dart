import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import '../utils/colors.dart';
import '../utils/custom widgets/custom_text_fields.dart';
import '../utils/textstyles.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool showText = false;

  void onPressed() {
    setState(() {
      showText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: ProfileAppBarDelegate(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 14.w,
                left: 14.w,
                right: 14.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  const Text(
                    'Your name',
                    style: heading_6,
                  ),
                  const IconTextField(
                    svgPath: 'assets/images/man.svg',
                    hintText: 'your name here',
                  ),
                  SizedBox(height: 12.h),
                  const Text(
                    'Phone number',
                    style: heading_6,
                  ),
                  const IconTextField(
                    svgPath: 'assets/images/phone.svg',
                    hintText: 'your phone number here',
                  ),
                  SizedBox(height: 12.h),
                  const Text(
                    'Email',
                    style: heading_6,
                  ),
                  const IconTextField(
                    svgPath: 'assets/images/mail.svg',
                    hintText: 'your email here',
                  ),
                  SizedBox(height: 12.h),
                  const Text(
                    'ChangePassword',
                    style: heading_6,
                  ),
                  const PasswordTextField(),
                  SizedBox(height: 12.h),
                  if (!showText)
                    CustomButton4(onPressed: onPressed, text: 'Confirm'),
                  if (showText)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Password',
                          style: heading_6,
                        ),
                        const PasswordTextField(),
                        SizedBox(height: 12.h),
                        const Text(
                          'Retype your new password',
                          style: heading_6,
                        ),
                        const PasswordTextField(),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 8.0,
        child: Container(
          decoration: const BoxDecoration(
            //color: myPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton2(onPressed: onPressed, text: 'Save'),
          ),
        ),
      ),
    );
  }
}

class ProfileAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double maxAppBarHeight = 250.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool showtext = shrinkOffset < maxAppBarHeight / 4.5;
    return Container(
      color: myLightPurpleColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showtext)
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Your profile',
                      style: heading_5.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          Center(
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: SvgPicture.asset('assets/images/camera.svg'),
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
