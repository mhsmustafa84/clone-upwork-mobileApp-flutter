import 'package:flutter/material.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';
import 'ProfileEmploymentItem.dart';

class ProfileEmploymentHistory extends StatefulWidget {
  final UserDataModel user;
  ProfileEmploymentHistory(this.user);
  @override
  _ProfileEmploymentHistoryState createState() =>
      _ProfileEmploymentHistoryState();
}

class _ProfileEmploymentHistoryState extends State<ProfileEmploymentHistory> {
  @override
  Widget build(BuildContext context) {
    print(widget.user.company);

    return Container(
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
                  left: 12.0,
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
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Employment History",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    widget.user.company.length > 0
                        ? Wrap(
                            spacing: 15,
                            runSpacing: 5,
                            children: [
                              for (var i = 0;
                                  i < widget.user?.company?.length;
                                  i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              "companyName : ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              widget.user.company[i]
                                                  ["companyName"],
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, bottom: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              "jobTitle : ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              widget.user?.company[i]
                                                  ["jobTitle"],
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )
                        : Text(''),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
