class AnswerInteraction {
  int interactionId;
  int answerId;
  String useremail;
  String type; // would be "up" or "down"

  AnswerInteraction(
      {this.interactionId, this.answerId, this.useremail, this.type});

  AnswerInteraction.fromJson(Map<String, dynamic> json) {
    interactionId = json['interactionId'];
    answerId = json['answerId'];
    useremail = json['useremail'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['interactionId'] = this.interactionId;
    data['answerId'] = this.answerId;
    data['useremail'] = this.useremail;
    data['type'] = this.type;
    return data;
  }
}
