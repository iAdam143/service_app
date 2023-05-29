import 'package:flutter/material.dart';
import 'package:service_app/utils/custom%20widgets/custom_navigation_bar_2.dart';
import 'package:service_app/view/ServiceDetail/service_detail_screen.dart';
import 'package:service_app/view/ServiceDetail/service_detail_screen_2.dart';
import 'package:service_app/view/ServiceDetail/service_detail_screen_3.dart';

class ServiceDetailHome extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const ServiceDetailHome({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  _ServiceDetailHomeState createState() => _ServiceDetailHomeState();
}

class _ServiceDetailHomeState extends State<ServiceDetailHome> {
  int _currentIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      ServiceDetailScreen(
        image: widget.image,
        title: widget.title,
        subTitle: widget.subTitle,
      ),
      const ServiceDetailScreen2(),
      const ServiceDetailScreen3(),
    ];
  }

  void _onNextPressed() {
    setState(() {
      if (_currentIndex < _screens.length - 1) {
        _currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onNextPressed: _onNextPressed,
      ),
    );
  }
}
