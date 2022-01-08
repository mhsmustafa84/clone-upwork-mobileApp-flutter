import 'package:flutter/material.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/Services/JobDataService.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';
import 'package:upwork/View/components/Talent/JobCard.dart';
import 'package:upwork/View/components/Talent/SelectDropDown.dart';
import 'package:upwork/View/components/beforeLogin/Loginbtn.dart';
import 'package:upwork/constanse.dart';

class MyFeedPage extends StatefulWidget {
  @override
  _MyFeedPageState createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  List<JobDataModel> jobs;

  getData() async {
    jobs = await JobDataService().getJobsData();
    // jobs.forEach((element) {});
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return jobs != null
        ? SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  "View:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.start,
                )),
            // DropDown(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectDropDown(
                ["Feed", "Best Matches"],
                isExpand: true,
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            RoundedButton(
                borderColor: Colors.grey[350],
                color: Colors.white,
                text: "There are new jobs.See them",
                textColor: bgUpwork),
            Column(
                children: jobs.length > 0
                    ? [
                        for (var i = 0; i < jobs.length; i++)
                          JobCard(
                            job: jobs[i],
                          ),
                      ]
                    : [
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Text(
                            'There is no jobs...',
                            style: TextStyle(
                                color: bgUpworkDark,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Icon(
                          Icons.explore_outlined,
                          size: 40,
                        ),
                      ]),
          ]))
        : CustomLoader();
  }
}
