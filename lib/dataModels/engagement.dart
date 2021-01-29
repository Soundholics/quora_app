class Engagement {
  int engagementId;
  String userBussinessEmail;
  String secondaryUserEmail;
  bool isApproved;

  // TODO: Verity the key's from backend team while integration

  Engagement(
      {this.engagementId,
      this.userBussinessEmail,
      this.secondaryUserEmail,
      this.isApproved});

  Engagement.fromJson(Map<String, dynamic> json) {
    engagementId = json['engagementId'];
    userBussinessEmail = json['userBussinessEmail'];
    secondaryUserEmail = json['secondaryUserEmail'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['engagementId'] = this.engagementId;
    data['userBussinessEmail'] = this.userBussinessEmail;
    data['secondaryUserEmail'] = this.secondaryUserEmail;
    data['isApproved'] = this.isApproved;
    return data;
  }
}
