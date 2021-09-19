import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';

class AddressFormWidget extends StatefulWidget {
  AddressFormWidget({
    Key key,
    this.data,
    this.onSubmitClicked,
    this.showTopBar = true,
  }) : super(key: key);

  final AddressData data;
  final Function onSubmitClicked;
  final bool showTopBar;

  @override
  _AddressFormWidgetState createState() => _AddressFormWidgetState();
}

class _AddressFormWidgetState extends State<AddressFormWidget> with AppHelper {
  final TextEditingController _flatGalaNoController = TextEditingController();
  final TextEditingController _buildingNoController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _stateController = TextEditingController();

  bool flatGalaErro = false;
  bool buildingError = false;
  bool addressError = false;
  bool areaError = false;
  bool pincodeError = false;
  bool cityError = false;
  bool stateError = false;

  String _selectedType = Constants.WORK;

  AddressData _addressData;
  final ApiService _apiService = locator<ApiService>();

  @override
  void initState() {
    _addressData = widget.data == null ? AddressData() : widget.data;
    _selectedType =
        widget.data == null ? Constants.WORK : widget.data.addressType;
    _flatGalaNoController.text =
        widget.data != null ? widget.data.flatGalaNumber : "";
    _buildingNoController.text =
        widget.data != null ? widget.data.buildingNumber : "";
    _addressController.text = widget.data != null ? widget.data.address : "";
    _areaController.text = widget.data != null ? widget.data.area : "";
    _pincodeController.text = widget.data != null ? widget.data.pincode : "";
    _cityController.text = widget.data != null ? widget.data.city : "";
    _stateController.text = widget.data != null ? widget.data.state : "";
    super.initState();
  }

  _fetchCityState(String pincode) async {
    progressDialog("Please wait..", context);
    try {
      final response = await _apiService.fetchCityState(pincode);
      setState(() {
        _cityController.text = response[Constants.CITY];
        _stateController.text = response[Constants.STATE];
        _addressData.state = _stateController.text;
        _addressData.city = _cityController.text;
      });
      hideProgressDialog(context);
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          (widget.showTopBar)
              ? Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        // vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Address",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: AddressTypeWidget(
                        text: "WORK",
                        onClick: () {
                          setState(() {
                            _selectedType = Constants.WORK;
                          });
                        },
                        color: _selectedType == Constants.WORK
                            ? AppColors.mainLightColor
                            : AppColors.whiteColor,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AddressTypeWidget(
                        text: "OFFICE",
                        onClick: () {
                          setState(() {
                            _selectedType = Constants.OFFICE;
                          });
                        },
                        color: _selectedType == Constants.OFFICE
                            ? AppColors.mainLightColor
                            : AppColors.whiteColor,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AddressTypeWidget(
                        text: "HOME",
                        onClick: () {
                          setState(() {
                            _selectedType = Constants.HOME;
                          });
                        },
                        color: _selectedType == Constants.HOME
                            ? AppColors.mainLightColor
                            : AppColors.whiteColor,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AddressTypeWidget(
                        text: "OTHER",
                        onClick: () {
                          setState(() {
                            _selectedType = Constants.OTHER;
                          });
                        },
                        color: _selectedType == Constants.OTHER
                            ? AppColors.mainLightColor
                            : AppColors.whiteColor,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: RegisterTextfield(
                      text: "Gala/Flat No*",
                      controller: _flatGalaNoController,
                      textInputType: TextInputType.name,
                      onChanged: (String value) {
                        _addressData.flatGalaNumber = value;
                        setState(() {
                          flatGalaErro = value.isEmpty;
                        });
                      },
                      errorText:
                          flatGalaErro ? "Please Enter Valid Details" : null,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: RegisterTextfield(
                      text: "Building Name*",
                      controller: _buildingNoController,
                      textInputType: TextInputType.name,
                      onChanged: (String value) {
                        _addressData.buildingNumber = value;
                        setState(() {
                          buildingError = value.isEmpty;
                        });
                      },
                      errorText: flatGalaErro
                          ? "Please Enter Valid Building Name"
                          : null,
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Address*",
                  controller: _addressController,
                  textInputType: TextInputType.name,
                  onChanged: (String value) {
                    _addressData.address = value;
                    setState(() {
                      addressError =
                          !RegExp(CommonPattern.addressRegex).hasMatch(value);
                    });
                  },
                  errorText: addressError ? "Please Enter Valid Address" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Area",
                  controller: _areaController,
                  textInputType: TextInputType.name,
                  onChanged: (String value) {
                    _addressData.area = value;
                    setState(() {
                      areaError = (value.isEmpty)
                          ? false
                          : !RegExp(CommonPattern.name_regex).hasMatch(value);
                    });
                  },
                  errorText: areaError ? "Please Enter Valid Area" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Pincode*",
                  controller: _pincodeController,
                  textInputType: TextInputType.number,
                  onChanged: (String value) {
                    _addressData.pincode = value;
                    setState(() {
                      pincodeError =
                          !RegExp(CommonPattern.pincodeRegex).hasMatch(value);
                    });
                    if (!pincodeError && value.length == 6) {
                      _fetchCityState(value);
                    }
                  },
                  errorText:
                      pincodeError ? "Please Enter Valid Pincodde" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RegisterTextfield(
                        text: "City",
                        controller: _cityController,
                        enable: false,
                        textInputType: TextInputType.name,
                        onChanged: (String value) {
                          _addressData.city = value;
                          setState(() {
                            cityError = (value.isEmpty)
                                ? false
                                : !RegExp(CommonPattern.name_regex)
                                    .hasMatch(value);
                          });
                        },
                        errorText: cityError ? "Please Enter Valid City" : null,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: RegisterTextfield(
                        text: "State",
                        enable: false,
                        controller: _stateController,
                        textInputType: TextInputType.name,
                        onChanged: (String value) {
                          _addressData.state = value;
                          setState(() {
                            stateError = (value.isEmpty)
                                ? false
                                : !RegExp(CommonPattern.name_regex)
                                    .hasMatch(value);
                          });
                        },
                        errorText:
                            stateError ? "Please Enter Valid State" : null,
                      ),
                    ),
                  ],
                ),
              
             (widget.showTopBar)?   Column(
               children: [
                   SizedBox(
                  height: 20,
                ),
                 ButtonView(
                      buttonText: "SUBMIT",
                      color: AppColors.mainLightColor,
                      onPressed: () {
                        _addressData.addressType = _selectedType;
                        Navigator.pop(context);
                        widget.onSubmitClicked(_addressData);
                      },
                    ),
               ],
             ):Container(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressTypeWidget extends StatelessWidget {
  final onClick;
  final color;
  final text;

  const AddressTypeWidget({Key key, this.onClick, this.color, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.grey400, width: 0.8),
          color: color,
        ),
        child: Center(child: Text("$text", textScaleFactor: 0.8)),
      ),
    );
  }
}
