class ClientDataModel {
  ClientDataModel(
      {this.email,
      this.firstName,
      this.lastName,
      this.password,
      this.userType});
  String email;
  String firstName;
  String lastName;
  String password;
  String userType;

  factory ClientDataModel.fromJson(Map<String, dynamic> json) =>
      ClientDataModel(
          email: json["email"],
          firstName: json["firstName"],
          lastName: json["lastName"],
          password: json["password"],
          userType: json["userType"]);
}
