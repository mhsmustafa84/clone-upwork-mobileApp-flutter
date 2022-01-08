import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MsgView extends StatefulWidget {
  String name;
  String description;
  MsgView(this.name, this.description);
  @override
  _MsgViewState createState() => _MsgViewState();
}

class _MsgViewState extends State<MsgView> {
  @override
  Widget build(BuildContext context) {
    String now = DateFormat.yMd().format(DateTime.now());
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffF0F1F1)))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Stack(children: [
              ClipOval(
                  child: Image(
                      image: AssetImage("assets/img/default-avatar.jpg"),
                      width: 80,
                      fit: BoxFit.fill)),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.brightness_1,
                    color: Colors.yellow,
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff464747)),
                              ),
                            )),
                        Text(
                          now,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
