import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedYear = 2023;
  int selectedMonth = 1;
  int selectedDay = 1;

  List<int> years = List.generate(100, (index) => 2023 - index);
  List<int> months = List.generate(12, (index) => index + 1);
  List<int> days = List.generate(31, (index) => index + 1);

  void _showTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              Container(
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedYear = years[index];
                          });
                        },
                        itemExtent: 32.0,
                        children: years
                            .map((year) => Center(child: Text('$year年')))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedMonth = months[index];
                          });
                        },
                        itemExtent: 32.0,
                        children: months
                            .map((month) => Center(child: Text('$month月')))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedDay = days[index];
                          });
                        },
                        itemExtent: 32.0,
                        children: days
                            .map((day) => Center(child: Text('$day日')))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('取消'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        // Update with selected values
                      });
                      Navigator.pop(context);
                    },
                    child: Text('确定'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Picker Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showTimePicker(context),
          child: Text('$selectedYear年 $selectedMonth月 $selectedDay日'),
        ),
      ),
    );
  }
}
