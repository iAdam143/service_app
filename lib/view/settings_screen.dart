import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import '../utils/textstyles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'English';
  final List<String> _languages = [
    'English - American',
    'Spanish',
    'French',
    'German',
  ];

  void onPressed() {
    setState(() {
      showText = true;
    });
  }

  bool showText = false;
  bool _toggle1 = false;
  bool _toggle2 = false;
  bool _toggle3 = false;
  bool _toggle4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: heading_5.copyWith(color: myHeading3Color),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Text(
                'Language',
                style: heading_7.copyWith(color: myLightPColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h),
              child: LanguagePickerDropdown(
                initialValue: Languages.english,
                itemBuilder: (Language language) {
                  return Row(
                    children: <Widget>[
                      Text(language.name),
                      SizedBox(width: 8.w),
                      Flexible(child: Text(language.isoCode)),
                    ],
                  );
                },
                onValuePicked: (Language language) {
                  setState(() {
                    _selectedLanguage = language.name;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h),
              child: Text(
                'Notification',
                style: heading_7.copyWith(color: myLightPColor),
              ),
            ),
            buildToggleRow('Booking activity', _toggle1, (newValue) {
              setState(() {
                _toggle1 = newValue;
              });
            }),
            buildToggleRow('Message', _toggle2, (newValue) {
              setState(() {
                _toggle2 = newValue;
              });
            }),
            buildToggleRow('Promotion', _toggle3, (newValue) {
              setState(() {
                _toggle3 = newValue;
              });
            }),
            buildToggleRow('Email Notification', _toggle4, (newValue) {
              setState(() {
                _toggle4 = newValue;
              });
            }),
          ],
        ),
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

  Widget buildToggleRow(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 6.h),
      child: Row(
        children: [
          Transform.scale(
            scale: 0.5,
            child: CupertinoSwitch(
              value: value,
              activeColor: myPrimaryColor,
              onChanged: onChanged,
            ),
          ),
          Text(
            label,
            style: paragraph_2.copyWith(color: myLightPColor),
          ),
        ],
      ),
    );
  }
}
