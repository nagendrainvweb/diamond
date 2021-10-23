import 'package:flutter/material.dart';

class AssorterModal {
  int id;
  String userId;
  String name;
  String mobile;
  String email;
  bool emailVerified;

  AssorterModal(
      {this.id,this.userId, this.name, this.mobile, this.email, this.emailVerified});

  AssorterModal.fromJson(Map<String, dynamic> json) {
    id = json['assorter_id'];
    userId = json['user_id'].toString();
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    emailVerified = json["emailVerified"];
  }


    AssorterModal.fromGetJson(Map<String, dynamic> json) {
    id = json['assorter_id'];
    userId = json['user_id'].toString();
    name = json['assorter_details']['name'];
    mobile = json['assorter_details']['user_profiles'][0]['mobile'];
    email = json['assorter_details']['email'];
    emailVerified = json["emailVerified"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assorter_id'] = this.id;
    data['user_id'] = this.userId;
    data['assorter_name'] = this.name;
    data['assorter_mobile'] = this.mobile;
    data['assorter_email'] = this.email;
    data["emailVerified"] = this.emailVerified;
    return data;
  }
}
