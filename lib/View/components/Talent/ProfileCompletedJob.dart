import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:upwork/View/components/Shared/CustomIcon.dart';
import '../../../constanse.dart';

class ProfileCompletedJob extends StatefulWidget {
  final String jobName;
  final bool shareIcon;
  final String jobType;
  final String duration;
  final String feedback;
  final double review;
  final double price;

  ProfileCompletedJob(this.jobName, this.price, this.jobType, this.duration,
      {this.shareIcon, this.feedback, this.review});

  @override
  _ProfileCompletedJobState createState() => _ProfileCompletedJobState();
}

class _ProfileCompletedJobState extends State<ProfileCompletedJob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              widget.jobName,
              style: TextStyle(
                color: upWorkText,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: widget.review,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: upWorkText,
                ),
                onRatingUpdate: (double value) {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  widget.review.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20),
                child: Text(
                  widget.duration,
                ),
              ),
              CustomIcon(Icons.share),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "\"" + widget.feedback + "\"",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Row(
            children: [
              Text(
                "\$" + widget.price.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Text(
                  widget.jobType,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
