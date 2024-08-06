import 'package:flutter/material.dart';

class EducationTimeline extends StatelessWidget {
  const EducationTimeline({super.key});

  final double progress = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          CustomPaint(
            painter: EducationTimelinePainter(progress: progress),
            child: Container(
              height: 200.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildStepInfo('Secondary Education', '2 years ago'),
              _buildStepInfo('Undergraduate Education', '1 Month ago'),
              // _buildStepInfo('Skill Enhancement', 'Upcoming'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepInfo(String title, String subtitle) {
    return Column(
      children: <Widget>[
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
        const SizedBox(height: 4.0),
        Text(subtitle,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13)),
      ],
    );
  }
}


class EducationTimelinePainter extends CustomPainter {
  final double progress; // Value to determine the yellow outline width of the second circle

  EducationTimelinePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..strokeWidth = 4.0;

    final gradient = LinearGradient(
      colors: [Colors.purple.shade200, Colors.purple.shade900],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final lineShader = gradient.createShader(Rect.fromLTRB(0, 0, 0, size.height));

    final completedCirclePaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    final completedIconPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final currentCirclePaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    final currentOutlinePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = progress; // Dynamic outline width based on the progress value

    final emptyCirclePaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke;

    // Draw the timeline line with gradient
    final path = Path()
      ..moveTo(size.width * 0.1, size.height / 2)
      ..lineTo(size.width * 0.9, size.height / 2);
    canvas.drawPath(path, linePaint..shader = lineShader);

    // Draw the circles
    double smallCircleRadius = 20.0;
    double largeCircleRadius = 30.0;
    double stepWidth = (size.width * 0.8) / 2;
    double startX = size.width * 0.1;

    // Draw the first circle (completed)
    canvas.drawCircle(Offset(startX, size.height / 2), smallCircleRadius, completedCirclePaint);
    _drawTickMark(canvas, Offset(startX, size.height / 2), smallCircleRadius / 2, completedIconPaint);

    // Draw the second circle (current)
    canvas.drawCircle(Offset(startX + stepWidth, size.height / 2), largeCircleRadius, currentCirclePaint);
    canvas.drawCircle(Offset(startX + stepWidth, size.height / 2), largeCircleRadius, currentOutlinePaint);
    _drawTickMark(canvas, Offset(startX + stepWidth, size.height / 2), largeCircleRadius / 2, completedIconPaint);

    // Draw the third circle (upcoming)
    canvas.drawCircle(Offset(startX + 2 * stepWidth, size.height / 2), smallCircleRadius, emptyCirclePaint);
  }

  void _drawTickMark(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path()
      ..moveTo(center.dx - radius / 2.3, center.dy)
      ..lineTo(center.dx, center.dy + radius / 2.5)
      ..lineTo(center.dx + radius / 1.5, center.dy - radius / 2.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
