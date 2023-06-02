import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/service_detail_viewmodel.dart';

class ServiceDetailScreen3 extends StatefulWidget {
  const ServiceDetailScreen3({super.key});

  @override
  _ServiceDetailScreen3State createState() => _ServiceDetailScreen3State();
}

class _ServiceDetailScreen3State extends State<ServiceDetailScreen3> {
  ServiceDetailViewModel viewModel = ServiceDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mygreyColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Booking detail',
                            style: heading_6.copyWith(color: myPrimaryColor),
                          ),
                          const Spacer(),
                          const Icon(Icons.edit, color: myPrimaryColor),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Text('Working time',
                          style: heading_7.copyWith(color: myLightPColor)),
                      const SizedBox(height: 12.0),
                      Text('Monday - 22 Mar 2021',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                      const SizedBox(height: 12.0),
                      Text('12:30 PM',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                      const SizedBox(height: 12.0),
                      Text('Location',
                          style: heading_7.copyWith(color: myLightPColor)),
                      const SizedBox(height: 12.0),
                      Text('Room 123, Brooklyn St, Kepler District',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                      const SizedBox(height: 12.0),
                      Text('Note',
                          style: heading_7.copyWith(color: myLightPColor)),
                      const SizedBox(height: 12.0),
                      Text('No note added',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                      const SizedBox(height: 12.0),
                      Text('Domestic worker',
                          style: heading_7.copyWith(color: myLightPColor)),
                      const SizedBox(height: 12.0),
                      Text('Janet Kim',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                      const SizedBox(height: 12.0),
                      Text('Promotion code',
                          style: heading_7.copyWith(color: myLightPColor)),
                      const SizedBox(height: 12.0),
                      Text('No code added',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: mygreyColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Payment detail',
                              style: heading_6.copyWith(color: myPrimaryColor)),
                          const Spacer(),
                          const Icon(Icons.edit, color: myPrimaryColor),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Text('Payment method',
                          style: heading_7.copyWith(color: myLightPColor)),
                      const SizedBox(height: 12.0),
                      Text('Credit card',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                      const SizedBox(height: 12.0),
                      Text('Cost',
                          style: heading_7.copyWith(color: myLightPColor)),
                      const SizedBox(height: 12.0),
                      Text('12.50/1 hour',
                          style: paragraph_2.copyWith(color: myDarkGreyColor)),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
        'Confirm your Booking',
        style: heading_5.copyWith(color: myHeading3Color),
      ),
    );
  }

/*Widget buildCardContainer() {
    if (viewModel.selectedPaymentOption != 1) {
      return const SizedBox.shrink();
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: mygreyColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'John Smith’s card',
              style: heading_6,
            ),
            Text(
              '1233 2343 2432 2243',
              style: paragraph_2,
            ),
            Text(
              'Valid til 12/21',
              style: paragraph_2,
            ),
          ],
        ),
      ),
    );
  }*/
}
