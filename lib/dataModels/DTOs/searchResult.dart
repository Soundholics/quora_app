class SearchResult {
  String photourl;
  String firstname;
  String lastname;
  String useremail;
  bool isPrivate;

  SearchResult(
      {this.photourl,
      this.firstname,
      this.lastname,
      this.useremail,
      this.isPrivate});

  SearchResult.fromJson(Map<String, dynamic> json) {
    photourl = json['photourl'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    useremail = json['useremail'];
    isPrivate = json['isPrivate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photourl'] = this.photourl;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['useremail'] = this.useremail;
    data['isPrivate'] = this.isPrivate;
    return data;
  }
}
