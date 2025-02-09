import 'package:flutter/material.dart';

class RulerSlider extends StatefulWidget {
  @override
  _RulerSliderState createState() => _RulerSliderState();
}

class _RulerSliderState extends State<RulerSlider> {
  final ScrollController _scrollController = ScrollController();
  double _currentValue = 87.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // 根据滚动位置计算值
        _currentValue = (_scrollController.offset / 10).roundToDouble() + 80;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_currentValue.toInt()}%',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 200,
                    itemBuilder: (context, index) {
                      // 生成标尺刻度
                      return Container(
                        width: 10,
                        height: index % 10 == 0 ? 50 : 30,
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        color: index % 10 == 0 ? Colors.black : Colors.grey,
                      );
                    },
                  ),
                ),
                // 中心指针
                Positioned(
                  child:
                      Icon(Icons.arrow_drop_up, size: 30, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
