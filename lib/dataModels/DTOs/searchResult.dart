class SearchResult {
  String photourl;
  String firstname;
  String lastname;
  String useremail;
  String businessEmail;
  String businessName;
  bool isPrivate;

  SearchResult(
      {this.photourl,
      this.firstname,
      this.lastname,
      this.businessEmail,
      this.businessName,
      this.useremail,
      this.isPrivate});

  SearchResult.fromJson(Map<String, dynamic> json) {
    businessName = json['businessName'];
    photourl = json['photoUrl'];
    firstname = json['firstName'];
    lastname = json['lastName'];
    useremail = json['userEmail'];
    isPrivate = json['isPrivate'] ?? false;
    businessEmail = json['businessEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photourl'] = this.photourl;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['useremail'] = this.useremail;
    data['isPrivate'] = this.isPrivate ?? false;
    data['businessEmail'] = this.businessEmail;
    data['businessName'] = this.businessName;
    return data;
  }
}
