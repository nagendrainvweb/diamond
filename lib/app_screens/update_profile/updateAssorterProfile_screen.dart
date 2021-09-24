import 'package:diamon_assorter/app_widget/address_form_widget.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
import 'package:diamon_assorter/app_widget/doc_view_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/app_widget/top_left_header_widget.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class UpdateAssorterProfile extends StatefulWidget {
  @override
  _UpdateAssorterProfileState createState() => _UpdateAssorterProfileState();
}

class _UpdateAssorterProfileState extends State<UpdateAssorterProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              RegisterTextfield(
                text: "type",
                textInputType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              RegisterTextfield(
                text: "Mobile*",
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              RegisterTextfield(
                text: "Email*",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              RegisterTextfield(
                text: "Password",
                textInputType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              RegisterTextfield(
                text: "Please Select Agent",
                textInputType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: RegisterTextfield(
                      text: "Experience*",
                      textInputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Text(
                    "In Years",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  CircularBorder(
                    child: AddressFormWidget(
                      showPadding: false,
                      showTopBar: false,
                    ),
                  ),
                  TopLeftHeaderWidget(
                    text: "Address",
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 13, bottom: 8, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: AddressFormWidget(
                        showTopBar: false,
                        // data: model.assorterAddressData,
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.all(
                      5,
                    ),
                    color: AppColors.whiteColor,
                    child: Text(
                      "Address",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: DocViewWidget(
                          title: "Attch BOB id Card",
                          height: (MediaQuery.of(context).size.width - 70) / 3,
                          // file: model.idCard,
                          // onSelectImage: () {
                          //   model.selectImage(
                          //     context,
                          //     (source) {
                          //       model.pickImage(source, Constants.BOB_ID);
                          //     },
                          //   );
                          // },
                          // onDeleteImage: () {
                          //   model.removeImage(Constants.BOB_ID);
                          // },
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: DocViewWidget(
                          title: "Attch Aadhar card",
                          height: (MediaQuery.of(context).size.width - 70) / 3,
                          // file: model.aadharCard,
                          // onSelectImage: () {
                          //   model.selectImage(
                          //     context,
                          //     (source) {
                          //       model.pickImage(source, Constants.AADHAR_CARD);
                          //     },
                          //   );
                          // },
                          // onDeleteImage: () {
                          //   model.removeImage(Constants.AADHAR_CARD);
                          // },
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: DocViewWidget(
                          title: "Attch Passport",
                          height: (MediaQuery.of(context).size.width - 70) / 3,
                          // file: model.passport,
                          // onSelectImage: () {
                          //   model.selectImage(
                          //     context,
                          //     (source) {
                          //       model.pickImage(source, Constants.PASSPORT);
                          //     },
                          //   );
                          // },
                          // onDeleteImage: () {
                          //   model.removeImage(Constants.PASSPORT);
                          // },
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                    ),
                    padding: EdgeInsets.all(
                      5,
                    ),
                    color: AppColors.whiteColor,
                    child: Text(
                      "Attach Documents",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    "Service :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // model.setServiceValue(1);
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: 1,
                                        onChanged: (value) {
                                          // model.setServiceValue(value);
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Expanded(child: Text("Numbering"))
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // model.setServiceValue(2);
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 2,
                                        groupValue: 1,
                                        onChanged: (value) {
                                          // model.setServiceValue(value);
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Expanded(child: Text("Ghodhi"))
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // model.setServiceValue(3);
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 3,
                                        groupValue: 1,
                                        onChanged: (value) {
                                          // model.setServiceValue(value);
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Expanded(child: Text("Numbering/Ghodhi"))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    "Speed :",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // model.setSpeedValue(1);
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 1,
                                        groupValue: 1,
                                        onChanged: (value) {
                                          // model.setSpeedValue(value);
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Expanded(child: Text("Slow"))
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // model.setSpeedValue(2);
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 2,
                                        groupValue: 1,
                                        onChanged: (value) {
                                          // model.setSpeedValue(value);
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Expanded(child: Text("Medium"))
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // model.setSpeedValue(3);
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value: 3,
                                        groupValue: 1,
                                        onChanged: (value) {
                                          // model.setSpeedValue(value);
                                        },
                                        activeColor: Colors.blue,
                                      ),
                                      Expanded(child: Text("Fast"))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                    ),
                    padding: EdgeInsets.all(
                      5,
                    ),
                    color: AppColors.whiteColor,
                    child: Text(
                      "Others",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
