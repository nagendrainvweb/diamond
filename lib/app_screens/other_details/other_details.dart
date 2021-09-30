import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class OtherDetails extends StatefulWidget {
  const OtherDetails({Key key}) : super(key: key);

  @override
  _OtherDetailsState createState() => _OtherDetailsState();
}

class _OtherDetailsState extends State<OtherDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppAppBar(
            showBackButton: true,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical:20,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          CircularBorder(
                            child: Column(
                              children: [
                                RegisterTextfield(
                                  text: "Name",
                                  textInputType: TextInputType.name,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RegisterTextfield(
                                        text: "Mobile",
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                RegisterTextfield(
                                  text: "Email",
                                  textInputType: TextInputType.emailAddress,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              bottom: 20,
                            ),
                            padding: EdgeInsets.all(
                              5,
                            ),
                            color: AppColors.whiteColor,
                            child: Text(
                              "Contact Person",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
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
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
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
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: 3,
                                              groupValue: 1,
                                              onChanged: (value) {
                                                // model.setServiceValue(value);
                                              },
                                              activeColor: Colors.blue,
                                            ),
                                            Expanded(
                                                child: Text("Numbering/Ghodhi"))
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
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
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
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
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
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
            ),
          ),
        ],
      ),
    );
  }
}
