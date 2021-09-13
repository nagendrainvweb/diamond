import 'package:diamon_assorter/register/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompanyRegisterWidget extends StatelessWidget {
  const CompanyRegisterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RegisterTextfield(
            text: "Name*",
            textInputType: TextInputType.name,
            formatter: FilteringTextInputFormatter.allow(
                RegExp(CommonPattern.name_regex))),
        SizedBox(
          height: 20,
        ),
        RegisterTextfield(
          text: "Company Name",
          textInputType: TextInputType.name,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: RegisterTextfield(
                text: "Tel",
                textInputType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: RegisterTextfield(
                text: "Intercom",
                textInputType: TextInputType.text,
              ),
            ),
          ],
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
        Row(
          children: [
            Expanded(
              child: RegisterTextfield(
                text: "Flat/Gala No",
                textInputType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: RegisterTextfield(
                text: "Blg Name",
                textInputType: TextInputType.name,
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
              width: 20,
            ),
            Expanded(
              child: RegisterTextfield(
                text: "City",
                textInputType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: 20,
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
        RegisterTextfield(
          text: "Add work address",
          textInputType: TextInputType.text,
        ),
        SizedBox(
          height: 15,
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15,),
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
                    textInputType: TextInputType.number,
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 15,
              ),
              padding: EdgeInsets.all(5,),
              color: AppColors.whiteColor,
                child: Text(
              "Contact Person Details",
              style: TextStyle(fontWeight: FontWeight.bold,),
            ),
            ),
          ],
        ),
      ],
    );
  }
}
