import 'package:flutter/material.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';
import 'ProfileCompletedJob.dart';

class ProfileWorkHistory extends StatefulWidget {
  final UserDataModel user;
  ProfileWorkHistory(this.user);

  @override
  _ProfileWorkHistoryState createState() => _ProfileWorkHistoryState();
}

class _ProfileWorkHistoryState extends State<ProfileWorkHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Work History",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            CustomIcon(Icons.more_horiz),
          ],
        ),
        Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: bgUpworkSection,
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.5,
                  color: upWorkText,
                ),
              ),
            ),
            child: Text(
              "Completed Jobs (3)",
              style: TextStyle(color: upWorkText),
            ),
          ),
        ),
        for (var i = 0; i < 3; i++)
          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: i != 2
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color: bgUpworkSection,
                      ),
                    ),
                  )
                : null,
            child: ProfileCompletedJob(
              "Load html on page load with jquery or javascript",
              10.0,
              "Fixed Price",
              "Dec 22, 2020 - Dec 30, 2020",
              shareIcon: true,
              feedback: "Great and fast work for javascript",
              review: 5,
            ),
          ),
      ],
    );
  }
}
