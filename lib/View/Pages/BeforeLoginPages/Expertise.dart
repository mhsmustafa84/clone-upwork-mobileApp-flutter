import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/CreateProfile.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/CreateProfileEperience.dart';
import 'package:upwork/View/components/Shared/CustomCircleAvatar.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/Shared/Roundedinput.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/firebaseApp.dart';

class Expertise extends StatefulWidget {
  String skillsVal;

  Expertise({
    this.skillsVal,
  });
  @override
  _ExpertiseState createState() => _ExpertiseState();
}

class _ExpertiseState extends State<Expertise> {

  List<String> skills = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
      TextEditingController messageController = TextEditingController();


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
                            'Select your skills',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Now what you are looking for ?',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ]),
                    RoundedInputField(
                    messageController: messageController,
                      err: "Oops! this skills is not found",
                      hintText: "Start typing to search for skills ..... ",
                      onChanged: (value) {
                        widget.skillsVal = value;
                      },
                      icon: null,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.4,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: FlatButton(
                  color: Color(0xFF15A800),
                  onPressed: () => {
                    messageController.clear(),
                    setState(() {
                      skills.add(widget.skillsVal);
                    }),
                    // print(skills),
                    // print(skills.length),
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Add Skills",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Wrap(
                spacing: 15,
                runSpacing: 5,
                children: [
                  for (var i in skills)
                    FilterChip(
                        //selected: _selected,
                        label: Text(i),
                        avatar: Icon(Icons.add),
                        onSelected: (val) {
                          // setState(() => _selected = val);
                        }),
                ],
              ),
              SizedBox(height: size.height * 0.03),
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
                                        return Createprofile();
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
                            DatabaseService().updateDocument("talent",
                                auth.currentUser.uid, {'skills': skills});
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return CreateProfileEperience();
                              }),
                            );
                          },
                        ),
                      ]))
            ]),
          )),
    );
  }
}
