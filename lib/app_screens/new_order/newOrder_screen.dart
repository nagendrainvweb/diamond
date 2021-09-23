import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:flutter/material.dart';

class NewOrderPage extends StatefulWidget {
  @override
  _NewOrderPageState createState() => _NewOrderPageState();
}

class _NewOrderPageState extends State<NewOrderPage> {
  String _chosenValue;
  int _selectedService;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppAppBar(),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                RegisterTextfield(
                  text: "New Order",
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: RegisterTextfield(
                    text: "Date",
                    enable: false,
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RegisterTextfield(
                        text: "From Time",
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: RegisterTextfield(
                        text: "To Time",
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
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyColor),
                          borderRadius: BorderRadius.circular(12),
                          // color: AppColors.mainLightColor,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          hint: Text(
                            "Please Select Place",
                          ),
                          underline: Container(),
                          value: _chosenValue,
                          isExpanded: true,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          items: <String>[
                            Constants.COMPANY,
                            Constants.AGENT,
                            Constants.ASSERTER,
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),

                          onChanged: (String value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "No. of Persons",
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Service :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedService = 1;
                                });
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 1,
                                    groupValue: _selectedService,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedService = 1;
                                      });
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Ghodi",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedService = 2;
                                });
                              },
                              child: Row(
                                children: [
                                  Radio(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: 2,
                                    groupValue: _selectedService,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedService = 2;
                                      });
                                    },
                                    activeColor: Colors.blue,
                                  ),
                                  Expanded(child: Text("Numbering"))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Note",
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonView(
                        buttonText: "Submit",
                        color: AppColors.mainColor,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: ButtonView(
                      buttonText: "Clear",
                      color: AppColors.mainColor,
                      onPressed: () {},
                    ))
                  ],
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
