class UserEngagement {
  int followers;
  int followings;

  UserEngagement({this.followers, this.followings});

  UserEngagement.fromJson(Map<String, dynamic> json) {
    followers = json['followers'];
    followings = json['followings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followers'] = this.followers;
    data['followings'] = this.followings;
    return data;
  }
}
