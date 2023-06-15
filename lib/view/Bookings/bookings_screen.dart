import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/textstyles.dart';
import 'active_bookings.dart';
import 'cancelled_bookings.dart';
import 'completed_bookings.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavigationButton('Active', 0),
                _buildNavigationButton('Completed', 1),
                _buildNavigationButton('Canceled', 2),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: const [
                ActivePage(),
                CompletedPage(),
                CanceledPage(),
              ],
            ),
          ),
        ],
      ),
      //bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  Widget _buildNavigationButton(String title, int pageIndex) {
    return TextButton(
      onPressed: () {
        setState(() {
          _currentPageIndex = pageIndex;
          _pageController.animateToPage(
            pageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          color: _currentPageIndex == pageIndex ? Colors.blue : Colors.black,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
        'Bookings',
        style: heading_5.copyWith(color: myHeading3Color),
      ),
    );
  }
}
