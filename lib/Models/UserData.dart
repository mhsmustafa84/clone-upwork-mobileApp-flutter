class UserDataModel {
  UserDataModel({
    this.authID,
    this.profilePhoto,
    this.badge,
    this.connects,
    this.connectsHistory,
    this.education,
    this.school,
    this.email,
    this.expertiseLevel,
    this.firstName,
    this.hourlyRate,
    this.jobCategory,
    this.jobHistory,
    this.languages,
    this.langProf,
    this.language,
    this.location,
    this.city,
    this.country,
    this.street,
    this.zip,
    this.overview,
    this.accepted,
    this.password,
    this.portfolio,
    this.skills,
    this.title,
    this.totalEarnings,
    this.totalHours,
    this.totalJobs,
    this.userType,
    this.savedJobs,
    this.otherLanguages,
    this.employmentHistory,
    this.profileCompletion,
    this.searchHistory,
    this.company,
    this.lastName,
    this.englishProficiency,
  });

  String authID;
  Map badge;
  int connects;
  List connectsHistory;
  Map education;
  List employmentHistory;
  String profilePhoto;
  String school;
  List company;
  bool accepted;
  List otherLanguages;
  String email;
  String expertiseLevel;
  String firstName;
  int hourlyRate;
  String jobCategory;
  List jobHistory;
  List languages;
  String langProf;
  String language;
  String lastName;
  Map location;
  String city;
  String country;
  String street;
  String zip;
  String mobileNumber;
  String overview;
  List searchHistory;
  String password;
  List portfolio;
  List savedJobs;
  List skills;
  String title;
  int profileCompletion;
  int totalEarnings;
  int totalHours;
  int totalJobs;
  String userType;

  String englishProficiency;
  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        badge: json["badge"],
        connects: json["connects"],
        education: json["education"],
        company: json["company"],
        school: json["school"],
        email: json["email"],
        expertiseLevel: json["expertiseLevel"],
        firstName: json["firstName"],
        hourlyRate: json["hourlyRate"],
        jobHistory: json["jobHistory"],
        savedJobs: json["savedJobs"],
        lastName: json["lastName"],
        searchHistory: json["searchHistory"],
        employmentHistory: json["employmentHistory"],
        languages: json["languages"],
        langProf: json["langProf"],
        language: json["language"],
        profileCompletion: json["profileCompletion"],
        location: json["location"],
        connectsHistory: json["connectsHistory"],
        city: json["city"],
        accepted: json["accepted"],
        otherLanguages: json["otherLanguages"],
        country: json["country"],
        street: json["street"],
        zip: json["zip"],
        overview: json["overview"],
        password: json["password"],
        portfolio: json["portfolio"],
        skills: json["skills"],
        title: json["title"],
        totalEarnings: json["totalEarnings"],
        totalHours: json["totalHours"],
        totalJobs: json["totalJobs"],
        userType: json["userType"],
        profilePhoto: json["profilePhoto"],
        englishProficiency: json["englishProficiency"],
      );
}
