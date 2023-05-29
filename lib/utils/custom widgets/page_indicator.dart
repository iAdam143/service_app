import 'package:flutter/material.dart';
import 'package:service_app/utils/colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final Color activeColor;
  final Color inactiveColor;

  const PageIndicator({super.key,
    required this.currentPage,
    this.activeColor = myPinkColor,
    this.inactiveColor = mygreyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Indicator(
            isActive: i == currentPage,
            activeColor: activeColor,
            inactiveColor: inactiveColor,
          ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  const Indicator({super.key,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 30 : 12,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? activeColor : inactiveColor,
      ),
    );
  }
}
