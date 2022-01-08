import 'package:flutter/material.dart';

import '../../../constanse.dart';

class HourlyRateMoney extends StatefulWidget {
  double hourlyRate = 0;
  Function setRate;
  HourlyRateMoney(this.setRate);
  @override
  _HourlyRateMoneyState createState() => _HourlyRateMoneyState();
}

class _HourlyRateMoneyState extends State<HourlyRateMoney> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(
            left: 14.0, right: 14.0, top: 10.0, bottom: 5.0),
        child: Row(
          children: [
            Text("Terms",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Divider(
        color: Colors.grey,
      ),
      Padding(
          padding: const EdgeInsets.only(
              left: 14.0, right: 14.0, top: 7.0, bottom: 7.0),
          child: Container(
            width: 360,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "What is the rate you'd like to bid for this job?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
                  child: Text("Your profile rate : \$20/hr",
                      style: TextStyle(color: Colors.black87, fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Hourly Rate",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Total amount the client will see",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 220,
                            child: TextField(
                                maxLines: 1,
                                textAlignVertical: TextAlignVertical.top,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.attach_money,
                                    color: bgUpwork,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    widget.setRate(double.parse(value));
                                    widget.hourlyRate = double.parse(value);
                                  });
                                }),
                          ),
                          Text(" /hr"),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Divider(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Upwork Service Fee",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                          Text("    Explain this",
                              style: TextStyle(
                                  color: bgUpwork,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "The Upwork Service Fee is 20% when you begin a contract with a new client. once you bill over \$500 with your client, the fee will be 10%. ",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 220,
                            child: Row(children: [
                              Icon(
                                Icons.attach_money,
                                color: bgUpwork,
                              ),
                              Text((widget.hourlyRate * 20 / 100).toString())
                            ]),
                          ),
                          Text(" /hr"),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Divider(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("You'll receive",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "The estimated amount you'll receive after service fees",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 14))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 220,
                            child: Row(children: [
                              Icon(
                                Icons.attach_money,
                                color: bgUpwork,
                              ),
                              Text((widget.hourlyRate * 80 / 100).toString())
                            ]),
                          ),
                          Text(" /hr"),
                        ],
                      )),
                )
              ],
            ),
          )),
    ]));
  }
}
