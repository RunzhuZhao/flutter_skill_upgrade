import 'package:flutter/material.dart';

class FlexiableListPage extends StatefulWidget {
  const FlexiableListPage({super.key});

  @override
  State<FlexiableListPage> createState() => _FlexiableListPageState();
}

class _FlexiableListPageState extends State<FlexiableListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: false,
              backgroundColor: Colors.amber.shade100,
              title: const Text(
                '标题',
                style: TextStyle(color: Colors.black),
              ),
              expandedHeight: 300,
              snap: false,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/bg.png',
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ];
        },
        body: buildChildWidget(),
      ),
    );
  }

  Widget buildChildWidget() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('测试数据$index'),
        );
      },
      itemCount: 100,
    );
  }
}
