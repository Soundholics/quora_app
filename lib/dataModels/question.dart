class Question {
  int questionId;
  String questionString;
  String useremail;
  bool isAnswered;
  String createdOn;
  String category;

  Question(
      {this.questionId,
      this.questionString,
      this.useremail,
      this.isAnswered,
      this.createdOn,
      this.category});

  Question.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    questionString = json['questionString'];
    useremail = json['useremail'];
    isAnswered = json['isAnswered'];
    createdOn = json['createdOn'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['questionString'] = this.questionString;
    data['useremail'] = this.useremail;
    data['isAnswered'] = this.isAnswered;
    data['createdOn'] = this.createdOn;
    data['category'] = this.category;
    return data;
  }
}
