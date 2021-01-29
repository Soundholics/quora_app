class QuestionForFeed {
  int questionId;
  String questionString;
  String useremail;
  String createdOn;
  String category;
  String topAnswer;
  String topAnswerBy;

  QuestionForFeed(
      {this.questionId,
      this.questionString,
      this.topAnswerBy,
      this.useremail,
      this.createdOn,
      this.category,
      this.topAnswer});

  QuestionForFeed.fromJson(Map<String, dynamic> json) {
    topAnswerBy = json['topAnswerBy'];
    questionId = json['questionId'];
    questionString = json['questionString'];
    useremail = json['useremail'];
    createdOn = json['createdOn'];
    category = json['category'];
    topAnswer = json['topAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['questionString'] = this.questionString;
    data['useremail'] = this.useremail;
    data['createdOn'] = this.createdOn;
    data['category'] = this.category;
    data['topAnswer'] = this.topAnswer;
    data['topAnswerBy'] = this.topAnswerBy;
    return data;
  }
}
