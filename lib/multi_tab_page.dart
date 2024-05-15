import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView with Indicator'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  height: 4.0,
                  width: _selectedIndex == index ? 4.0 : 4.0,
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? Color(0xff666666)
                        : Color(0x66666666),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                Center(
                    child: Container(
                  child: Text('Home Screen'),
                  color: Colors.amber,
                )),
                Center(
                    child: Container(
                  child: Text('Settings Screen'),
                  color: Colors.orange,
                )),
                Center(
                    child: Container(
                  child: Text('Profile Screen'),
                  color: Colors.blue.shade100,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
