import 'package:cloud_firestore/cloud_firestore.dart';

class ProposalsDataModel {
  ProposalsDataModel({
    this.jobId,
    this.status,
    this.proposalTime,
    this.startContractTime,
    this.endContractTime,
  });
  String jobId;
  String status;
  Timestamp proposalTime;
  String startContractTime;
  String endContractTime;
  factory ProposalsDataModel.fromJson(Map<String, dynamic> json) =>
      ProposalsDataModel(
        jobId: json["jobId"],
        status: json["status"],
        proposalTime: json["proposalTime"],
        endContractTime: json["endContractTime"],
        startContractTime: json["startContractTime"],
      );
}
