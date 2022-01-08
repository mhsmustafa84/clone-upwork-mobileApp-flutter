import 'package:flutter/material.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Verifyemail.dart';
import 'package:upwork/View/components/Shared/Roundedinput.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/firebaseApp.dart';
import 'Verifyemail.dart';

class SignupDetails extends StatefulWidget {
  String emailVal;
  String passWord;
  String firstName;
  String lastName;
  SignupDetails({this.emailVal, this.passWord});
  @override
  _SignupDetailsState createState() => _SignupDetailsState();
}

class _SignupDetailsState extends State<SignupDetails> {
  bool valuefirst = false;
  bool valuesecond = false;
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    String databaseErr = '';
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Complete your free account setup",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Serif',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: Text(widget.emailVal),
                ),
                Center(
                  child: Text(databaseErr),
                ),
                //Fname
                RoundedInputField(
                  icon: Icons.person,
                  hintText: "First name",
                  onChanged: (value) {
                    widget.firstName = value;
                  },
                ),
                //Lastname
                RoundedInputField(
                  icon: Icons.person,
                  hintText: "Last name",
                  onChanged: (value) {
                    widget.lastName = value;
                  },
                ),
                //Password
                RoundedInputField(
                  textInputType: TextInputType.visiblePassword,
                  passInput: true,
                  icon: Icons.lock,
                  hintText: "Create a password",
                  onChanged: (value) {
                    widget.passWord = value;
                  },
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
                            ? Text('select a country')
                            : Text(
                                dropdownValue,
                                style: TextStyle(color: Colors.grey),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.grey),
                        items: ['Egypt', 'USA', 'Sudan', 'Germany'].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          print(val);
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
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Column(
                      children: [
                        ListTileTheme(
                            contentPadding: EdgeInsets.zero,
                            child: CheckboxListTile(
                              title: Text(
                                "Yes! Send me genuinley useful emails every now and then to help me most out of Upwork",
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff6d6d6d)),
                              ), //    <-- label
                              checkColor: Colors.greenAccent,
                              activeColor: Color(0XFF0F8E0F),
                              value: this.valuefirst,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  this.valuefirst = value;
                                });
                              },
                            )),
                        ListTileTheme(
                            contentPadding: EdgeInsets.zero,
                            child: CheckboxListTile(
                              title: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: 'Yes! I understand and agree to the',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff6d6d6d))),
                                TextSpan(
                                    text: 'Upwork terms of services. ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0XFF0F8E0F))),
                                TextSpan(
                                    text: 'including the ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff6d6d6d))),
                                TextSpan(
                                    text: 'user agreement',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0XFF0F8E0F))),
                                TextSpan(
                                    text: ' and',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff6d6d6d))),
                                TextSpan(
                                    text: ' privacy policy. ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0XFF0F8E0F))),
                              ])),
                              checkColor: Colors.greenAccent,
                              activeColor: Color(0XFF0F8E0F),
                              value: this.valuesecond,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value) {
                                setState(() {
                                  this.valuesecond = value;
                                });
                              },
                            )),
                      ],
                    )),
                RoundedButton(
                  color: Color(0XFF37a000),
                  text: "Create My account",
                  textColor: Colors.white,
                  borderColor: Color(0x00000000),
                  press: () async {
                    await auth
                        .createUserWithEmailAndPassword(
                            email: widget.emailVal, password: widget.passWord)
                        .then((value) => {
                              database
                                  .collection('talent')
                                  .doc(auth.currentUser.uid)
                                  .set({
                                'firstName': widget.firstName,
                                'lastName': widget.lastName,
                                'email': widget.emailVal,
                                'password': widget.passWord,
                                'userType': 'talent',
                                'totalJobs': 0,
                                'totalEarnings': 0,
                                'totalHours': 0,
                                'badge': {
                                  'none': "",
                                  'risingTalent': "Rising Talent",
                                  'topRated': "Top Rated",
                                  'expert': "Expert-Vetted"
                                },
                                'profileCompletion': 0,
                                'jobHistory': [],
                                'portfolio': [],
                                'skills': [],
                                'savedJobs': [],
                                'connects': 20,
                                'accepted': false,
                              }),
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Verifyemail(
                                    emailVal: widget.emailVal,
                                  );
                                }),
                              ),
                            })
                        .catchError((onError) => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return SignupDetails(
                                    emailVal:
                                        'The email address is already in use',
                                  );
                                }),
                              ),
                              // widget.emailVal=
                              // 'The email address is already in use by another account'
                            });
                    // AuthService()
                    //     .signUp(widget.emailVal, widget.passWord, {
                    //       'firstName': widget.firstName,
                    //       'lastName': widget.lastName,
                    //       'email': widget.emailVal,
                    //       'password': widget.passWord,
                    //       'userType': 'talent',
                    //       'totalJobs': 0,
                    //       'totalEarnings': 0,
                    //       'totalHours': 0,
                    //       'badge': {
                    //         'none': "",
                    //         'risingTalent': "Rising Talent",
                    //         'topRated': "Top Rated",
                    //         'expert': "Expert-Vetted"
                    //       },
                    //       'profileCompletion': 0,
                    //       'jobHistory': [],
                    //       'portfolio': [],
                    //       'skills': [],
                    //       'connects': 20,
                    //       'accepted': false,
                    //     })
                    //     .then((res) => {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(builder: (context) {
                    //               return Verifyemail(
                    //                 emailVal: widget.emailVal,
                    //               );
                    //             }),
                    //           ),
                    //           auth.currentUser
                    //               .updateProfile(displayName: 'talent'),
                    //           auth.currentUser.sendEmailVerification()
                    //         })
                    //     .catchError((onError) => {
                    //           //databaseErr=onError.toString(),
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(builder: (context) {
                    //               return SignupDetails(
                    //                 emailVal: 'Email use in anthor account',
                    //               );
                    //             }),
                    //           ),
                    //         });
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
