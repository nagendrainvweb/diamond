import 'package:diamon_assorter/app_widget/address_form_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/app_widget/top_left_header_widget.dart';
import 'package:flutter/material.dart';

class UpdateAgentProfile extends StatefulWidget {
  const UpdateAgentProfile({Key key}) : super(key: key);

  @override
  _UpdateAgentProfileState createState() => _UpdateAgentProfileState();
}

class _UpdateAgentProfileState extends State<UpdateAgentProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
              text: "Type*",
              textInputType: TextInputType.name,
              enable: false,
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
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            RegisterTextfield(
              text: "Password*",
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            RegisterTextfield(
              text: "Commission Per Assorter*",
              textInputType: TextInputType.number,
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ]);
  }
}
