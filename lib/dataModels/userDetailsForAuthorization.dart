class UserDetailsForAuthorization {
  String username;
  String password;
  List<String> roles;
  String firstName;
  String lastName;
  List<String> interests;
  String bio;

  UserDetailsForAuthorization(
      {this.username,
      this.password,
      this.roles,
      this.bio,
      this.firstName,
      this.lastName,
      this.interests});

  UserDetailsForAuthorization.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    roles = json['roles'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    interests = json['interests'];
    bio = json['bio'];
  }

  Map<String, dynamic> toAuthenticateJson() {
    final Map<String, dynamic> data = new Map();

    data['username'] = this.username;
    data['password'] = this.password;
    data['client'] = "quora-app";

    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['roles'] = this.roles;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['interests'] = this.interests;
    data['bio'] = this.bio;

    return data;
  }
}
