import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final Icon firstIcon;
  final bool secondIcon;
  final String text;
  final Function onTap;
  CustomListTile({this.firstIcon, this.text, this.onTap, this.secondIcon});
  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: ListTile(
        enableFeedback: true,
        title: Row(
          children: [
            widget.firstIcon,
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Container(
                width: 200,
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            widget.secondIcon
                ? Icon(
                    Icons.north_east,
                    color: Colors.white,
                  )
                : Text(""),
          ],
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
