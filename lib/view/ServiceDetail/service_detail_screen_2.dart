import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_text_fields.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/service_detail_viewmodel.dart';

class ServiceDetailScreen2 extends StatefulWidget {
  const ServiceDetailScreen2({super.key});

  @override
  _ServiceDetailScreen2State createState() => _ServiceDetailScreen2State();
}

class _ServiceDetailScreen2State extends State<ServiceDetailScreen2> {
  ServiceDetailViewModel viewModel = ServiceDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: buildPaymentOptions(),
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
        'Pay for Booking',
        style: heading_5.copyWith(color: myHeading3Color),
      ),
    );
  }

  Widget buildPaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose a payment method',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 18.0),
        customRadioListTile(
          value: 1,
          groupValue: viewModel.selectedPaymentOption,
          title: 'Credit Card',
          onChanged: (value) {
            setState(() {
              viewModel.selectedPaymentOption = value;
            });
          },
        ),
        const SizedBox(height: 18.0),
        customRadioListTile(
          value: 2,
          groupValue: viewModel.selectedPaymentOption,
          title: 'PayPal',
          onChanged: (value) {
            setState(() {
              viewModel.selectedPaymentOption = value;
            });
          },
        ),
        const SizedBox(height: 18.0),
        customRadioListTile(
          value: 3,
          groupValue: viewModel.selectedPaymentOption,
          title: 'Cash',
          onChanged: (value) {
            setState(() {
              viewModel.selectedPaymentOption = value;
            });
          },
        ),
        const SizedBox(height: 18.0),
        buildCardContainer(),
      ],
    );
  }

  Widget customRadioListTile({
    required int value,
    required int? groupValue,
    required String title,
    required void Function(int) onChanged,
  }) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: groupValue == value ? mygreyColor : mygreyColor,
              ),
              color: groupValue == value ? mygreyColor : mygreyColor,
            ),
            child: groupValue == value
                ? Container(
              width: 16.0,
              height: 16.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: myPrimaryColor,
              ),
            )
                : null,
          ),
          const SizedBox(width: 12.0),
          Text(title),
        ],
      ),
    );
  }

  Widget buildCardContainer() {
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Transform.scale(
                  scale: 0.5,
                  child: CupertinoSwitch(
                    value: viewModel.isSave,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(
                            () {
                          viewModel.isSave = value;
                        },
                      );
                    },
                  ),
                ),
                Text(
                  'Save card information',
                  style: paragraph_3.copyWith(color: myLightPColor),
                )
              ],
            ),
            Text(
              'Card holder’s name',
              style: heading_7.copyWith(color: myHeading3Color),
            ),
            const IconTextField(svgPath: '', hintText: 'Card Name'),
            const SizedBox(height: 12.0),
            Text(
              'Card number',
              style: heading_7.copyWith(color: myHeading3Color),
            ),
            const IconTextField(svgPath: '', hintText: 'Card Number'),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12.0),
                        Text(
                          'Valid Till',
                          style: heading_7.copyWith(color: myHeading3Color),
                        ),
                        const CustomTextField(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12.0),
                        Text(
                          'CVV',
                          style: heading_7.copyWith(color: myHeading3Color),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter card CVV',
                            hintStyle: paragraph_2,
                            counterText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: mygreyColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

