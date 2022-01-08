import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TalentMessage extends StatefulWidget {
  String msg;
  TalentMessage(this.msg);
  @override
  _TalentMessageState createState() => _TalentMessageState();
}

class _TalentMessageState extends State<TalentMessage> {
  @override
  Widget build(BuildContext context) {
    String now = DateFormat().add_jm().format(DateTime.now());
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Color(0xff1E4355),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: RichText(
                    text: TextSpan(
                        text: widget.msg,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        children: [
                      TextSpan(
                          text: "             " + now,
                          style: TextStyle(color: Colors.grey, fontSize: 15))
                    ]))),
          ),
        ));
  }
}
