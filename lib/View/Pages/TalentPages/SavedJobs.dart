import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/Models/UserData.dart';
import 'package:upwork/Services/JobDataService.dart';
import 'package:upwork/Services/UserDataService.dart';
import 'package:upwork/View/components/Shared/CustomLoader.dart';
import 'package:upwork/View/components/Talent/JobCard.dart';
import 'package:upwork/constanse.dart';
import 'package:upwork/firebaseApp.dart';

class SavedJobs extends StatefulWidget {
  @override
  _SavedJobsState createState() => _SavedJobsState();
}

class _SavedJobsState extends State<SavedJobs> {
  UserDataModel user;
  JobDataModel job;

  getData() async {
    user = await UserDataService().getUserData();
    //  job= await JobDataService().getJobData(user.savedJobs[i]);
    for (var i = 0; i < user.savedJobs.length; i++)
      await database.collection('job').doc(user.savedJobs[i]).get().then(
            (DocumentSnapshot documentSnapshot) =>
                  job =JobDataModel.fromJson(documentSnapshot.data()),             
      );

    if (this.mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: user !=null  ?
        
    Column(children: job !=null?
     [
    for (var i = 0; i < user.savedJobs.length; i++)
      JobCard(job: job)
      
         
    ]:
    [


      Container(
        width: size.width * 0.5,
        height: size.height * 0.5,
        child: SvgPicture.asset("assets/svg/saved.svg"),
      ),
      Text(
        "Keep track of jobs you're interested in. Select the heart icon on a job post to save it for later.",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      )
    ]
    
    ):
     Column(mainAxisAlignment: MainAxisAlignment.start, children: [CustomLoader()
    ])
    );
    

       
  }
}
