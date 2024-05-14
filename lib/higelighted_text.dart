import 'package:flutter/material.dart';

class HighlightedTextPage extends StatelessWidget {
  const HighlightedTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Matching Example')),
      body: Center(
        child: HighlightedText(
          text: '广东省广州市天河区',
          matchText: '广州',
          matchStyle: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}

class HighlightedText extends StatelessWidget {
  final String text;
  final String matchText;
  final TextStyle matchStyle;

  HighlightedText(
      {required this.text, required this.matchText, required this.matchStyle});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans =
        _getHighlightedTextSpans(text, matchText, matchStyle);

    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black), // Default text style
        children: spans,
      ),
    );
  }

  List<TextSpan> _getHighlightedTextSpans(
      String text, String matchText, TextStyle matchStyle) {
    List<TextSpan> spans = [];
    int start = 0;
    int index = text.indexOf(matchText, start);

    while (index != -1) {
      // Add the text before the matched text
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }
      // Add the matched text with the special style
      spans.add(TextSpan(text: matchText, style: matchStyle));
      // Update start position
      start = index + matchText.length;
      // Find the next match
      index = text.indexOf(matchText, start);
    }

    // Add the remaining text after the last match
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return spans;
  }
}
