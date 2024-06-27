import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CenterWidget(),
    );
  }
}

class CenterWidget extends StatefulWidget {
  const CenterWidget({
    super.key,
  });

  @override
  State<CenterWidget> createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueNotifier in StatelessWidget'),
      ),
      body: Center(
        child: CounterDisplay(
          count: value,
          callback: (value) {
            value = value;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            value = 12;
            debugPrint('value = 12;');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterDisplay extends StatefulWidget {
  CounterDisplay({required this.count, required this.callback});
  final int count;

  final Function(int value) callback;

  @override
  State<CounterDisplay> createState() => _CounterDisplayState();
}

class _CounterDisplayState extends State<CounterDisplay> {
  // final ValueNotifier<int> _counter = ValueNotifier(0);
  late final ValueNotifier<int> _counter;

  @override
  void initState() {
    _counter = ValueNotifier(widget.count);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CounterDisplay oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      _counter.value = widget.count;
    }
  }

  @override
  Widget build(BuildContext context) {
    _counter.value = widget.count;
    return Column(
      children: [
        IconButton(
            onPressed: () {
              _counter.value++;
              widget.callback(_counter.value);
            },
            icon: Icon(Icons.add)),
        ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (context, value, child) {
            return Text(
              'Counter: $value',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ],
    );
  }
}
