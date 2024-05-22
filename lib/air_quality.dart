import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(AirQualityGaugeApp());
}

class AirQualityGaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AirQualityGauge(),
        ),
      ),
    );
  }
}

class AirQualityGauge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 300),
      painter: AirQualityGaugePainter(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '82',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              '空气良',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '13:59 更新',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class AirQualityGaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    final startAngle = degreesToRadians(135); // -225 degrees to radians
    final sweepAngle = degreesToRadians(270); // 270 degrees to radians
// + math.pi * 2
    final gradient = SweepGradient(
      tileMode: TileMode.repeated,
      startAngle: degreesToRadians(125),
      endAngle: degreesToRadians(485),
      colors: [
        Color(0xff6DCFAB),
        Color(0xffEDD061),
        Color(0xffF3A864),
        Color(0xffF1977E),
        Color(0xffD56565),
        Color(0xffBA5D5D), // Closing the loop for gradient
      ],
      stops: [
        45 / 360,
        90 / 360,
        135 / 360,
        180 / 360,
        225 / 360,
        270 / 360,
      ],
      // transform: GradientRotation(
      //     degreesToRadians(135)), // Rotate gradient to start from top center
    );

    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromCircle(center: center, radius: 150))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 15;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: 150),
      startAngle,
      sweepAngle,
      false,
      paint,
    );

    _drawLabels(canvas, size, radius);
    // _drawIndicator(canvas, size, 150, 82); // Air quality value
  }

  void _drawLabels(Canvas canvas, Size size, double radius) {
    final textPainter = (String text, double x, double y) {
      final textSpan = TextSpan(
        text: text,
        style: TextStyle(color: Colors.black, fontSize: 14),
      );
      final tp = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(canvas, Offset(x - tp.width / 2, y - tp.height / 2));
    };

    final labels = ['健康', '优', '良', '轻度', '中度', '重度', '严重'];
    final labelValues = [0, 50, 100, 150, 200, 300, 500];

    final startAngle = degreesToRadians(-225);
    final angleStep = degreesToRadians(270 / (labels.length - 1));

    for (int i = 0; i < labels.length; i++) {
      final angle = startAngle + i * angleStep;
      final x = size.width / 2 + radius * math.cos(angle);
      final y = size.height / 2 + radius * math.sin(angle);
      textPainter('${labelValues[i]}\n${labels[i]}', x, y);
    }
  }

  void _drawIndicator(Canvas canvas, Size size, double radius, double value) {
    final indicatorPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final normalizedValue = (value / 500).clamp(0.0, 1.0);
    final angle =
        degreesToRadians(-225) + normalizedValue * degreesToRadians(270);
    final x = size.width / 2 + radius * math.cos(angle);
    final y = size.height / 2 + radius * math.sin(angle);

    canvas.drawCircle(Offset(x, y), 10, indicatorPaint);
  }

  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
