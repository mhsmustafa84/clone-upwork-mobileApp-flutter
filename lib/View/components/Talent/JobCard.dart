import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/View/Pages/TalentPages/JobDetails.dart';
import 'package:upwork/constanse.dart';

class JobCard extends StatefulWidget {
  final JobDataModel job;
  JobCard({this.job});
  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    final dateFormat = new DateFormat('yyyy-MM-dd');
    Size size = MediaQuery.of(context).size;

    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return JobDetails(widget.job);
          }));
        },
        child: Container(
          width: size.width * 1.0,
          height: size.height * 0.7,
          child: Card(
            color: Colors.grey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  widget.job.jobTitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: bgUpwork1,
                    fontSize: 17,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.job.jobPaymentType +
                        ": " +
                        widget.job.jobBudget.toString() +
                        "\$ -posted ${dateFormat.format(widget.job.postTime.toDate())}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.grey[600], fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    widget.job.jobExperienceLevel,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Experince Level",
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Skills",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      for (var i = 0; i < widget.job?.skills.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 5, left: 5, right: 2),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffCDCECB),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.job.skills[i],
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:
                      Text("${widget.job.jobDescription.substring(0, 40)}..."),
                ),
                Row(
                  children: widget.job.clientPaymentVerified
                      ? [
                          Icon(
                            Icons.verified,
                            color: Colors.blue,
                          ),
                          Text("Payment verified"),
                        ]
                      : [
                          Icon(
                            Icons.cancel_outlined,
                            color: Colors.red[200],
                          ),
                          Text("Payment unverified"),
                        ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
