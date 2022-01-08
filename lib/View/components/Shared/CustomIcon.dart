import 'package:flutter/material.dart';

class CustomIcon extends StatefulWidget {
  final IconData icon;
  CustomIcon(this.icon);
  @override
  _CustomIconState createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff656565), width: 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Icon(
        widget.icon,
        color: Color(0xff656565),
      ),
    );
  }
}
