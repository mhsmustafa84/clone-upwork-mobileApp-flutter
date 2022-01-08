import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/Services/JobDataService.dart';
import 'package:upwork/Services/UserDataService.dart';
import 'package:upwork/View/components/Shared/CustomCircleAvatar.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/Talent/ActiveContracts.dart';
import 'package:upwork/View/components/Talent/BottomNav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../firebaseApp.dart';

class Contracts extends StatefulWidget {
  List<String> jobid = [];
  JobDataModel job;
  List<JobDataModel> jobs = [];
  @override
  _ContractsState createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  double totalearnings = 0.0;

  getData() async {
    await database
        .collection('talent')
        .doc(auth.currentUser.uid)
        .collection('jobProposal')
        .where('status', isEqualTo: 'closed')
        .get()
        .then((QuerySnapshot res) {
      res.docs.forEach((doc) {
        totalearnings += doc.data()['budget'];
        widget.jobid.add(doc.data()['jobId']);
        // });
        // });
      });
    });
    if (this.mounted) setState(() {});
  }

  getData1() async {
    for (var i = 0; i < widget.jobid.length; i++) {
      widget.job = await JobDataService().getJobData(widget.jobid[i]);
    }
    if (this.mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.jobid);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: CustomCircleAvatar(),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Center(
          child: Text("Contracts"),
        ),
        actions: [
          CustomMenuButton(),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            color: Color(0xffF1F2F4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Earning available :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            r'$' + '${totalearnings}',
                            style: TextStyle(
                                color: Color(0xff57A72D),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.more_horiz),
                          ))
                    ],
                  ),
                ),
                ActiveContracts()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
