import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:service_app/utils/custom%20widgets/profile_bar_delegate.dart';
import '../utils/colors.dart';
import '../utils/custom widgets/custom_buttons.dart';
import '../utils/custom widgets/custom_text_fields.dart';
import '../utils/textstyles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;
  bool showText = false;


  void onPressed() {
    setState(() {
      showText = true;
    });
  }

  Future<void> _handleImageSelected() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: ProfileAppBarDelegate(
              selectedImage: selectedImage,
              onImageSelected: _handleImageSelected,
            ),
            pinned: true,
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
