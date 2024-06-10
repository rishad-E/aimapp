import 'dart:math';

import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final Color borderColor;
  final double cornerRadius;

  DottedBorderPainter({
    this.dashWidth = 5,
    this.dashSpace = 5,
    this.strokeWidth = 1,
    this.borderColor = Colors.black,
    this.cornerRadius = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = borderColor.withOpacity(0.3)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Draw horizontal dots at the top
    double startX = 15;
    while (startX < size.width - cornerRadius - dashWidth) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw vertical dots on the right
    double startY = 15;
    while (startY < size.height - cornerRadius - dashWidth) {
      canvas.drawLine(
        Offset(size.width, startY),
        Offset(size.width, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    // Draw horizontal dots at the bottom
    startX = size.width - 15;
    while (startX > cornerRadius + dashWidth) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX - dashWidth, size.height),
        paint,
      );
      startX -= dashWidth + dashSpace;
    }

    // Draw vertical dots on the left
    startY = size.height - 15;
    while (startY > cornerRadius + dashWidth) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY - dashWidth),
        paint,
      );
      startY -= dashWidth + dashSpace;
    }

    // Draw corner arcs with dots
    _drawDottedArc(canvas, paint, Offset(cornerRadius, cornerRadius), 180,
        270); // Top-left corner
    _drawDottedArc(
        canvas,
        paint,
        Offset(size.width - cornerRadius, cornerRadius),
        270,
        360); // Top-right corner
    _drawDottedArc(
        canvas,
        paint,
        Offset(size.width - cornerRadius, size.height - cornerRadius),
        0,
        90); // Bottom-right corner
    _drawDottedArc(
        canvas,
        paint,
        Offset(cornerRadius, size.height - cornerRadius),
        90,
        180); // Bottom-left corner
  }

  void _drawDottedArc(Canvas canvas, Paint paint, Offset center,
      double startAngle, double endAngle) {
    double radius = cornerRadius;
    double angle = _degreesToRadians(startAngle);
    double step = dashWidth / radius;
    while (angle < _degreesToRadians(endAngle)) {
      final x1 = center.dx + radius * cos(angle);
      final y1 = center.dy + radius * sin(angle);
      angle += step;
      final x2 = center.dx + radius * cos(angle);
      final y2 = center.dy + radius * sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
      angle += dashSpace / radius;
    }
  }

  double _degreesToRadians(double degrees) => degrees * (pi / 180.0);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
