import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/app_textfield.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/register/view/agentRegistration.dart';
import 'package:diamon_assorter/register/view/assorterRegister_widget.dart';
import 'package:diamon_assorter/register/view/companyRegistration.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String _chosenValue ;

  // _getRegisterWidget() {
  //   if (_chosenValue == Constants.COMPANY) {
  //     return CompanyRegisterWidget();
  //   }
  //   if (_chosenValue == Constants.AGENT) {
  //     return AgentRegistrationWidget();
  //   }
  //   if (_chosenValue == Constants.ASSERTER) {
  //     return AssorterRegisterWidget();
  //   }
  //   return CompanyRegisterWidget();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppAppBar(showBackButton: true),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
               children: [
              //   Text(
              //     "Register as : ",
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   SizedBox(
              //     width: 10,
              //   ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey500),
                        borderRadius: BorderRadius.circular(10),
                        ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      underline: Container(),
                      value: _chosenValue,
                      isExpanded: true,
                      hint: Text("Please Select Type"),
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
            ]
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                //child: AgentRegistrationWidget(),
                 child: CompanyRegisterWidget(),
               // child: _getRegisterWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
