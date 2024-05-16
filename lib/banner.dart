import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scrolling Banner'),
        ),
        body: Center(
          child: ScrollingBanner(),
        ),
      ),
    );
  }
}

class ScrollingBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView(
        children: <Widget>[
          BannerItem(
            icon: Icons.cloud,
            message: "未来两小时不会下雨，放心出门吧",
            humidity: "65%",
            wind: "12级",
            airQuality: "严重",
          ),
          BannerItem(
            icon: Icons.cloud,
            message: "降雨渐动",
            humidity: "60%",
            wind: "10级",
            airQuality: "良好",
          ),
        ],
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  final IconData icon;
  final String message;
  final String humidity;
  final String wind;
  final String airQuality;

  BannerItem({
    required this.icon,
    required this.message,
    required this.humidity,
    required this.wind,
    required this.airQuality,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('湿度',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(humidity,
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('风速',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(wind,
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('空气',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(airQuality,
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
