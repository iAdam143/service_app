import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../view/Bookings/bookings_screen.dart';
import '../../view/home_screen.dart';
import '../colors.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const BookingScreen(),
    //ChatScreen(),
    //NotificationsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: myPrimaryColor,
        unselectedItemColor: myLightGreyColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/booking.svg'),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Chat.svg'),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/noti.svg'),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
