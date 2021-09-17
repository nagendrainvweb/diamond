import 'package:diamon_assorter/modal/assorter_modal.dart';

class UserData {
  String registrationAs;
  String name;
  String companyName;
  String telephone;
  String intercom;
  String mobile;
  String email;
  String flatGalaNumber;
  String buildingNumber;
  String address;
  String addressType;
  String area;
  String city;
  String pincode;
  String workAddress;
  String officeAddress;
  String contactPersonName;
  String contactPersonEmail;
  String contactPersonMobile;
  String commissionPerAssorter;
  String bdbIdCard;
  String aadharCard;
  String passport;
  String password;
  List<AssorterModal> assorters;
  String assorterName;
  String assorterEmail;
  String assorterMobile;
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
      this.mobile,
      this.password,
      this.email,
      this.flatGalaNumber,
      this.buildingNumber,
      this.address,
      this.addressType,
      this.area,
      this.city,
      this.pincode,
      this.workAddress,
      this.officeAddress,
      this.contactPersonName,
      this.contactPersonEmail,
      this.contactPersonMobile,
      this.commissionPerAssorter,
      this.bdbIdCard,
      this.aadharCard,
      this.passport,
      this.assorters,
      this.assorterName,
      this.assorterEmail,
      this.assorterMobile,
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
    password = json["password"];
    flatGalaNumber = json['flat_gala_number'];
    buildingNumber = json['building_number'];
    address = json['address'];
    addressType = json['address_type'];
    area = json['area'];
    city = json['city'];
    pincode = json['pincode'];
    workAddress = json['work_address'];
    officeAddress = json['office_address'];
    contactPersonName = json['contact_person_name'];
    contactPersonEmail = json['contact_person_email'];
    contactPersonMobile = json['contact_person_mobile'];
    commissionPerAssorter = json['commission_per_assorter'];
    bdbIdCard = json['bdb_id_card'];
    aadharCard = json['aadhar_card'];
    passport = json['passport'];
    if (json['assorters'] != null) {
      assorters = new List<Null>();
      json['assorters'].forEach((v) {
        assorters.add(new AssorterModal.fromJson(v));
      });
    }
    assorterName = json['assorter_name'];
    assorterEmail = json['assorter_email'];
    assorterMobile = json['assorter_mobile'];
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
    data['flat_gala_number'] = this.flatGalaNumber;
    data['building_number'] = this.buildingNumber;
    data['address'] = this.address;
    data['address_type'] = this.addressType;
    data['area'] = this.area;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['work_address'] = this.workAddress;
    data['office_address'] = this.officeAddress;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_email'] = this.contactPersonEmail;
    data['contact_person_mobile'] = this.contactPersonMobile;
    data['commission_per_assorter'] = this.commissionPerAssorter;
    data['bdb_id_card'] = this.bdbIdCard;
    data['aadhar_card'] = this.aadharCard;
    data['passport'] = this.passport;
    if (this.assorters != null) {
      data['assorters'] =
          this.assorters.map((v) => AssorterModal().toJson()).toList();
    }
    data['assorter_name'] = this.assorterName;
    data['assorter_email'] = this.assorterEmail;
    data['assorter_mobile'] = this.assorterMobile;
    data['agent'] = this.agent;
    data['experiance'] = this.experiance;
    data['service'] = this.service;
    data['speed'] = this.speed;
    return data;
  }
}
