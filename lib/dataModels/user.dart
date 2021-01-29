class User {
  String useremail;
  String firstname;
  String lastname;
  bool isPrivate;
  String associatedBusinessEmail;
  String photourl;
  String bio;

  User(
      {this.useremail,
      this.firstname,
      this.lastname,
      this.isPrivate,
      this.associatedBusinessEmail,
      this.photourl,
      this.bio});

  User.fromJson(Map<String, dynamic> json) {
    useremail = json['userEmail'];
    firstname = json['firstName'];
    lastname = json['lastName'];
    isPrivate = json['isPrivate'];
    associatedBusinessEmail = json['associatedBusinessEmail'];
    photourl = json['photoUrl'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.useremail;
    data['firstName'] = this.firstname;
    data['lastName'] = this.lastname;
    data['isPrivate'] = this.isPrivate;
    data['associatedBusinessEmail'] = this.associatedBusinessEmail;
    data['photoUrl'] = this.photourl;
    data['bio'] = this.bio;
    return data;
  }
}
