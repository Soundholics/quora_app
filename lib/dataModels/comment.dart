class Comment {
  int commentId;
  int answerId;
  String useremail;
  String commentString;
  int childOf;
  String commentedOn;

  Comment(
      {this.commentId,
      this.answerId,
      this.useremail,
      this.commentString,
      this.childOf,
      this.commentedOn});

  Comment.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    answerId = json['answerId'];
    useremail = json['useremail'];
    commentString = json['commentString'];
    childOf = json['childOf'];
    commentedOn = json['commentedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['answerId'] = this.answerId;
    data['useremail'] = this.useremail;
    data['commentString'] = this.commentString;
    data['childOf'] = this.childOf;
    data['commentedOn'] = this.commentedOn;
    return data;
  }
}
