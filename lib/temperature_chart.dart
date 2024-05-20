import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '温度趋势图',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Container(
          child: CustomTemperatureChart(),
        ),
      ),
    );
  }
}

class CustomTemperatureChart extends StatelessWidget {
  // 示例数据：用实际的40天温度数据替换
  final List<double> maxTemperatures = [
    25,
    26,
    27,
    26,
    25,
    24,
    23,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    33,
    32,
    31,
    30,
    29,
    28,
    27,
    26,
    25,
    24,
    23,
    22,
    21,
    20,
    19,
    18,
    17,
    16,
    15,
    14
  ];

  final List<double> minTemperatures = [
    15,
    16,
    17,
    16,
    15,
    14,
    13,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    23,
    22,
    21,
    20,
    19,
    18,
    17,
    16,
    15,
    14,
    13,
    12,
    11,
    10,
    9,
    8,
    7,
    6,
    5,
    4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('40日温度趋势'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(400, 200), // 指定绘图区域大小
          painter: TemperatureChartPainter(maxTemperatures, minTemperatures),
        ),
      ),
    );
  }
}

class TemperatureChartPainter extends CustomPainter {
  final List<double> maxTemperatures;
  final List<double> minTemperatures;

  TemperatureChartPainter(this.maxTemperatures, this.minTemperatures);

  @override
  void paint(Canvas canvas, Size size) {
    final paintMax = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paintMin = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final maxPath = Path();
    final minPath = Path();

    final double spacing = size.width / (maxTemperatures.length - 1);

    for (int i = 0; i < maxTemperatures.length; i++) {
      final x = i * spacing;
      final yMax = size.height - (maxTemperatures[i] / 40.0 * size.height);
      final yMin = size.height - (minTemperatures[i] / 40.0 * size.height);

      if (i == 0) {
        maxPath.moveTo(x, yMax);
        minPath.moveTo(x, yMin);
      } else {
        maxPath.lineTo(x, yMax);
        minPath.lineTo(x, yMin);
      }
    }

    canvas.drawPath(maxPath, paintMax);
    canvas.drawPath(minPath, paintMin);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
