import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const radius = 20.0;

    path.moveTo(radius, 0);
    path.lineTo(size.width * 0.4 - radius, 0);
    path.arcToPoint(Offset(size.width * 0.4, radius),
        radius: const Radius.circular(radius));
    path.lineTo(size.width * 0.4, size.height * .1 - radius);

    path.arcToPoint(
      Offset(size.width * 0.4 + radius, size.height * .1),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width * .63 - radius, size.height * .1);
    path.arcToPoint(
      Offset(size.width * .63, size.height * .1 - radius),
      radius: const Radius.circular(radius),
      clockwise: false,
    );

    path.lineTo(size.width * .63, radius);
    path.arcToPoint(
      Offset(size.width * .63 + radius, 0),
      radius: const Radius.circular(radius),
    );
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius),
        radius: const Radius.circular(radius));
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height),
        radius: const Radius.circular(radius));
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height - radius),
        radius: const Radius.circular(radius));
    path.lineTo(0, radius);
    path.arcToPoint(const Offset(radius, 0),
        radius: const Radius.circular(radius));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
