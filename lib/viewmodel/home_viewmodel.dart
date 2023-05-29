import 'package:flutter/material.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/utils/textstyles.dart';
import 'package:service_app/viewmodel/login_viewmodel.dart';
import '../utils/colors.dart';
import '../utils/custom widgets/custom_card.dart';
import '../utils/custom widgets/home_grid.dart';
import '../view/ServiceDetail/service_detail_home.dart';

class HomeViewModel {
  final LoginViewModel viewModel = LoginViewModel();
  final List<Map<String, dynamic>> offers = [
    {
      'image': 'assets/images/offerimage.png',
      'text': '50% off',
      'text1': 'Full Pack',
    },
    {
      'image': 'assets/images/offerimage.png',
      'text': 'Buy 1 get 1 free',
      'text1': 'Full Pack',
    },
    {
      'image': 'assets/images/offerimage.png',
      'text': '20% off',
      'text1': 'Full Pack',
    },
  ];

  Widget buildGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double screenWidth = constraints.maxWidth;
        int crossAxisCount = screenWidth < 700 ? 3 : 6;

        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: const [
            GridItem(
              image: "assets/images/home2.svg",
              text: 'All',
            ),
            GridItem(
              image: 'assets/images/clean.svg',
              text: 'Clean',
            ),
            GridItem(
              image: 'assets/images/repair.svg',
              text: 'Repair',
            ),
            GridItem(
              image: 'assets/images/pest.svg',
              text: 'Pest',
            ),
            GridItem(
              image: 'assets/images/food.svg',
              text: 'Food',
            ),
            GridItem(
              image: 'assets/images/laundry.svg',
              text: 'Laundry',
            ),
          ],
        );
      },
    );
  }

  Widget buildExploreSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02, top: MediaQuery.of(context).size.width * 0.02),
            child: const CustomCard(
              imagePath: 'assets/images/Rectangle 17.png',
              text1: 'Bathroom',
              text2: 'Cleaning',
              showCheckbox: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0, top: 16.0),
            child: CustomCard(
              imagePath: 'assets/images/Rectangle 17 (1).png',
              text1: 'Grocery',
              text2: 'Shopping',
              showCheckbox: false,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0, top: 16.0),
            child: CustomCard(
              imagePath: 'assets/images/Rectangle 17.png',
              text1: 'Item 3',
              text2: 'Bathroom',
              showCheckbox: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOffersSection(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: PageView.builder(
        itemCount: offers.length,
        itemBuilder: (BuildContext context, int index) {
          return buildOfferItem(context, index);
        },
      ),
    );
  }

  Widget buildOfferItem(BuildContext context, int index) {
    return Stack(
      children: [
        buildImageContainer(context, offers[index]['image']),
        buildPositionedContent(
            context, offers[index]['text'], offers[index]['text1']),
      ],
    );
  }

  Widget buildImageContainer(BuildContext context, String imagePath) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildPositionedContent(
      BuildContext context, String text, String text1) {
    return Positioned(
      top: 0,
      right: 0,
      left: MediaQuery.of(context).size.width * 0.5,
      bottom: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: heading_5.copyWith(color: Colors.white),
          ),
          Text(
            text,
            style: heading_2.copyWith(color: Colors.white),
          ),
          CustomButton3(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServiceDetailHome(
                    image: 'assets/images/offerimage.png',
                    title: 'Full Pack',
                    subTitle: '',
                  ),
                ),
              );
            },
            text: 'Book Now',
            textColor: myPrimaryColor,
          ),
        ],
      ),
    );
  }
}
