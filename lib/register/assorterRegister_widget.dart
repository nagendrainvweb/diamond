import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/register/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class AssorterRegisterWidget extends StatefulWidget {
  const AssorterRegisterWidget({
    Key key,
  }) : super(key: key);


  @override
  _AssorterRegisterWidgetState createState() => _AssorterRegisterWidgetState();
}

class _AssorterRegisterWidgetState extends State<AssorterRegisterWidget> {
  var _serviceValue = 1;
  var _speedValue = 1;
  @override
  Widget build(BuildContext context) {
    var attachHeight = (MediaQuery.of(context).size.width - 70) / 3;

    return ListView(
      children: [
        RegisterTextfield(
          text: "Name",
          textInputType: TextInputType.name,
        ),
        SizedBox(
          height: 20,
        ),
        RegisterTextfield(
          text: "Mobile",
          textInputType: TextInputType.number,
        ),
        SizedBox(
          height: 20,
        ),
        RegisterTextfield(
          text: "Email",
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: RegisterTextfield(
                text: "Agent",
                textInputType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "Agent List/ Others",
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        RegisterTextfield(
          text: "Address",
          textInputType: TextInputType.name,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: RegisterTextfield(
                text: "Area",
                textInputType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: RegisterTextfield(
                text: "City",
                textInputType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: RegisterTextfield(
                text: "Pincode",
                textInputType: TextInputType.number,
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
                text: "Experience",
                textInputType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "In Years",
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
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: attachHeight,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Attach BDB Id Card",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: attachHeight,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Attach Adhar Card",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: attachHeight,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Attach Passport",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Service :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _serviceValue = 1;
                              });
                            },
                            child: Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: 1,
                                  groupValue: _serviceValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _serviceValue = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("Numbring")
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _serviceValue = 2;
                              });
                            },
                            child: Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: 2,
                                  groupValue: _serviceValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _serviceValue = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("Ghodhi")
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _serviceValue = 3;
                              });
                            },
                            child: Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: 3,
                                  groupValue: _serviceValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _serviceValue = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("Numbring/Ghodhi")
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Speed :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _speedValue = 1;
                              });
                            },
                            child: Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: 1,
                                  groupValue: _speedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _speedValue = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("Slow")
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _speedValue = 2;
                              });
                            },
                            child: Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: 2,
                                  groupValue: _speedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _speedValue = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("Medium")
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _speedValue = 3;
                              });
                            },
                            child: Row(
                              children: [
                                Radio(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: 3,
                                  groupValue: _speedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _speedValue = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                                Text("Fast")
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
        SizedBox(
          height: 20,
        ),
        ButtonView(
          buttonText: "Submit",
          onPressed: () {},
          color: AppColors.mainColor,
        ),
      ],
    );
  }
}
