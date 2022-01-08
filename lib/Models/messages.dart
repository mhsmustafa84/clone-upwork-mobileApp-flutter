class MessagesDataModel {
  MessagesDataModel({
    this.clientAuthID,
    this.messages,
    this.talentAuthID,
  });
  String clientAuthID;
  Map messages;
  String talentAuthID;

  factory MessagesDataModel.fromJson(Map<String, dynamic> json) =>
      MessagesDataModel(
        clientAuthID: json["clientAuthID"],
        messages: json["messages"],
        talentAuthID: json["talentAuthID"],
      );
}
