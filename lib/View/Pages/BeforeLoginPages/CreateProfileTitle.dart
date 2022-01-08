import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upwork/Services/DatabaseService.dart';
import 'package:upwork/View/Pages/BeforeLoginPages/createprofilephoto.dart';
import 'package:upwork/View/components/Shared/CustomDrawer.dart';
import 'package:upwork/View/components/Shared/CustomMenuButton.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/constanse.dart';
import 'package:upwork/firebaseApp.dart';
import 'CreateProfileSetHourlyRate.dart';

class CreateProfileTitle extends StatefulWidget {
  @override
  _CreateProfileTitleState createState() => _CreateProfileTitleState();
}

class _CreateProfileTitleState extends State<CreateProfileTitle> {
  double hourlyRate = 0;
  String title;
  String overView;
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
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Learn more ",
                              style: TextStyle(
                                  color: bgUpwork,
                                  fontWeight: FontWeight.bold)),
                          Text("about writing a great profile",
                              style: TextStyle(
                                color: Colors.black87,
                              ))
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Title   ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.help,
                            color: bgUpwork,
                            size: 15,
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40,
                            width: 300,
                            child: TextField(
                              onChanged: (value) => {title = value},
                              maxLines: 1,
                              decoration: InputDecoration(
                                labelText:
                                    "Example: Web, Mobile & Software Dev",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text("Professional Overview   ",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.help,
                            color: bgUpwork,
                            size: 15,
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 8, 8),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                              onChanged: (value) => {
                                overView = value,
                              },
                              maxLines: 10,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText:
                                    "Highlight your top skills, experience, and interrests. This is on of the first things clients will see on your profile.",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 2),
                  child: Divider(color: Colors.black54),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Text("Skip this step",
                        style: TextStyle(
                            color: bgUpwork,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return CreateProfilePhoto();
                      },
                    ));
                  },
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
                                          return CreateProfileSetHourlyRate();
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
                                'title': title,
                                'overview': overView,
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return CreateProfilePhoto();
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
