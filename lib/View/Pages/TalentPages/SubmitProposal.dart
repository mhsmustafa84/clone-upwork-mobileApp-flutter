import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:path/path.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/Services/UserDataService.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';
import 'package:upwork/View/components/Talent/SelectDropDown.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/View/components/Talent/FixedPriceMoney.dart';
import 'package:upwork/View/components/Talent/HourlyRateMoney.dart';
import 'package:upwork/View/Pages/TalentPages/ReviewProposal.dart';

import '../../../constanse.dart';
import '../../../firebaseApp.dart';

class SubmitProposal extends StatefulWidget {
  final JobDataModel job;
  SubmitProposal(this.job);

  @override
  _SubmitProposalState createState() => _SubmitProposalState();
}

class _SubmitProposalState extends State<SubmitProposal> {
  UserDataModel user;

  getData() async {
    user = await UserDataService().getUserData();

    if (this.mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  double jobRate = 0;
  String coverLetter;
  String title;
  File _proposalFile;
  String proposalUrl;
  bool loading = false;

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
  final picker = ImagePicker();

  void getRate(double numb) {
    jobRate = numb;
    // print(jobRate);
  }

  Future pickImageGallary() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _proposalFile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_proposalFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference firebaseStorageRef =
        storage.ref().child('proposalImages/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_proposalFile);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((url) => {
            proposalUrl = url,
            print(proposalUrl),
          });
      print(proposalUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.job?.jobID);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Center(
          child: Text(
            "Submit Proposal",
            style: TextStyle(fontFamily: 'sanserif', color: Colors.black),
          ),
        ),
      ),
      body: widget.job != null && user !=null
          ? Container(
              color: Colors.black12,
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Card(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14.0, right: 14.0, top: 10.0, bottom: 5.0),
                          child: Row(
                            children: [
                              Text("Proposal settings",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
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
                                  Text(
                                    "Propose with a Specialized profile",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    width: 380,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SelectDropDown(
                                        [
                                          "General Profile",
                                          "Front-end development"
                                        ],
                                        isExpand: true,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "This Proposal requires ",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        "2 Connects   ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.help,
                                        color: bgUpwork,
                                        size: 15,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "When you submit this proposal, you'll have ",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${user?.connects - 2} Connects ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "remaining.",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )),
                    Card(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0,
                                right: 14.0,
                                top: 10.0,
                                bottom: 5.0),
                            child: Row(
                              children: [
                                Text("Job Details",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        "${widget.job.jobTitle}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 14.0,
                                            right: 14.0,
                                            top: 7.0,
                                            bottom: 7.0),
                                        child: Container(
                                          width: 360,
                                          height: 200,
                                          child: SingleChildScrollView(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${widget.job.jobDescription}",
                                                style: TextStyle(fontSize: 16),
                                              )
                                            ],
                                          )),
                                        )),
                                  ],
                                ),
                              )),
                        ])),
                    if (widget.job.jobPaymentType == "Fixed Price") ...[
                      FixedPriceMoney(getRate),
                    ] else ...[
                      HourlyRateMoney(getRate),
                    ],
                    Card(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0,
                                right: 14.0,
                                top: 10.0,
                                bottom: 5.0),
                            child: Row(
                              children: [
                                Text("Additional details",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
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
                                width: double.maxFinite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        "Cover Letter",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "Introduce yourself and explain why you're a strong candidate for this job feel free to suggest any changes to the job details or ask to schedule a video call",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.8,
                                                child: TextField(
                                                  onChanged: (value) => {
                                                    coverLetter = value,
                                                  },
                                                  maxLines: 10,
                                                  textAlignVertical:
                                                      TextAlignVertical.top,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Add cover letter",
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Attachments",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.help,
                                          color: bgUpwork,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                    RoundedButton(
                                      color: Colors.white,
                                      text: "Attach file",
                                      textColor: bgUpwork1,
                                      borderColor: Colors.black12,
                                      press: pickImageGallary,
                                    ),
                                  ],
                                ),
                              )),
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RoundedButton(
                                color: Color(0XFF37a000),
                                text: "Submit",
                                textColor: Colors.white,
                                borderColor: Color(0x00000000),
                                press: () {
                                  database
                                      .collection('job')
                                      .doc(widget.job.jobID)
                                      .collection('proposals')
                                      .add({
                                    'coverLetter': coverLetter,
                                    'budget': jobRate,
                                    'clientId': widget.job.authID,
                                    'jobPaymentType': widget.job.jobPaymentType,
                                    'talentId': auth.currentUser.uid,
                                    'images': [proposalUrl],
                                    'proposalTime': DateTime.now(),
                                    'talentName':
                                        user.firstName + " " + user.lastName,
                                  });
                                  DatabaseService().updateDocument(
                                      'talent', auth.currentUser.uid, {
                                    'connects': user?.connects - 2,
                                  });
                                  database
                                      .collection('talent')
                                      .doc(auth.currentUser.uid)
                                      .collection('jobProposal')
                                      .add({
                                    'jobId': widget.job.jobID,
                                    'status': 'proposal',
                                    'endContractTime': '',
                                    'startContractTime': '',
                                    'proposalTime': DateTime.now(),
                                    'budget': jobRate,
                                  });
                                  uploadImageToFirebase(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ReviewProposal(
                                          widget.job, coverLetter, jobRate);
                                    }),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ])),
            )
          : CustomLoader(),
    );
  }
}
