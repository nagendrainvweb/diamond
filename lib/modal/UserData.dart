import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';

class UserData {
  String registrationAs;
  String name;
  String companyName;
  String telephone;
  String intercom;
  String mobile;
  String email;
  String password;
  List<AddressData> address;
  ContactPerson contactPerson;
  String commissionPerAssorter;
  String bdbIdCard;
  String aadharCard;
  String passport;
  List<AssorterModal> assorters;
  int agent;
  String experiance;
  String service;
  String speed;

  UserData(
      {this.registrationAs,
      this.name,
      this.companyName,
      this.telephone,
      this.intercom,
      this.password,
      this.mobile,
      this.email,
      this.address,
      this.contactPerson,
      this.commissionPerAssorter,
      this.bdbIdCard,
      this.aadharCard,
      this.passport,
      this.assorters,
      this.agent,
      this.experiance,
      this.service,
      this.speed});

  UserData.fromJson(Map<String, dynamic> json) {
    registrationAs = json['registration_as'];
    name = json['name'];
    companyName = json['company_name'];
    telephone = json['telephone'];
    intercom = json['intercom'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    if (json['address'] != null) {
      address = new List<AddressData>();
      json['address'].forEach((v) {
        address.add(new AddressData.fromJson(v));
      });
    }
    contactPerson = json['contact_person'] != null
        ? new ContactPerson.fromJson(json['contact_person'])
        : null;
    commissionPerAssorter = json['commission_per_assorter'];
    bdbIdCard = json['bdb_id_card'];
    aadharCard = json['aadhar_card'];
    passport = json['passport'];
    if (json['assorters'] != null) {
      assorters = new List<AssorterModal>();
      json['assorters'].forEach((v) {
        assorters.add(new AssorterModal.fromJson(v));
      });
    }
    agent = json['agent'];
    experiance = json['experiance'];
    service = json['service'];
    speed = json['speed'];
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
    if (this.address != null) {
      data['address'] = this.address.map((v) => v.toJson()).toList();
    }
    if (this.contactPerson != null) {
      data['contact_person'] = this.contactPerson.toJson();
    }
    data['commission_per_assorter'] = this.commissionPerAssorter;
    data['bdb_id_card'] = this.bdbIdCard;
    data['aadhar_card'] = this.aadharCard;
    data['passport'] = this.passport;
    if (this.assorters != null) {
      data['assorters'] = this.assorters.map((v) => v.toJson()).toList();
    }
    data['agent'] = this.agent;
    data['experiance'] = this.experiance;
    data['service'] = this.service;
    data['speed'] = this.speed;
    return data;
  }
}

class Address {
  String flatGalaNumber;
  String buildingNumber;
  String address;
  String addressType;
  String area;
  String city;
  String pincode;

  Address(
      {this.flatGalaNumber,
      this.buildingNumber,
      this.address,
      this.addressType,
      this.area,
      this.city,
      this.pincode});

  Address.fromJson(Map<String, dynamic> json) {
    flatGalaNumber = json['flat_gala_number'];
    buildingNumber = json['building_number'];
    address = json['address'];
    addressType = json['address_type'];
    area = json['area'];
    city = json['city'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flat_gala_number'] = this.flatGalaNumber;
    data['building_number'] = this.buildingNumber;
    data['address'] = this.address;
    data['address_type'] = this.addressType;
    data['area'] = this.area;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    return data;
  }
}

class ContactPerson {
  String contactPersonName;
  String contactPersonEmail;
  String contactPersonMobile;

  ContactPerson(
      {this.contactPersonName,
      this.contactPersonEmail,
      this.contactPersonMobile});

  ContactPerson.fromJson(Map<String, dynamic> json) {
    contactPersonName = json['contact_person_name'];
    contactPersonEmail = json['contact_person_email'];
    contactPersonMobile = json['contact_person_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_email'] = this.contactPersonEmail;
    data['contact_person_mobile'] = this.contactPersonMobile;
    return data;
  }
}
