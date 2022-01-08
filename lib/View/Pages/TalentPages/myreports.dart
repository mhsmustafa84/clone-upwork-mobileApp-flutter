import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/Talent/Available.dart';

import 'package:upwork/View/components/Talent/Workinprogress.dart';

import '../../../firebaseApp.dart';

class ReportsPage extends StatefulWidget {
  ReportsPage({Key key}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  double workinprogressbudget = 0.0;
  double availablebudget = 0.00;
  getData() async {
    await database
        .collection('talent')
        .doc(auth.currentUser.uid)
        .collection('jobProposal')
        .where('status', isEqualTo: 'contract')
        .get()
        .then((QuerySnapshot res) {
      res.docs.forEach((doc) {
        workinprogressbudget += doc.data()['budget'];
        // });
        // });
      });
    });
    if (this.mounted) setState(() {});
  }

  getData1() async {
    await database
        .collection('talent')
        .doc(auth.currentUser.uid)
        .collection('jobProposal')
        .where('status', isEqualTo: 'closed')
        .get()
        .then((QuerySnapshot res) {
      res.docs.forEach((doc) {
        availablebudget += doc.data()['budget'];
      });
    });

    

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    print(workinprogressbudget);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Reports",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          CustomMenuButton(),
        ],
      ),
      body: workinprogressbudget > 0
          ? Container(
              color: Color(0xFFF1F2F4),
              child: Column(children: <Widget>[
                Container(
                    color: Color(0xFFFFFFFF),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Work in Progress ',
                                    style: TextStyle(
                                      color: Color(0xFF8ACC5E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  InkWell(
                                      hoverColor: Colors.black,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Color(0xFF8ACC5E),
                                        size: 20,
                                      ),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return WorkInProgressPage();
                                          },
                                        ));
                                      }),
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, bottom: 15.0),
                            child: Row(
                              children: <Widget>[
                                Text(r'$' + '${workinprogressbudget}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black38,
                            height: 12,
                          ),
                        ])),
                Container(
                    color: Color(0xFFFFFFFF),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 15),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Available ',
                                    style: TextStyle(
                                      color: Color(0xFF8ACC5E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                  InkWell(
                                      hoverColor: Colors.black,
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Color(0xFF8ACC5E),
                                        size: 20,
                                      ),
                                      onTap: () => {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return AvailablePage();
                                              },
                                            )),
                                          }),
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, bottom: 15.0),
                            child: Row(
                              children: <Widget>[
                                Text(r'$' + '${availablebudget}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ])),
              ]))
          : CustomLoader(),
    );
  }
}
