import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('40-Day Temperature Line Chart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(height: 400, child: LineChartWidget()),
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          gridData: FlGridData(
            show: true,
            verticalInterval: 1,
            drawVerticalLine: true,
            drawHorizontalLine: false,
            getDrawingVerticalLine: (value) {
              return FlLine(
                strokeWidth: 1,
                color: Color(0xffEBEEE8),
              );
            },
          ),
          titlesData: FlTitlesData(
            show: false,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, interval: 5),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, interval: 5),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(color: Colors.black, width: 1),
              bottom: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                  40,
                  (index) =>
                      FlSpot(index.toDouble(), (20 + (index % 10)).toDouble())),
              isCurved: true,
              color: Colors.orange,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
            LineChartBarData(
              spots: List.generate(
                  40,
                  (index) =>
                      FlSpot(index.toDouble(), (12 + (index % 8)).toDouble())),
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
              isStrokeCapRound: true,
              isStrokeJoinRound: true,
            ),
          ],
          minX: 0,
          maxX: 39,
          minY: 10,
          maxY: 30,
          lineTouchData: LineTouchData(enabled: true)),
    );
  }
}
