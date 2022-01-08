import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upwork/Models/JobData.dart';
import 'package:upwork/firebaseApp.dart';

class JobDataService {
  Future<List<JobDataModel>> getJobsData() async {
    List<JobDataModel> jobs = [];
    try {
      await database
          .collection('job')
          // .orderBy('postTime', descending: true)
          .where('status', isEqualTo: 'public')
          .get()
          .then((QuerySnapshot res) {
        res.docs.forEach((doc) {
          jobs.add(JobDataModel.fromJson(doc.data()));
        });
      });
    } catch (e) {
      print(e);
    }
    return jobs;
  }

  Future<JobDataModel> getJobData(id) async {
     JobDataModel job;
    try {
      await FirebaseFirestore.instance
          .collection('job')
          .doc(id)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print('Document exists on the database');
          job =  JobDataModel.fromJson(documentSnapshot.data());
        }
      });
    } catch (e) {
      print(e);
    }
    print(job);
    return job;
  }

  Future<List<JobDataModel>> getJobsSearch(val) async {
    List<JobDataModel> jobs = [];
    try {
      await database.collection('job').get().then((QuerySnapshot res) {
        res.docs.forEach((doc) {
          if (doc.data()["skills"].contains(val)) {
            jobs.add(JobDataModel.fromJson(doc.data()));
          }
        });
      });
    } catch (e) {
      print(e);
    }
    return jobs;
  }
}
