class Answer {
  int questionId;
  int answerId;
  String answerString;
  String userBusinessEmail;
  bool isApproved;
  bool isBusiness;
  String answeredOn;

  Answer(
      {this.questionId,
      this.answerId,
      this.answerString,
      this.userBusinessEmail,
      this.isApproved,
      this.isBusiness,
      this.answeredOn});

  Answer.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    answerId = json['answerId'];
    answerString = json['answerString'];
    userBusinessEmail = json['userBusinessEmail'];
    isApproved = json['isApproved'];
    isBusiness = json['isBusiness'];
    answeredOn = json['answeredOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['answerId'] = this.answerId;
    data['answerString'] = this.answerString;
    data['userBusinessEmail'] = this.userBusinessEmail;
    data['isApproved'] = this.isApproved;
    data['isBusiness'] = this.isBusiness;
    data['answeredOn'] = this.answeredOn;
    return data;
  }
}
