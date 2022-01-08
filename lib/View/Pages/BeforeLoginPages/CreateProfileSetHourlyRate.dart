import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/constanse.dart';
import 'package:upwork/firebaseApp.dart';
import 'CreateProfileTitle.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/LanguageProficiency.dart';

class CreateProfileSetHourlyRate extends StatefulWidget {
  @override
  _CreateProfileSetHourlyRateState createState() =>
      _CreateProfileSetHourlyRateState();
}

class _CreateProfileSetHourlyRateState
    extends State<CreateProfileSetHourlyRate> {
  double hourlyRate = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: CircleAvatar(
                  radius: 50,
                  backgroundImage: ExactAssetImage("assets/img/default-avatar.jpg"),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
                  child: Text(
                      "Clients will see this rate on your profile and in search results once you publish your profile. You can adjust your rate every time you submit a proposal.",
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
                                keyboardType: TextInputType.number,
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
                                    hourlyRate = double.parse(value);
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
                              Text((hourlyRate * 20 / 100).toString())
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
                              Text((hourlyRate * 80 / 100).toString())
                            ]),
                          ),
                          Text(" /hr"),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 2),
                  child: Divider(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Text("Skip this step",
                      style: TextStyle(
                          color: bgUpwork,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                  child: Divider(color: Colors.black54),
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                              hoverColor: Colors.black,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xFF8ACC5E),
                                size: 20,
                              ),
                              onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return LanguageProficiency();
                                        },
                                      ),
                                    )
                                  }),
                          RoundedButton(
                            color: Color(0XFF37a000),
                            text: "Next",
                            textColor: Colors.white,
                            borderColor: Color(0x00000000),
                            press: () {
                              DatabaseService().updateDocument(
                                  'talent', auth.currentUser.uid, {
                                'hourlyRate': hourlyRate.toInt(),
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return CreateProfileTitle();
                                }),
                              );
                            },
                          ),
                        ]))
              ],
            ),
          ),
        ));
  }
}
