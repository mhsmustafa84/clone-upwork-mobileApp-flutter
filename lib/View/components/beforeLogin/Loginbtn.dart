import 'package:flutter/material.dart';
import 'package:upwork/constanse.dart';
//import 'package:flutter_auth/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor, borderColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = bgUpwork,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(30),
      ),
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(15),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        color: color,
        onPressed: press,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
