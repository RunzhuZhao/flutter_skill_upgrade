import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('渐变圆饼图')),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: GradientPieChartPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientPieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 定义渐变
    final gradient = SweepGradient(
      startAngle: math.pi,
      endAngle: math.pi * 2,
      colors: [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.red
      ],
    );

    // 定义画笔
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
      );

    // 绘制圆饼图
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
