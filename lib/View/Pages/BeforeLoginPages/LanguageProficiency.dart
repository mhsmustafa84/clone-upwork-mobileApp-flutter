import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Employment.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/AddLanguage.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/CreateProfileSetHourlyRate.dart';
import 'package:upwork/firebaseApp.dart';

class LanguageProficiency extends StatefulWidget {
  @override
  _LanguageProficiencyState createState() => _LanguageProficiencyState();
}

class _LanguageProficiencyState extends State<LanguageProficiency> {
  bool addLanguage = false;
  bool valuesecond = false;
  String dropdownValue;
  String lang, proficiency;
  List languages = [];
  void changed() {
    setState(() {
      addLanguage = !addLanguage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
                child: Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'What is your English proficiency ? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 37,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0XFF0F8E0F)),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: dropdownValue == null
                                    ? Text("English Proficiency")
                                    : Text(
                                        dropdownValue,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(color: Colors.grey),
                                items: [
                                  'Basic',
                                  'Conversational',
                                  'Fluent',
                                  'Native or Bilingual'
                                ].map(
                                  (val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  },
                                ).toList(),
                                onChanged: (val) {
                                  setState(
                                    () {
                                      dropdownValue = val;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        addLanguage
                            ? AddLanguage(
                                addLanguage: changed, languages: languages)
                            : Container(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'What other languages do you speak ? ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: size.height * 0.02),
                                    Container(
                                      height: size.height * 0.07,
                                      width: size.width * 0.9,
                                      child: OutlinedButton.icon(
                                        style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30))),
                                        label: Text(
                                          'Add Language',
                                          style: TextStyle(
                                            color: Color(0XFF37a000),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.add,
                                          color: Color(0XFF37a000),
                                        ),
                                        onPressed: () => {changed()},
                                      ),
                                    ),
                                    languages.length != 0
                                        // ? Column(
                                        //     children: <Widget>[
                                        //       for (var i = 0;
                                        //           i < languages.length;
                                        //           i++)
                                        //         Row(
                                        //           children: [
                                        //             Text(languages[i]
                                        //                 ["langProf"])
                                        //           ],
                                        //         )
                                        //     ],
                                        //   )
                                        ? Container(
                                            height: 200,
                                            child: ListView.builder(
                                              itemCount: languages.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            languages[index][
                                                                    "language"] +
                                                                " : ",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(languages[index]
                                                              ["langProf"]),
                                                        ],
                                                      ),
                                                      InkWell(
                                                        child: CustomIcon(
                                                            Icons.delete),
                                                        onTap: () {
                                                          setState(() {
                                                            languages.removeAt(
                                                                index);
                                                          });
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : Text("")
                                  ],
                                ),
                              ),
                      ]),
                    ),
                  )),
            ])),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        hoverColor: Colors.black,
                        child: CustomIcon(Icons.arrow_back_ios),
                        onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Employement();
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
                        DatabaseService().updateDocument('talent',
                            auth.currentUser.uid, {
                              'englishProficiency':dropdownValue,
                              'otherLanguages': languages
                              }
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return CreateProfileSetHourlyRate();
                          }),
                        );
                      },
                    ),
                  ]),
            ),
          ],
        ));
  }
}
