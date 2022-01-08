import 'package:flutter/material.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/Eductaion.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/EmploymentDetails.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/LanguageProficiency.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';

class Employement extends StatefulWidget {
  @override
  _EmployementState createState() => _EmployementState();
}

class _EmployementState extends State<Employement> {
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
                child: Column(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Add your past work experience ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ]),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          'Build your credibility by showcasing the projects or jobs you have completed.',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          height: size.height * 0.07,
                          width: size.width * 0.9,
                          child: OutlinedButton.icon(
                            label: Text(
                              'Add Employement',
                              style: TextStyle(
                                color: Color(0XFF37a000),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            icon: Icon(
                              Icons.add,
                              color: Color(0XFF37a000),
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return EmployementDetails();
                                  },
                                ),
                              )
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.3),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: size.height * 0.07,
                            width: size.width * 0.9,
                            child: OutlinedButton(
                              child: Text(
                                'Skip this step',
                                style: TextStyle(
                                  color: Color(0XFF37a000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LanguageProficiency();
                                    },
                                  ),
                                )
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.07),
                        Align(
                          alignment: Alignment.bottomCenter,
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
                                                return Education();
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return LanguageProficiency();
                                      }),
                                    );
                                  },
                                ),
                              ]),
                        ),
                      ]))
            ]))));
  }
}
