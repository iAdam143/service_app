import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class ProfileAppBarDelegate extends SliverPersistentHeaderDelegate {
  final File? selectedImage;
  final Function() onImageSelected;

  ProfileAppBarDelegate({
    required this.selectedImage,
    required this.onImageSelected,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final bool showText = shrinkOffset < maxExtent / 4.5;

    return Container(
      color: myPrimaryColor,
      child: Stack(
        children: [
          Positioned(

            bottom: -50.0, // Adjust this value to position the container
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              onTap: onImageSelected,
              child: Center(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: selectedImage != null
                      ? ClipOval(
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : SvgPicture.asset('assets/images/camera.svg'),
                ),
              ),
            ),
          ),
          if (showText)
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Your profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
