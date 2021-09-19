class AgentData {
  int id;
  int userId;
  int agentId;
  String createdAt;
  String updatedAt;
  String agentName;

  AgentData(
      {this.id,
      this.userId,
      this.agentId,
      this.createdAt,
      this.updatedAt,
      this.agentName});

  AgentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    agentId = json['agent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    agentName = json['agent_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['agent_id'] = this.agentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['agent_name'] = this.agentName;
    return data;
  }
}
