class Items {
  String? reputationHistoryType;
  int? reputationChange;
  int? postId;
  int? creationDate;
  int? userId;

  Items(
      {this.reputationHistoryType,
      this.reputationChange,
      this.postId,
      this.creationDate,
      this.userId});

  Items.fromJson(Map<String, dynamic> json) {
    reputationHistoryType = json['reputation_history_type'];
    reputationChange = json['reputation_change'];
    postId = json['post_id'];
    creationDate = json['creation_date'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reputation_history_type'] = this.reputationHistoryType;
    data['reputation_change'] = this.reputationChange;
    data['post_id'] = this.postId;
    data['creation_date'] = this.creationDate;
    data['user_id'] = this.userId;
    return data;
  }
}
