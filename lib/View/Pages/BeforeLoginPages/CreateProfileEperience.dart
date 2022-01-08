import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Eductaion.dart';
import 'package:upwork/View/components/Shared/CustomCircleAvatar.dart';

import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/constanse.dart';
import 'package:upwork/firebaseApp.dart';
import 'Expertise.dart';

class CreateProfileEperience extends StatefulWidget {
  @override
  _CreateProfileEperienceState createState() => _CreateProfileEperienceState();
}

class _CreateProfileEperienceState extends State<CreateProfileEperience> {
  String selectedVal;
  int selectedRadio;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

// For the selected Radio button Let's check this link https://www.youtube.com/watch?v=r5p-zhsrKUg
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: CustomCircleAvatar(),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("What is your level of experience in this field ?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 3, 15, 0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 10.0,
                            height: 10.0,
                            child: Radio(
                                value: 1,
                                groupValue: selectedRadio,
                                activeColor: bgUpwork,
                                onChanged: (val) {
                                  print("$val");
                                  setSelectedRadio(val);
                                })),
                      ],
                    ),
                    Text(
                      "Entry level",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "I am realtively new to this field",
                        style: TextStyle(color: Colors.black87, fontSize: 10),
                      ),
                    ),
                  ])),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 3, 15, 0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 10.0,
                            height: 10.0,
                            child: Radio(
                                value: 2,
                                groupValue: selectedRadio,
                                activeColor: bgUpwork,
                                onChanged: (val) {
                                  print("$val");
                                  setSelectedRadio(val);
                                })),
                      ],
                    ),
                    Text(
                      "Intermediate",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "I have substantial experience in this field",
                        style: TextStyle(color: Colors.black87, fontSize: 10),
                      ),
                    ),
                  ])),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 3, 15, 0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                      child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 10.0,
                            height: 10.0,
                            child: Radio(
                                value: 3,
                                groupValue: selectedRadio,
                                activeColor: bgUpwork,
                                onChanged: (val) {
                                  print("$val");
                                  setSelectedRadio(val);
                                })),
                      ],
                    ),
                    Text(
                      "Expert",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "I have comprehensive and deep expertise in this field",
                        style: TextStyle(color: Colors.black87, fontSize: 10),
                      ),
                    ),
                  ])),
                ),
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
                                        return Expertise();
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
                            switch (selectedRadio) {
                              case 1:
                                selectedVal = "Entry level";
                                break;
                              case 2:
                                selectedVal = "Intermediate";
                                break;
                              case 3:
                                selectedVal = "Expert";
                                break;
                              default:
                                print(selectedVal);
                                break;
                            }
                            DatabaseService().updateDocument(
                                'talent', auth.currentUser.uid, {
                              'expertiseLevel': selectedVal,
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Education();
                              }),
                            );
                          },
                        ),
                      ]))
            ],
          ),
        ));
  }
}
