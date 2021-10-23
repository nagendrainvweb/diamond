import 'dart:io';

import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';

class UserData {
  int id;
  int userId;
  String registrationAs;
  String companyName;
  String otp;
  String password;
  String name;
  String email;
  String telephone;
  String intercom;
  String mobile;
  String experience;
  String bdbIdCard;
  String aadharCard;
  List<AddressData> address;
  List<AssorterModal> assorters;
  String passport;
  String service;
  int agent;
  String speed;
  String commission_per_assorter;
  int status;
  ContactPerson contactPerson;

  UserData({
    this.id,
    this.userId,
    this.registrationAs,
    this.name,
    this.email,
    this.agent,
    this.companyName,
    this.telephone,
    this.otp,
    this.intercom,
    this.contactPerson,
    this.mobile,
    this.experience,
    this.bdbIdCard,
    this.aadharCard,
    this.passport,
    this.service,
    this.speed,
    this.commission_per_assorter,
    this.status,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    registrationAs = json['registrationAs'];
    companyName = json['company_name'];
    telephone = json['telephone'];
    intercom = json['intercom'];
    mobile = json['mobile'];
    experience = json['experience'].toString();
    bdbIdCard = json['bdb_id_card'];
    aadharCard = json['aadhar_card'];
    passport = json['passport'];
    service = json['service'];
    speed = json['speed'];
    commission_per_assorter = json['commission_per_assorter'].toString();
    status = json['status'];
    contactPerson = json['contact_person_details'] != null
        ? new ContactPerson.fromJson(json['contact_person_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registration_as'] = this.registrationAs;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['telephone'] = this.telephone;
    data['intercom'] = this.intercom;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;

    if (this.contactPerson != null) {
      data['contact_person'] = this.contactPerson.toJson();
    }
    data['commission_per_assorter'] = this.commission_per_assorter;
    data['bdb_id_card'] = this.bdbIdCard;
    data['aadhar_card'] = this.aadharCard;
    data['passport'] = this.passport;

    data['agent'] = this.agent;
    data['experiance'] = this.experience.toString();
    data['service'] = this.service;
    data['speed'] = this.speed;
    //
    data['registration_as'] = this.registrationAs;
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['company_name'] = this.companyName;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['intercom'] = this.intercom;
    // data['contact_person'] = this.contactPerson;
    data['mobile'] = this.mobile;
    data['experience'] = this.experience;
    data['bdb_id_card'] = this.bdbIdCard;
    data['aadhar_card'] = this.aadharCard;
    data['passport'] = this.passport;
    data['service'] = this.service;
    data['speed'] = this.speed;
    data['commission_per_assorter'] = this.commission_per_assorter;
    data['status'] = this.status;
    data['address'] = [];
    data['assorters'] = [];

    return data;
  }

  // setAddressFromJson(Map<String, dynamic> json) {
  //   if (json['address'] != null) {
  //     address = new List<AddressData>();
  //     json['address'].forEach((v) {
  //       address.add(new AddressData.fromJson(v));
  //     });
  //   }
  // }

  // setAssorterFromJson(Map<String, dynamic> json) {
  //   if (json['assorters'] != null) {
  //     assorters = new List<AssorterModal>();
  //     json['assorters'].forEach((v) {
  //       assorters.add(new AssorterModal.fromJson(v));
  //     }); data['deleted_at'] = this.deletedAt;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.contactPersonDetails != null) {
  //     data['contact_person_details'] = this.contactPersonDetails.toJson();
  //   }
  //   }
  // }

  Map<String, dynamic> toContactPersonJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.id.toString();
    data['user_id'] = this.userId.toString();
    if (this.contactPerson != null) {
      data['contact_person'] = this.contactPerson.toJson();
    }
    return data;
  }

  Map<String, dynamic> toAgentjson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.id.toString();
    data['user_id'] = this.userId.toString();
    data['commission_per_assorter'] = this.commission_per_assorter.toString();
    return data;
  }

  Map<String, dynamic> toImageUpdatejson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.id.toString();
    data['user_id'] = this.userId.toString();
    data['bdb_id_card'] = this.bdbIdCard ?? "";
    data['aadhar_card'] = this.aadharCard ?? "";
    data['passport'] = this.passport ?? "";
    return data;
  }

  Map<String, dynamic> toAssorterjson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_id'] = this.id.toString();
    data['user_id'] = this.userId.toString();
    data['service'] = this.service.toString();
    data['speed'] = this.speed.toString();
    data['experience'] = this.experience.toString();
    return data;
  }
}

class ContactPerson {
  String contactPersonName;
  String contactPersonEmail;
  String contactPersonMobile;
  int id;

  ContactPerson(
      {this.contactPersonName,
      this.id,
      this.contactPersonEmail,
      this.contactPersonMobile});

  ContactPerson.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    contactPersonName = json['contact_person_name'];
    contactPersonEmail = json['contact_person_email'];
    contactPersonMobile = json['contact_person_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_email'] = this.contactPersonEmail;
    data['contact_person_mobile'] = this.contactPersonMobile;
    return data;
  }
}
