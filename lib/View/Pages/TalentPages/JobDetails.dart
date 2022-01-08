import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_button/custom/like_button.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart' as btn;

import 'package:upwork/Models/JobData.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/Models/clientData.Dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/Services/UserDataService.dart';

import 'package:upwork/Services/clientDataService.dart';
import 'package:upwork/View/Pages/TalentPages/SubmitProposal.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';
import 'package:upwork/firebaseApp.dart';

class JobDetails extends StatefulWidget {
  final dateFormart = new DateFormat('kk:mm:a');
  final JobDataModel job;
  UserDataModel user;
  JobDetails(this.job);
  bool proposalSet = false;

  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  ClientDataModel client;


  Future<bool> onLikeButtonTapped(bool isLiked) async {
    var temp;
    print(isLiked);
    // print(widget.user.savedJobs.contains(widget.job.jobID));
    if (widget.user.savedJobs.contains(widget.job.jobID)) {
      temp = widget.user.savedJobs;
      temp..remove(widget.job.jobID);
      DatabaseService()
          .updateDocument('talent', auth.currentUser.uid, {'savedJobs': temp});
      // isLiked = false;
    } else {
      temp = widget.user.savedJobs;
      temp.add(widget.job.jobID);
      DatabaseService()
          .updateDocument('talent', auth.currentUser.uid, {'savedJobs': temp});
      // isLiked = true;
    }

    return !isLiked;
  }

  getData() async {
    // client = await ClientDataService().getClientData(widget.job.authID);
    client = await ClientDataService().getClientData(widget.job.authID);
    widget.user = await UserDataService().getUserData();
    await database
        .collection("talent")
        .doc(auth.currentUser.uid)
        .collection("jobProposal")
        .where("jobId", isEqualTo: widget.job.jobID)
        .get()
        .then((res) => {
              if (res?.docs.length > 0)
                {
                  widget.proposalSet = true,
                  print(widget.proposalSet),
                },
            });


    if (this.mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
   
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = new DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color(0xff5BBC2E)),
        title: Center(
          child: Text(
            "Job details",
            style: TextStyle(fontFamily: 'sanserif'),
          ),
        ),
      ),
      body: widget.job != null && widget.user != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Card(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, right: 14.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.job.jobTitle,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
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
                            ),
                            child: Container(
                              width: 360,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Text(
                                      widget.job.jobCategory,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff5BBC2E),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Text(
                                        dateFormat.format(
                                            widget.job.postTime.toDate()),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.grey)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add_location,
                                          color: Color(0xff247AE5),
                                        ),
                                        Text(
                                          "WorldWide",
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("2 required connects",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey)),
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
                                  left: 14.0,
                                  right: 14.0,
                                  top: 7.0,
                                  bottom: 7.0),
                              child: Container(
                                width: 360,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.job.jobDescription,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    for (var i = 0;
                                        i < widget.job.jobImages.length;
                                        i++)
                                      Text("\n" + widget.job.jobImages[i],
                                          style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              )),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 14.0, right: 14.0, bottom: 4.0),
                              child: Container(
                                width: 360,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    widget.job.jobDuration,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    widget.job.jobPaymentType,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "1-3 months",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Duration",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      widget.job
                                                          .jobExperienceLevel,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Experience level",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    widget.job.jobBudget
                                                            .toString() +
                                                        "\$",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      widget.job.jobPaymentType,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, bottom: 4.0),
                            child: Container(
                              width: 360,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Project Type",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.job.jobType,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, bottom: 4.0),
                            child: Container(
                              width: 360,
                              child: Column(
                                children: [
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Skills and Expertise",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: widget.job.skills != null &&
                                              widget.job.skills.length > 0
                                          ? Wrap(
                                              direction: Axis.horizontal,
                                              children: [
                                                  for (var i = 0;
                                                      i <
                                                          widget.job.skills
                                                              .length;
                                                      i++)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xffCDCECB),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            widget
                                                                .job.skills[i],
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ])
                                          : Text(""),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, right: 14.0, bottom: 4.0),
                            child: Container(
                              width: 360,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Activity on this job",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Proposals :",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "less than 5",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Interviewing :",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "0",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
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
                                left: 14.0, right: 14.0, bottom: 4.0),
                            child: Container(
                              width: 360,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "About the client",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.verified,
                                          size: 15,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          "Payment method verified",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "country name",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "time  in  country",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Jobs posted :",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "0",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0, top: 5, bottom: 5),
                      child: Container(
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff018623),
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:widget.proposalSet == true
                              ? InkWell(
                          child: Text(
                            "Withdraw Proposal",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
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
                                print(doc.id);
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
                        )
                      
                              : InkWell(
                                  child: Text(
                                    "Submit a Proposal",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {
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
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: btn.LikeButton(
                            onTap: onLikeButtonTapped,
                            circleColor: btn.CircleColor(
                                start: Color(0xFFF44336),
                                end: Color(0xFFF44336)),
                            likeBuilder: (bool isLiked) {
                              return Icon(
                                Icons.favorite,
                                color: widget.user?.savedJobs
                                        ?.contains(widget.job.jobID)
                                    ? Colors.green
                                    : Colors.grey,
                              );
                            },
                          ),
                        )
                      ),
                      ),
                    )
                  ],
                )
              ],
            )
          : CustomLoader(),
    );
  }
}
