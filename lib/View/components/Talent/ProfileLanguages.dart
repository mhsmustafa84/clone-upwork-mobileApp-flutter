import 'package:flutter/material.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';

class ProfileLanguages extends StatefulWidget {
  final UserDataModel user;
  ProfileLanguages(this.user);
  @override
  _ProfileLanguagesState createState() => _ProfileLanguagesState();
}

class _ProfileLanguagesState extends State<ProfileLanguages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
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
                  "Languages",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              CustomIcon(Icons.mode_edit),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: CustomIcon(Icons.add),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "English: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.user.englishProficiency,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                          widget.user.otherLanguages.length>0?
                      Wrap(
                        spacing: 15,
                        runSpacing: 5,
                        children: [
                          for (var i = 0;
                              i < widget.user.otherLanguages.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    widget.user.otherLanguages[i]["language"] +
                                        ": ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.user.otherLanguages[i]["langProf"],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      )
                    
                    :null
                   
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
