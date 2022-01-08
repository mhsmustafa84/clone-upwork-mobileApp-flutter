import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/Models/ProposalsData.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/Services/JobDataService.dart';
import 'package:upwork/View/Pages/TalentPages/Proposals.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';

import '../../../firebaseApp.dart';

class OffersCard extends StatefulWidget {
  final ProposalsDataModel propos;
  OffersCard(this.propos);
  @override
  _OffersCardState createState() => _OffersCardState();
}

class _OffersCardState extends State<OffersCard> {
  JobDataModel job;

  getData() async {
    job = await JobDataService().getJobData(widget.propos.jobId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    final dateFormart = new DateFormat('yyyy-MM-dd');
    return Container(
              height: size.height * 0.8,
              width: size.height * 0.8,

        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          Card(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: job != null
                      ? [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0,
                                right: 14.0,
                                top: 10.0,
                                bottom: 30.0),
                            child: Text("${job?.jobTitle}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
                            child: Container(
                              width: 360,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                        dateFormart
                                            .format(job?.postTime.toDate()),
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0,
                                  right: 14.0,
                                  top: 5.0,
                                  bottom: 5.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 360,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${job?.jobBudget}\$",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "${job?.jobPaymentType}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ]
                      : [
                          CustomLoader(),
                        ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(3, 8, 3, 8),
                    child: InkWell(
                      child: Text(
                        "Decline",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        // DatabaseService().updateDocument('job', job.jobID, {
                        //   'status': 'public',
                        // });
                        database
                            .collection('talent')
                            .doc(auth.currentUser.uid)
                            .collection('jobProposal')
                            .where("jobId", isEqualTo: job.jobID)
                            .get()
                            .then((QuerySnapshot res) {
                          res.docs.forEach((doc) {
                            database
                                .collection('talent')
                                .doc(auth.currentUser.uid)
                                .collection('jobProposal')
                                .doc(doc.id)
                                .update({
                              'status': 'proposal',
                            });
                          });
                        });
                             database
                            .collection('client')
                            .doc(job.authID)
                            .collection('contracts')
                            .where("jobID", isEqualTo: job.jobID)
                            .get()
                            .then((QuerySnapshot res) {
                          // var x = res.docs[0].id;
                          res.docs.forEach((doc) {
                            database
                                .collection('client')
                                .doc(job.authID)
                                .collection('contracts')
                                .doc(doc.id)
                                .update({
                              'talentResponse': 'reject',
                              // 'startTime': DateTime.now()
                            });
                          });
                        });
                       Navigator.pushNamed(context, "/jobs");
                      },
                    ),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0XFF37a000),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(3, 8, 3, 8),
                    child: InkWell(
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        DatabaseService().updateDocument('job', job.jobID, {
                          'status': 'hired',
                        });
                        database
                            .collection('talent')
                            .doc(auth.currentUser.uid)
                            .collection('jobProposal')
                            .where("jobId", isEqualTo: job.jobID)
                            .get()
                            .then((QuerySnapshot res) {
                          res.docs.forEach((doc) {
                            database
                                .collection('talent')
                                .doc(auth.currentUser.uid)
                                .collection('jobProposal')
                                .doc(doc.id)
                                .update({
                              'status': 'contract',
                              'startTime': DateTime.now()
                            });
                          });
                        });

                        database
                            .collection('client')
                            .doc(job.authID)
                            .collection('contracts')
                            .where("jobID", isEqualTo: job.jobID)
                            .get()
                            .then((QuerySnapshot res) {
                          // var x = res.docs[0].id;
                          res.docs.forEach((doc) {
                            database
                                .collection('client')
                                .doc(job.authID)
                                .collection('contracts')
                                .doc(doc.id)
                                .update({
                              'talentResponse': 'accept',
                              // 'startTime': DateTime.now()
                            });
                          });
                        });

                         Navigator.pushNamed(context, "/jobs");
                      },
                    ),
                  )),
                ),
              ),
            ],
          )
        ])));
  }
}
