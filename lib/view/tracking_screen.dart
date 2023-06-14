import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import '../utils/colors.dart';
import '../utils/custom widgets/custom_text_fields.dart';
import '../utils/textstyles.dart';
import '../viewmodel/service_detail_viewmodel.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  bool isSave = false;
  final ServiceDetailViewModel viewModel = ServiceDetailViewModel();
  final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildGoogleMap(),
            SizedBox(height: 10.h),
            Row(
              children: [
                const SizedBox(width: 16),
                Transform.scale(
                  scale: 0.5,
                  child: CupertinoSwitch(
                    value: isSave,
                    activeColor: myPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        isSave = value;
                      });
                    },
                  ),
                ),
                Text(
                  'Save as default address',
                  style:
                      paragraph_3.copyWith(color: myLightPColor, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Block',
                        style: heading_7.copyWith(color: myHeading3Color),
                        textAlign: TextAlign.left,
                      ),
                      const SimpleTextField(
                        hintText: 'block',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Room',
                        style: heading_7.copyWith(color: myHeading3Color),
                        textAlign: TextAlign.left,
                      ),
                      const SimpleTextField(
                        hintText: 'room',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'Location’s name',
              style: heading_7.copyWith(color: myHeading3Color),
              textAlign: TextAlign.left,
            ),
            const SimpleTextField(
              hintText: 'location name here',
            ),
            SizedBox(height: 10.h),
            CustomButton6(
              onPressed: () => viewModel.onHomePressed(context),
              text: 'Confirm your address',
              buttonColor: myPrimaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
        'Pick Your Location',
        style: heading_5.copyWith(color: myHeading3Color),
      ),
    );
  }

  Widget buildGoogleMap() {
    return SizedBox(
      height: 170.h,
      width: 150.w,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
