import 'package:flutter/material.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';

class ProfileEmploymentItem extends StatefulWidget {
  // final String company;
  final String title;
  final String period;
  final String description;
  ProfileEmploymentItem( this.title, this.period,
      {this.description});
  @override
  _ProfileEmploymentItemState createState() => _ProfileEmploymentItemState();
}

class _ProfileEmploymentItemState extends State<ProfileEmploymentItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "widget.title" + " | " + "widget.company",
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
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(widget.period),
          ),
          Text(widget.description),
        ],
      ),
    );
  }
}
