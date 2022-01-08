import 'package:flutter/material.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';

class ProfileSkills extends StatefulWidget {
  final UserDataModel user;
  ProfileSkills(this.user);
  @override
  _ProfileSkillsState createState() => _ProfileSkillsState();
}

class _ProfileSkillsState extends State<ProfileSkills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.5,
            color: bgUpworkSection,
          ),
        ),
      ),
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
                  "Skills",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              CustomIcon(Icons.mode_edit),
            ],
          ),
          Wrap(
            spacing: 15,
            runSpacing: 5,
            children: [
              for (var i = 0; i < widget.user.skills.length; i++)
                Chip(
                  label: Text(widget.user.skills[i]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
