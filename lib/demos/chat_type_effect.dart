import 'package:flutter/material.dart';
import 'dart:async';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('左右对话列表')),
//         body: ConversationWidget(),
//       ),
//     );
//   }
// }

class ConversationWidget extends StatefulWidget {
  @override
  _ConversationWidgetState createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  final List<Map<String, String>> conversations = [
    {"left": "你喜欢什么样的女生？", "right": "脾气像你，长得像你，最好是你。"},
    {"left": "你喜欢什么样的女生？", "right": "我喜欢有趣的灵魂，和一颗真诚的心。\n还有，要有点可爱的感觉哦~"},
    {"left": "你喜欢什么样的女生？", "right": "重要的是三观一致，志趣相投，一起成长。"},
  ];

  int currentIndex = 0;
  String displayedRightText = "";

  @override
  void initState() {
    super.initState();
    _startTypingEffect();
    _startConversationCycle();
  }

  void _startTypingEffect() async {
    final rightText = conversations[currentIndex]["right"]!;
    displayedRightText = "";
    for (int i = 0; i < rightText.length; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        displayedRightText += rightText[i];
      });
    }
  }

  void _startConversationCycle() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % conversations.length;
        _startTypingEffect();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final leftText = conversations[currentIndex]["left"]!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 左边对话框
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 80, bottom: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                leftText,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        // 右边对话框
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16, left: 80, bottom: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(16),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7, // 限制宽度
              ),
              child: Text(
                displayedRightText,
                style: TextStyle(fontSize: 16, color: Colors.black),
                softWrap: true, // 自动换行
              ),
            ),
          ],
        ),
      ],
    );
  }
}
