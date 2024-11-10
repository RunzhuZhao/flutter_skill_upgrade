import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Line Chart'),
        ),
        body: Container(
          width: 375,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: LineChartWidget(),
          ),
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
          verticalInterval: 0.2,
          drawVerticalLine: true,
          drawHorizontalLine: false,
          getDrawingVerticalLine: (value) {
            return FlLine(
              strokeWidth: 1,
              color: Color(0xffEBEEE8),
            );
          },
        ),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(
          show: false,
          border: Border(
            left: BorderSide(color: Colors.black, width: 1),
            bottom: BorderSide(color: Colors.black, width: 1),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 2.5),
              FlSpot(2, 3.5),
              FlSpot(3, 3),
              FlSpot(4, 4),
              FlSpot(5, 3.5),
              FlSpot(6, 4.5),
              FlSpot(7, 4),
              FlSpot(8, 4.5),
              FlSpot(9, 4.2),
              FlSpot(10, 5),
              FlSpot(0, 3),
              FlSpot(1, 2.5),
              FlSpot(2, 3.5),
              FlSpot(3, 3),
              FlSpot(4, 4),
              FlSpot(5, 3.5),
              FlSpot(6, 4.5),
              FlSpot(7, 4),
              FlSpot(8, 4.5),
              FlSpot(9, 4.2),
              FlSpot(10, 5),
            ],
            isCurved: true,
            color: Colors.orange,
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
            dotData: FlDotData(show: false),
          ),
          LineChartBarData(
              spots: [
                FlSpot(0, 2),
                FlSpot(1, 1.8),
                FlSpot(2, 2.2),
                FlSpot(3, 1.5),
                FlSpot(4, 2.5),
                FlSpot(5, 2.0),
                FlSpot(6, 3.0),
                FlSpot(7, 2.8),
                FlSpot(8, 3.5),
                FlSpot(9, 3.2),
                FlSpot(10, 3.8),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false)),
        ],
        minX: 0,
        maxX: 10,
        minY: 1,
        maxY: 5,
      ),
    );
  }
}
