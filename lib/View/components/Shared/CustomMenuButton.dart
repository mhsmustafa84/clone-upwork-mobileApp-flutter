import 'package:flutter/material.dart';

class CustomMenuButton extends StatelessWidget {
  const CustomMenuButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          child: Text("Refresh"),
          value: "Refresh",
          height: 30,
        ),
      ];
    });
  }
}
