import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/Models/ProposalsData.dart';
import 'package:upwork/View/Pages/TalentPages/JobDetailsWithoutClient.dart';
import 'package:upwork/Services/JobDataService.dart';

class ProposalsCard extends StatefulWidget {
  final ProposalsDataModel propos;
  ProposalsCard(this.propos);

  @override
  _ProposalsCardState createState() => _ProposalsCardState();
}

class _ProposalsCardState extends State<ProposalsCard> {
  JobDataModel job;

  getData() async {
    job = await JobDataService().getJobData(widget.propos.jobId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final dateFormart = new DateFormat('yyyy-MM-dd');
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              child: job?.jobTitle != null
                  ? Text(
                      job?.jobTitle,
                      style: TextStyle(
                        color: Color(0xFF8ACC5E),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  : Text(""),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return JobDetailsWithoutClient(job);
                  }),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
              child: Text(
                dateFormart.format(widget.propos.proposalTime.toDate()),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
              child: Text(
                '2 months ago ',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ),
          ]),
    );
  }
}
