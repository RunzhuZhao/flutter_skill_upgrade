import 'package:flutter/material.dart';

class TypingEffect extends StatefulWidget {
  final String text;
  final Duration duration;

  TypingEffect(
      {required this.text, this.duration = const Duration(milliseconds: 100)});

  @override
  _TypingEffectState createState() => _TypingEffectState();
}

class _TypingEffectState extends State<TypingEffect> {
  String displayedText = "";
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() async {
    for (int i = 0; i < widget.text.length; i++) {
      await Future.delayed(widget.duration);
      setState(() {
        displayedText += widget.text[i];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      style: TextStyle(fontSize: 20),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text("Typing Effect")),
//       body: Center(
//         child: TypingEffect(
//           text: "Hello, Flutter! Let's create some amazing apps!",
//         ),
//       ),
//     ),
//   ));
// }
