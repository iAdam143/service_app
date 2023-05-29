import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';
import 'package:service_app/utils/custom%20widgets/custom_buttons.dart';
import 'package:service_app/view/ServiceDetail/service_detail_screen_4.dart';
import 'package:service_app/viewmodel/login_viewmodel.dart'; // Import the new screen

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final VoidCallback onNextPressed;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final LoginViewModel viewModel = LoginViewModel();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    widget.onItemTapped(index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _onNextPressed() {
    if (widget.currentIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const ServiceDetailScreen4()),
      );
    } else {
      widget.onNextPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPageIndicator(0),
              _buildPageIndicator(1),
              _buildPageIndicator(2),
              CustomButton1(
                onPressed: _onNextPressed, // Update the onPressed callback
                text: widget.currentIndex == 2 ? 'Book Now' : 'Next',
                buttonColor: myPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(int index) {
    final isActive = index <= widget.currentIndex;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? myLPinkColor : mySecondaryColor,
        ),
      ),
    );
  }
}
