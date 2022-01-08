import 'package:flutter/material.dart';
import 'package:upwork/Models/UserData.dart';

import '../../../constanse.dart';

class ProfileTotalEarning extends StatefulWidget {
  final UserDataModel user;
  ProfileTotalEarning(this.user);
  @override
  _ProfileTotalEarningState createState() => _ProfileTotalEarningState();
}

class _ProfileTotalEarningState extends State<ProfileTotalEarning> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgUpworkSection,
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          widget.user.totalEarnings.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Total Earning",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.user.totalJobs.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("Total Jobs"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
