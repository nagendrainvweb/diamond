import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class AddressRow extends StatelessWidget {
  AddressRow({
    Key key,
    this.data,
    this.onEditClicked,
    this.onDeleteClicked,
    this.enableFeild = false,
  }) : super(key: key);

  final AddressData data;
  final Function onEditClicked;
  final Function onDeleteClicked;
  final bool enableFeild;

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _flatGalaNoController = TextEditingController();
  final TextEditingController _buildingNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      _typeController.text = data.addressType;
      _flatGalaNoController.text = data.flatGalaNumber;
      _buildingNoController.text = data.buildingNumber;
      _addressController.text = data.address;
      _areaController.text = data.area;
      _pincodeController.text = data.pincode;
      _cityController.text = data.city;
      _stateController.text = data.state;
    }

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 8, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                // RegisterTextfield(
                //   text: "Address Type*",
                //   controller: _typeController,
                //   enable: enableFeild,
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                Row(
                  children: [
                    Expanded(
                        child: RegisterTextfield(
                      text: "Flat/Office No*",
                      controller: _flatGalaNoController,
                      enable: enableFeild,
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: RegisterTextfield(
                      text: "Building Name*",
                      controller: _buildingNoController,
                      enable: enableFeild,
                    ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Address*",
                  controller: _addressController,
                  enable: enableFeild,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RegisterTextfield(
                        text: "Area",
                        controller: _areaController,
                        enable: enableFeild,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: RegisterTextfield(
                        text: "Pincode*",
                        controller: _pincodeController,
                        enable: enableFeild,
                      ),
                    ),
                  ],
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
                        enable: enableFeild,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: RegisterTextfield(
                        text: "State",
                        enable: enableFeild,
                        controller: _stateController,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          padding: EdgeInsets.all(
            5,
          ),
          color: AppColors.whiteColor,
          child: Text(
           // (data != null) ? "Address ${data.id}" : "Address",
           "TYPE - "+_typeController.text.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 18
            ),
          ),
        ),
        EditDeleteOptionWidget(
            onEditClicked: onEditClicked, onDeleteClicked: onDeleteClicked),
      ],
    );
  }
}

class EditDeleteOptionWidget extends StatelessWidget {
  const EditDeleteOptionWidget({
    Key key,
    @required this.onEditClicked,
    @required this.onDeleteClicked,
    this.showEdit = true,
    this.showDelete = true,
  }) : super(key: key);

  final Function onEditClicked;
  final Function onDeleteClicked;
  final bool showEdit;
  final bool showDelete;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          (showEdit)
              ? InkWell(
                  onTap: () {
                    onEditClicked();
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grey400),
                        color: AppColors.whiteColor,
                      ),
                      child: Icon(
                        Icons.edit_outlined,
                        color: AppColors.grey600,
                        size: 20,
                      )),
                )
              : Container(),
          (showDelete)
              ? InkWell(
                  onTap: () {
                    onDeleteClicked();
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grey400),
                        color: AppColors.whiteColor,
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.grey600,
                        size: 20,
                      )),
                )
              : Container(),
        ],
      ),
    );
  }
}
