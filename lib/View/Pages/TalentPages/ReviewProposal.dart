import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/View/Pages/TalentPages/Proposals.dart';
import 'package:upwork/View/Pages/TalentPages/SubmitProposal.dart';
import 'package:intl/intl.dart';

import '../../../firebaseApp.dart';

class ReviewProposal extends StatefulWidget {
  final dateFormart = new DateFormat('kk:mm:a');
  final JobDataModel job;
  String coverLetter;
  double jobRate;
  ReviewProposal(this.job, this.coverLetter, this.jobRate);

  @override
  _ReviewProposalState createState() => _ReviewProposalState();
}

class _ReviewProposalState extends State<ReviewProposal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color(0xff5BBC2E)),
        title: Center(
          child: Text(
            "Review Proposal",
            style: TextStyle(fontFamily: 'sanserif'),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 14.0, top: 10.0, bottom: 5.0),
                    child: Text("${widget.job.jobTitle}",
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
                              "${widget.job.jobCategory}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff5BBC2E),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text("Posted 7 hours ago",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_location,
                                  color: Color(0xff247AE5),
                                ),
                                Text(
                                  "WorldWide",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("4 required connects (111 available)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                              Icon(
                                Icons.help,
                                color: Color(0xff018623),
                              )
                            ],
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
                          left: 14.0, right: 14.0, top: 7.0, bottom: 7.0),
                      child: Container(
                        width: 360,
                        height: 200,
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.job.jobDescription}",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        )),
                      )),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 14.0, right: 14.0, top: 5.0, bottom: 5.0),
                      child: Column(
                        children: [
                          Container(
                            width: 360,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${widget.job.jobBudget}\$",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${widget.job.jobPaymentType}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${widget.job.jobExperienceLevel}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Experience level",
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Your bid is : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Text("${widget.jobRate}",
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8, 15, 8, 15),
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              Column(
                                children: [
                                  Text("Your Cover Letter is",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Text("${widget.coverLetter}",
                                      style: TextStyle(fontSize: 18)),
                                ],
                              )
                            ]),
                          )
                        ],
                      )),
                ],
              )),
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
                            "Withdraw Proposal",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            database
                                .collection('job')
                                .doc(widget.job.jobID)
                                .collection('proposals')
                                .where("talentId",
                                    isEqualTo: auth.currentUser.uid)
                                .get()
                                .then((QuerySnapshot res) {
                              res.docs.forEach((doc) {
                                database
                                    .collection('job')
                                    .doc(widget.job.jobID)
                                    .collection('proposals')
                                    .doc(doc.id)
                                    .delete();
                              });
                            });
                            database
                                .collection('talent')
                                .doc(auth.currentUser.uid)
                                .collection('jobProposal')
                                .where("jobId", isEqualTo: widget.job.jobID)
                                .get()
                                .then((QuerySnapshot res) {
                              res.docs.forEach((doc) {
                                database
                                    .collection('talent')
                                    .doc(auth.currentUser.uid)
                                    .collection('jobProposal')
                                    .doc(doc.id)
                                    .delete();
                                print('delete');
                              });
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return SubmitProposal(widget.job);
                              }),
                            );
                          },
                        ),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff018623),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 8, 3, 8),
                        child: InkWell(
                          child: Text(
                            "Accept Proposal",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ProposalsPage();
                              }),
                            );
                          },
                        ),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
