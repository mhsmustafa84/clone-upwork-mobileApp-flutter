import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/Services/UserDataService.dart';
import 'package:upwork/View/Pages/TalentPages/HomePage.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import '../../../constanse.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';

class CreateProfilePreviewBeforeSubmit extends StatefulWidget {
  final dateFormart = new DateFormat('kk:mm:a');

  @override
  _CreateProfilePreviewBeforeSubmitState createState() =>
      _CreateProfilePreviewBeforeSubmitState();
}

class _CreateProfilePreviewBeforeSubmitState
    extends State<CreateProfilePreviewBeforeSubmit> {
  UserDataModel user;

  getData() async {
    user = await UserDataService().getUserData();
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: CircleAvatar(
              radius: 50,
              backgroundImage: user?.profilePhoto != null
                  ? NetworkImage(user?.profilePhoto)
                  : ExactAssetImage("assets/img/default-avatar.jpg"),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Center(
          child: Text(
            "Create Profile",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          CustomMenuButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: user != null
            ? Column(
                children: [
                  Container(
                      color: bgUpworkSection,
                      child: Container(
                          color: Colors.grey[200],
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text("Preview profile",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]))),
                  Container(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: SvgPicture.asset(
                                    "assets/svg/createProfileSubmit.svg",
                                    width: 150,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      // 'j',
                                      "Looking good, ${user.firstName}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Make any necessary edits and then submit your profile. You can still edit it after you submit it.",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RoundedButton(
                                      color: Color(0XFF37a000),
                                      text: "Submit Profile",
                                      textColor: Colors.white,
                                      borderColor: Color(0x00000000),
                                      press: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return HomePage();
                                            // return HomePage();
                                          }),
                                        );
                                      },
                                    ),
                                  ]))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: bgUpworkSection,
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: user.profilePhoto != null
                                          ? NetworkImage(user.profilePhoto)
                                          : NetworkImage(
                                              "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "${user?.firstName} ${user?.lastName}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.room,
                                          size: 15,
                                        ),
                                        Text(
                                            "${user?.location['city']}, Egypt"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      widget.dateFormart
                                          .format(new DateTime.now()),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CustomIcon(Icons.mode_edit),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              top: 15,
                              right: 20,
                              bottom: 15,
                            ),
                            child: Text(
                              "${user?.title} ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text("${user?.overview}"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 20),
                          child: Row(
                            children: [
                              Text(
                                "\$${user?.hourlyRate}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 3.0, left: 20, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "Hourly rate",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                          child: Divider(color: Colors.black54),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Languages",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      CustomIcon(Icons.mode_edit),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1.5,
                                        color: bgUpworkSection,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            for (var i = 0;
                                                i <
                                                    user?.otherLanguages
                                                        ?.length;
                                                i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffCDCECB),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      user.otherLanguages[i]
                                                          ["language"],
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ]),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: bgUpworkSection,
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.5,
                                    color: bgUpworkSection,
                                  ),
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Skills",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    CustomIcon(Icons.mode_edit),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    for (var i = 0;
                                        i < user?.skills.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Color(0xffCDCECB),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              user.skills[i],
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: bgUpworkSection,
                    child: Container(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Employment history",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  CustomIcon(Icons.mode_edit),
                                ],
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.5,
                                    color: bgUpworkSection,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        for (var i = 0;
                                            i < user?.company?.length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.all(4),
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Company : ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                        Text(
                                                          user.company[i]
                                                              ["companyName"],
                                                          style: TextStyle(
                                                              fontSize: 16),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Job Title : ",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                          Text(
                                                            user.company[i]
                                                                ["jobTitle"],
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ]),
                                ))
                          ],
                        )),
                  ),
                  Container(
                    color: bgUpworkSection,
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 20,
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.5,
                                    color: bgUpworkSection,
                                  ),
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Education",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    CustomIcon(Icons.mode_edit),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Company : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        user.education["school"],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Job Title : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          user.education["degree"],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: bgUpworkSection,
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RoundedButton(
                                color: Color(0XFF37a000),
                                text: "Submit Profile",
                                textColor: Colors.white,
                                borderColor: Color(0x00000000),
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return HomePage();
                                    }),
                                  );
                                },
                              ),
                            ])),
                  )
                ],
              )
            : CustomLoader(),
      ),
    );
  }
}
