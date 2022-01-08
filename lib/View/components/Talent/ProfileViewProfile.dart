import 'package:flutter/material.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';
import 'SelectDropDown.dart';

class ProfileViewProfile extends StatefulWidget {
  final UserDataModel user;
  ProfileViewProfile(this.user);
  @override
  _ProfileViewProfileState createState() => _ProfileViewProfileState();
}

class _ProfileViewProfileState extends State<ProfileViewProfile> {
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
                "View Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
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
                widget.user.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CustomIcon(Icons.mode_edit),
            ),
            // CustomIcon(Icons.link),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20),
          child: Row(
            children: [
              Text(
                "\$" + widget.user.hourlyRate.toString() + "/hr",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: CustomIcon(Icons.mode_edit),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            left: true,
            top: true,
            right: true,
            bottom: true,
            minimum: const EdgeInsets.all(16.0),
            child: Text(
              widget.user.overview,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
