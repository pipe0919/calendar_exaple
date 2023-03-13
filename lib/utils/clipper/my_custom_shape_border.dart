import 'package:flutter/material.dart';

class MyCustomShapeBorder extends ShapeBorder {
  final CustomClipper<Path> clipper;

  const MyCustomShapeBorder(this.clipper);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      clipper.getClip(rect.size);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      clipper.getClip(rect.size);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => MyCustomShapeBorder(clipper);
}
