import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScrollingContainerDemo(),
    );
  }
}

class ScrollingContainerDemo extends StatefulWidget {
  @override
  _ScrollingContainerDemoState createState() => _ScrollingContainerDemoState();
}

class _ScrollingContainerDemoState extends State<ScrollingContainerDemo>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  final List<String> _items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        _scrollController.jumpTo(
            _scrollController.position.maxScrollExtent * _animation.value);
      });

    _startScrolling();
  }

  void _startScrolling() {
    _animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrolling Container Demo'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                _items[index],
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
