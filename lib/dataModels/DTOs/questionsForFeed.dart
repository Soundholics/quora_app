class QuestionForFeed {
  String questionId;
  String questionString;
  String useremail;
  String createdOn;
  String category;
  String topAnswer;
  String topAnswerBy;
  int topAnswerUpvotes;
  int topAnswerDownvotes;
  String userReactionToAnswer; // can be up or down

  QuestionForFeed(
      {this.questionId,
      this.questionString,
      this.topAnswerDownvotes,
      this.userReactionToAnswer,
      this.topAnswerUpvotes,
      this.topAnswerBy,
      this.useremail,
      this.createdOn,
      this.category,
      this.topAnswer});

  QuestionForFeed.fromJson(Map<String, dynamic> json) {
    topAnswerUpvotes = json['up'];
    topAnswerDownvotes = json['down'];
    topAnswerBy = json['topAnswerBy'];
    questionId = json['questionId'];
    questionString = json['questionString'];
    useremail = json['userEmail'];
    createdOn = json['createdOn'];
    category = json['category'];
    topAnswer = json['answerString'];
    userReactionToAnswer = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['questionString'] = this.questionString;
    data['userEmail'] = this.useremail;
    data['createdOn'] = this.createdOn;
    data['category'] = this.category;
    data['answerString'] = this.topAnswer;
    data['topAnswerBy'] = this.topAnswerBy;
    return data;
  }
}
