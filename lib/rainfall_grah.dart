import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RainfallGraph(),
        ),
      ),
    );
  }
}

class RainfallGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 150),
      painter: RainfallGraphPainter(),
    );
  }
}

class RainfallGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: [
        Color(0x4D88B38D),
        Color(0x4DDFE7E0),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.6,
          size.width * 0.5, size.height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.8, size.width, size.height * 0.6)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final labels = ['大', '中', '小'];
    final times = ['现在', '1小时后', '2小时后'];

    for (int i = 0; i < labels.length; i++) {
      textPainter.text = TextSpan(
        text: labels[i],
        style: TextStyle(color: Colors.black, fontSize: 16),
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width / 3);
      textPainter.paint(canvas, Offset(-20, size.height / 4 + i * 20));
    }

    for (int i = 0; i < times.length; i++) {
      textPainter.text = TextSpan(
        text: times[i],
        style: TextStyle(color: Colors.black, fontSize: 16),
      );
      textPainter.layout(minWidth: 0, maxWidth: size.width / 3);
      textPainter.paint(canvas, Offset(i * (size.width / 3), size.height - 20));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
