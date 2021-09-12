import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/register/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgentRegistrationWidget extends StatelessWidget {
  const AgentRegistrationWidget({
    Key key,
  }) : super(key: key);

  _showBottomDialog(BuildContext context) {
    final _nameController = TextEditingController();
    final _mobileController = TextEditingController();
    final _emailController = TextEditingController();
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    // vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Assorter",
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      RegisterTextfield(
                        text: "Name",
                        controller: _nameController,
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegisterTextfield(
                        text: "Mobile",
                        controller: _mobileController,
                        textInputType: TextInputType.number,
                        
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegisterTextfield(
                        text: "Email",
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonView(
                        buttonText: "SUBMIT",
                        color: AppColors.mainLightColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        RegisterTextfield(
          text: "Name*",
          textInputType: TextInputType.name,
          formatter: FilteringTextInputFormatter.allow(RegExp(CommonPattern.name_regex))
        ),
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
        RegisterTextfield(
          text: "Mobile no*",
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
                textInputType: TextInputType.name,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        RegisterTextfield(
          text: "Office Address",
          textInputType: TextInputType.name,
        ),
        SizedBox(
          height: 20,
        ),
        RegisterTextfield(
          text: "Commission Per asorter",
          textInputType: TextInputType.number,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "BDB ID Card:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ButtonView(
              buttonText: "if any attach",
              color: AppColors.mainLightColor,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        AssorterRow(),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ButtonView(
                buttonText: "Add Assorter",
                color: AppColors.mainLightColor,
                onPressed: () {
                  _showBottomDialog(
                    context,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class AssorterRow extends StatelessWidget {
  const AssorterRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 13,
          ),
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
                RegisterTextfield(
                  text: "Name",
                ),
                SizedBox(
                  height: 15,
                ),
                RegisterTextfield(
                  text: "Mobile",
                ),
                SizedBox(
                  height: 15,
                ),
                RegisterTextfield(
                  text: "Email",
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
            "Assorter 1",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
