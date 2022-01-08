import 'package:flutter/material.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';

class MyStats extends StatefulWidget {
  MyStats({Key key}) : super(key: key);

  @override
  _MyStatsState createState() => _MyStatsState();
}

class _MyStatsState extends State<MyStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "My Stats",
          ),
        ),
        actions: [
          CustomMenuButton(),
        ],
      ),
      body: Text(
        "My Stats",
      ),
    );
  }
}
