import 'package:flutter/material.dart';

class CircleWithStraightCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Top-left corner as a rectangle or square
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(0, size.height);

    // Bottom-right and bottom-left corners as a circle
    final radius = size.width / 2;
    path.arcTo(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -0.5 * 3.14,
      -0.5 * 3.14,
      false,
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CircleWithStraightCorner extends StatelessWidget {
  final double size;
  final Color color;

  const CircleWithStraightCorner({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircleWithStraightCornerClipper(),
      child: Container(
        width: size,
        height: size,
        color: color,
      ),
    );
  }
}
