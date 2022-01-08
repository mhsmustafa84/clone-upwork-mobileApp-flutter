import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Expertise.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Verifyemail.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/firebaseApp.dart';

class Createprofile extends StatefulWidget {
  final String emailVal;
  String firstName;
  String lastName;
  String password;

  Createprofile({this.emailVal, this.firstName, this.lastName, this.password});
  @override
  _CreateprofileState createState() => _CreateprofileState();
}

class _CreateprofileState extends State<Createprofile> {
  String dropdownValue;
  String dropdownValueSubCat;
  List<String> subcatagory = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: CircleAvatar(
                radius: 50,
              backgroundImage:ExactAssetImage("assets/img/default-avatar.jpg"),
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
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tell us about the work you do ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'What is the main service you offer ? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ])),
            SizedBox(height: size.height * 0.03),
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
                      hint: Text(
                        "Select Catagory",
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      value: dropdownValue,
                      style: TextStyle(color: Colors.black),
                      items: [
                        "Web, Mobile & Software Dev",
                        "IT & Networking",
                        "Accounting & Consulting",
                        "Admin Support",
                        "Customer Service",
                        "Data Science & Analytics",
                        "Design & Creative",
                        "Engineering & Architecture",
                        "Legal",
                        "Sales & Marketing",
                        "Translation",
                        "Writing",
                      ].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        switch (val) {
                          case 'Web, Mobile & Software Dev':
                            {
                              setState(
                                () {
                                  dropdownValue = val;
                                  print(dropdownValue);
                                  subcatagory = [
                                    "Desktop Software Development",
                                    "Ecommerce Development",
                                    "Game Development",
                                    "Mobile Development",
                                    "Other - Software Development",
                                    "Product Management",
                                    "QA & Testing",
                                    "Scripts & Utilities",
                                    "Web & Mobile Design",
                                    "Web Development",
                                  ];
                                },
                              );
                            }
                            break;
                          case 'IT & Networking':
                            {
                              setState(
                                () {
                                  dropdownValue = val;
                                  print(dropdownValue);
                                  subcatagory = [
                                    "Database Administration",
                                    "ERP/CRM Software",
                                    "Information Security",
                                    "Network & System Administration",
                                    "Other - IT & Networking",
                                  ];
                                },
                              );
                            }
                            break;
                          default:
                            {
                              setState(() {
                                dropdownValue = val;
                                print(dropdownValue);
                                subcatagory = [];
                              });
                            }
                            break;
                        }
                      }),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
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
                      hint: Text(
                        "Select SubCatagory",
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      value: dropdownValueSubCat,
                      style: TextStyle(color: Colors.black),
                      items: subcatagory.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          dropdownValueSubCat = val;
                        });
                      }),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
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
                                      return Verifyemail();
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
                          print(dropdownValueSubCat);
                          DatabaseService().updateDocument(
                              "talent",
                              auth.currentUser.uid,
                              {'jobCategory': dropdownValueSubCat,
                              'authID':auth.currentUser.uid
                              }
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Expertise(
                            
                              );
                            }),
                          );
                        },
                      ),
                    ]))
          ]),
        ),
      ),
    );
  }
}
