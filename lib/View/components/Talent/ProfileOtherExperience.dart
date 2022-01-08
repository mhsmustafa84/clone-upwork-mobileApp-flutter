import 'package:flutter/material.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';
import 'ProfileOtherExperienceItem.dart';

class ProfileOtherExperience extends StatefulWidget {
  @override
  _ProfileOtherExperienceState createState() => _ProfileOtherExperienceState();
}

class _ProfileOtherExperienceState extends State<ProfileOtherExperience> {
  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  children: [
                    Text(
                      "Other Experience",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: CustomIcon(Icons.add),
                    ),
                  ],
                ),
              ),
              ProfileOtherExperienceItem(
                "Frontend Training",
                "3 Months at Eraasoft",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
