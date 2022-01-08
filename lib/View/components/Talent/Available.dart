import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:flutter_text_anchor/flutter_text_anchor.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';

class AvailablePage extends StatefulWidget {
  @override
  _AvailablePageState createState() => _AvailablePageState();
}

class _AvailablePageState extends State<AvailablePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Available",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            CustomMenuButton(),
          ],
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: Text(
                    'you earned it ! Where should we deliver your balance ? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Align(
                  alignment: Alignment.center,
                  child: Button3D(
                    width: 300,
                    onPressed: () {},
                    child: Text(
                      "Set Up Payments",
                      style: TextStyle(
                        color: Color(0xFF8ACC5E),
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'No transactions in the last 30 days ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Align(
                    alignment: Alignment.center,
                    child: TextAnchor(
                      textColor: Colors.black54,
                      linkColor: Color(0xFF8ACC5E),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      text:
                          '(View all transactions)[https://medium.com/@ranaranvijaysingh9].',
                      onTapLink: (link) {
                        print(link);
                      },
                    )),
                SizedBox(height: size.height * 0.04),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Note:this report is updated every hour',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ]),
        ));
  }
}
