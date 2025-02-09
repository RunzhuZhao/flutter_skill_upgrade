import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  bool _isGuideVisible = true; // 控制引导是否显示

  // 关闭引导的函数
  void _closeGuide() {
    setState(() {
      _isGuideVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _closeGuide();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Page with Guide')),
        body: Stack(
          children: [
            Column(
              children: [
                // 页面上的多个点击事件
                ElevatedButton(
                  onPressed: () {
                    print("Button 1 clicked");
                  },
                  child: Text('Button 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Button 2 clicked");
                  },
                  child: Text('Button 2'),
                ),
                // 更多按钮或控件...
              ],
            ),
            if (_isGuideVisible)
              Positioned(
                top: 100,
                left: 50,
                child: Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: _closeGuide, // 点击引导也可以关闭
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '引导信息',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
