import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('图片拉伸'),
        ),
        backgroundColor: Colors.green.shade100,
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Container(
              // width: 43,
              // height: 19,
              constraints: BoxConstraints(minHeight: 19),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/light.png'),
                centerSlice: Rect.fromLTRB(9, 0, 77, 38),
                fit: BoxFit.fill,
              )),
              child: const Text(
                '污染 120',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              // width: 43,
              height: 25,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/good.png'),
                      centerSlice: Rect.fromLTRB(20, 8, 109, 49),
                      fit: BoxFit.fill,
                      repeat: ImageRepeat.repeat)),
              child: const Text(
                '轻度污染 120',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 19,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '轻度污染 120',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/good1.png'),
                      repeat: ImageRepeat.repeatX,
                      centerSlice: Rect.fromCenter(
                          center: Offset(20, 9), width: 2, height: 2))),
            ),
          ]),
        ),
      ),
    );
  }
}
