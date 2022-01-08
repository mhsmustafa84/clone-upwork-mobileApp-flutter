import 'package:flutter/material.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';

class ProfileOtherExperienceItem extends StatefulWidget {
  final String subject;
  final String description;
  ProfileOtherExperienceItem(this.subject, this.description);
  @override
  _ProfileOtherExperienceItemState createState() =>
      _ProfileOtherExperienceItemState();
}

class _ProfileOtherExperienceItemState
    extends State<ProfileOtherExperienceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.subject,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 15),
                child: CustomIcon(Icons.mode_edit),
              ),
              CustomIcon(Icons.delete),
            ],
          ),
          Text(widget.description),
        ],
      ),
    );
  }
}
