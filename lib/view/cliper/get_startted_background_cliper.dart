import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';

class GetStartedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    var rect = Offset.zero & size;
    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        ColorResources.COLOR_ROYAL_BLUE,
        ColorResources.COLOR_DARK_ORCHID,
      ],
    ).createShader(rect);
    var path = Path();
    path.lineTo(0, size.height - size.height / 5);
    path.lineTo(size.width / 1.2, size.height);
    //Added this line
    path.relativeQuadraticBezierTo(15, 3, 30, -15);
    path.lineTo(size.width, size.height - size.height / 5);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 10;
    final filledRectangle =
    Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
