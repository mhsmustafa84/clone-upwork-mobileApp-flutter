import 'package:cloud_firestore/cloud_firestore.dart';

class JobDataModel {
  JobDataModel({
    this.jobID,
    this.authID,
    this.freelancerNeed,
    this.freelancerNeedAr,
    this.jobBudget,
    this.jobCategory,
    this.jobDescription,
    this.jobDuration,
    this.jobDurationAr,
    this.jobExperienceLevel,
    this.jobExperienceLevelAr,
    this.jobImages,
    this.jobPaymentType,
    this.jobPaymentTypeAr,
    this.jobTitle,
    this.jobType,
    this.jobTypeAr,
    this.jobVisibility,
    this.jobVisibilityAr,
    this.skills,
    this.postTime,
    this.dueDate,
    this.hired,
    this.status,
    this.clientCountry,
    this.clientCountryAr,
    this.clientJobReview,
    this.clientSpentMoney,
    this.clientPaymentVerified,
    this.clientAllReviews,
    this.talentJobReview,
  });
  String jobID;
  String authID;
  Timestamp postTime;
  String freelancerNeed;
  String freelancerNeedAr;
  int jobBudget;
  String jobCategory;
  String jobDescription;
  String jobDuration;
  String jobDurationAr;

  String jobExperienceLevel;
  String jobExperienceLevelAr;

  List jobImages;
  String jobPaymentType;
  String jobPaymentTypeAr;

  String jobTitle;
  String jobType;
  String jobTypeAr;

  String jobVisibility;
  String jobVisibilityAr;

  List skills;
  String dueDate;
  int hired;
  String status;
  String clientCountry;
  String clientCountryAr;
  Map clientJobReview;
  Map talentJobReview;
  int clientAllReviews;
  int clientSpentMoney;
  bool clientPaymentVerified;

  factory JobDataModel.fromJson(Map<String, dynamic> json) => JobDataModel(
        jobID: json["jobID"],
        authID: json["authID"],
        freelancerNeed: json["freelancerNeed"],
        jobBudget: json["jobBudget"],
        jobCategory: json["jobCategory"],
        jobDescription: json["jobDescription"],
        jobDuration: json["jobDuration"],
        jobExperienceLevel: json["jobExperienceLevel"],
        jobImages: json["jobImages"],
        jobPaymentType: json["jobPaymentType"],
        jobTitle: json["jobTitle"],
        jobType: json["jobType"],
        jobVisibility: json["jobVisibility"],
        jobVisibilityAr: json["jobVisibilityAr"],
        skills: json["skills"],
        postTime: json["postTime"],
        dueDate: json["dueDate"],
        hired: json["hired"],
        status: json["status"],
        clientCountry: json['clientCountry'],
        clientCountryAr: json['clientCountryAr'],
        clientJobReview: json['clientJobReview'],
        talentJobReview: json['talentJobReview'],
        clientAllReviews: json['clientAllReviews'],
        clientSpentMoney: json['clientSpentMoney'],
        clientPaymentVerified: json['clientPaymentVerified'],
      );
}
