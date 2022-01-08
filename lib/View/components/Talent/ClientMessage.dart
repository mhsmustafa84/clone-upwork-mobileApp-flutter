import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ClientMessage extends StatefulWidget {
  String msg;
  ClientMessage(this.msg);
  @override
  _ClientMessageState createState() => _ClientMessageState();
}

class _ClientMessageState extends State<ClientMessage> {
  @override
  Widget build(BuildContext context) {
    String now = DateFormat().add_jm().format(DateTime.now());
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: RichText(
                    text: TextSpan(
                        text: widget.msg,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                        children: [
                      TextSpan(
                          text: "             " + now,
                          style: TextStyle(color: Colors.grey, fontSize: 15))
                    ]))),
          ),
        ));
  }
}
