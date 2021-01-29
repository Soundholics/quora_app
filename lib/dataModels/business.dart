class Business {
  String businessEmail;
  String businessName;
  String photourl;
  String bio;

  Business({this.businessEmail, this.businessName, this.photourl, this.bio});

  Business.fromJson(Map<String, dynamic> json) {
    businessEmail = json['businessEmail'];
    businessName = json['businessName'];
    photourl = json['photourl'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessEmail'] = this.businessEmail;
    data['businessName'] = this.businessName;
    data['photourl'] = this.photourl;
    data['bio'] = this.bio;
    return data;
  }
}
