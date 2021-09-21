import 'package:diamon_assorter/util/common_pattern.dart';

class AddressData {
  int id;
  String flatGalaNumber = "";
  String buildingNumber = "";
  String address = "";
  String addressType = "";
  String area = "";
  String city = "";
  String state = "";
  String pincode = "";

  AddressData(
      {this.id,
      this.flatGalaNumber,
      this.buildingNumber,
      this.address,
      this.addressType,
      this.area,
      this.city,
      this.state,
      this.pincode});

  AddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flatGalaNumber = json['flat_gala_number'];
    buildingNumber = json['building_number'];
    address = json['address'];
    addressType = json['address_type'];
    area = json['area'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['flat_gala_number'] = this.flatGalaNumber;
    data['building_number'] = this.buildingNumber;
    data['address'] = this.address;
    data['address_type'] = this.addressType.toLowerCase();
    data['area'] = this.area;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }

  bool validateAddress({Function onError}) {
    if ( flatGalaNumber ==null || flatGalaNumber.isEmpty){
      onError("Please Enter valid flat/Gala No field.");
      return false;
    }
    if ( buildingNumber ==null || buildingNumber.isEmpty){
      onError("Please Enter valid Building name field.");
      return false;
    }
    if ( address==null || !RegExp(CommonPattern.addressRegex).hasMatch(address)) {
      onError("Please Enter valid Address field.");
      return false;
    }
    if (area == null || area.isEmpty) {
      onError("Please Enter valid Area field.");
      return false;
    }
    if (pincode == null || !RegExp(CommonPattern.pincodeRegex).hasMatch(pincode)) {
      onError("Please Enter valid Pincode field.");
      return false;
    }
    if (state == null || state.isEmpty) {
      onError("Please Enter valid State field.");
      return false;
    }
    if (city == null || city.isEmpty) {
      onError("Please Enter valid City field.");
      return false;
    }
    return true;
  }
}
