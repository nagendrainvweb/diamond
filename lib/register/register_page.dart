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
  String _chosenValue = Constants.COMPANY;

  _getRegisterWidget() {
    if (_chosenValue == Constants.COMPANY) {
      return CompanyRegisterWidget();
    }
    if (_chosenValue == Constants.AGENT) {
      return AgentRegistrationWidget();
    }
    if (_chosenValue == Constants.ASSERTER) {
      return AssorterRegisterWidget();
    }
    return CompanyRegisterWidget();
  }

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
                Text(
                  "Register as : ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.mainLightColor),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
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
          ),
          SizedBox(
            height: 20,
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
                // child: CompanyRegisterWidget(),
                child: _getRegisterWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
