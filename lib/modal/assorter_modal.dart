import 'package:flutter/material.dart';

class AssorterModal {
  int id;
  String name;
  String mobile;
  String email;

  AssorterModal({this.id, this.name, this.mobile, this.email});

  AssorterModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}
