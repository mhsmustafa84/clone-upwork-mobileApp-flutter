import 'package:flutter/material.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';

class ProfileAvailability extends StatefulWidget {
  final String availability;
  ProfileAvailability(this.availability);
  @override
  _ProfileAvailabilityState createState() => _ProfileAvailabilityState();
}

class _ProfileAvailabilityState extends State<ProfileAvailability> {
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
                  "Availability",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              CustomIcon(Icons.mode_edit),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Available",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.availability,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
