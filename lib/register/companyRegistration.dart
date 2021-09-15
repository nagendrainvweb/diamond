import 'package:diamon_assorter/app_screens/dashboard/dashboard.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/register/registerViewModel/companyRegisterViewModel.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class CompanyRegisterWidget extends StatefulWidget {
  const CompanyRegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  _CompanyRegisterWidgetState createState() => _CompanyRegisterWidgetState();
}

class _CompanyRegisterWidgetState extends State<CompanyRegisterWidget> {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyRegisterViewModel>.reactive(
      viewModelBuilder: ()=> CompanyRegisterViewModel(),
      builder: (_,model,child)=>
       ListView(
        children: [
          RegisterTextfield(
            text: "Name*",
            controller: model.nameController,
            textInputType: TextInputType.name,
            onChanged: (String value){
               model.nameError = !RegExp(CommonPattern.name_regex).hasMatch(value);
               model.notifyListeners();
            } ,
            errorText: model.nameError ? "Please Enter Valid Name":null,
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Company Name",
            controller: model.companyNameController,
            textInputType: TextInputType.name,
             onChanged:(String value){
               model.companyNameError = (value.isNotEmpty)? !RegExp(CommonPattern.addressRegex).hasMatch(value):false;
               model.notifyListeners();
            },
            errorText: model.companyNameError ? "Please Enter Valid Company Name":null,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: RegisterTextfield(
                  text: "Mobile No*",
                  controller: model.mobileController,
                  textInputType: TextInputType.number,
                   onChanged: (String value){
               model.mobileError = !RegExp(CommonPattern.mobile_regex).hasMatch(value);
               model.notifyListeners();
            },
            errorText: model.mobileError ? "Please Enter Valid Mobile No.":null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RegisterTextfield(
                  text: "Intercom",
                  controller: model.interComController,
                  textInputType: TextInputType.text,
                   onChanged: (String value){
               model.intercomError = (value.isNotEmpty)? !RegExp(CommonPattern.addressRegex).hasMatch(value):false;
               model.notifyListeners();
            },
            errorText: model.intercomError ? "Please Enter Valid Intercom":null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Email*",
            controller: model.emailController,
            textInputType: TextInputType.emailAddress,
             onChanged: (String value){
               model.emailError = !RegExp(CommonPattern.email_regex).hasMatch(value);
               model.notifyListeners();
            },
            errorText: model.emailError ? "Please Enter Valid Email Id":null,
          ),
          
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Address",
            controller: model.addressController,
            textInputType: TextInputType.name,
             onChanged: (String value){
               model.addreessError = (value.isNotEmpty)?!RegExp(CommonPattern.addressRegex).hasMatch(value):false;
               model.notifyListeners();
            },
            errorText: model.addreessError ? "Please Enter Valid Address":null,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: RegisterTextfield(
                  text: "Area",
                  controller: model.areaController,
                  textInputType: TextInputType.name,
                   onChanged: (String value){
               model.areaError = (value.isNotEmpty)? !RegExp(CommonPattern.name_regex).hasMatch(value):false;
               model.notifyListeners();
            } ,
            errorText: model.areaError ? "Please Enter Valid Area":null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RegisterTextfield(
                  text: "City",
                  controller: model.cityController,
                  textInputType: TextInputType.name,
                   onChanged: (String value)=>(String value){
               model.cityError = (value.isNotEmpty)? !RegExp(CommonPattern.name_regex).hasMatch(value):false;
               model.notifyListeners();
            } ,
            errorText: model.cityError? "Please Enter Valid City":null,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: RegisterTextfield(
                  text: "Pincode",
                  controller: model.pincodeController,
                  textInputType: TextInputType.number,
                   onChanged: (String value){
               model.pincodeError = (value.isNotEmpty)? !RegExp(CommonPattern.pincodeRegex).hasMatch(value):false;
               model.notifyListeners();
            } ,
            errorText: model.pincodeError? "Please Enter Valid Pincode":null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RegisterTextfield(
            text: "Add work address*",
            controller: model.workAddressController,
            textInputType: TextInputType.text,
             onChanged:(String value){
               model.workAddressError = !RegExp(CommonPattern.addressRegex).hasMatch(value);
               model.notifyListeners();
            },
            errorText: model.workAddressError ? "Please Enter Valid Work Address":null,
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
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    RegisterTextfield(
                      text: "Name",
                      controller: model.contactNameController,
                      textInputType: TextInputType.name,
                       onChanged: (String value){
               model.contactNameError = (value.isEmpty)?false: !RegExp(CommonPattern.name_regex).hasMatch(value);
               model.notifyListeners();
            },
            errorText: model.companyNameError ? "Please Enter Valid Name":null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterTextfield(
                      text: "Mobile",
                      controller: model.contactMobileController,
                      textInputType: TextInputType.number,
                       onChanged: (String value){
               model.contactMobileError = (value.isEmpty)?false:!RegExp(CommonPattern.mobile_regex).hasMatch(value);
               model.notifyListeners();
            } ,
            errorText: model.contactMobileError ? "Please Enter Valid Mobile":null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterTextfield(
                      text: "Email",
                      controller: model.contactEmailController,
                      textInputType: TextInputType.emailAddress,
                       onChanged: (String value)=>(String value){
               model.contactEmailError = (value.isEmpty)?false:!RegExp(CommonPattern.email_regex).hasMatch(value);
               model.notifyListeners();
            },
            errorText: model.contactEmailError ? "Please Enter Valid Email":null,
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
                  "Contact Person Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
            onPressed: () {
              Utility.pushToNext(context, DashBoardPage());
            },
            color: AppColors.mainColor,
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
