import 'package:diamon_assorter/app_widget/address_row_widget.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
import 'package:diamon_assorter/app_widget/doc_view_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/app_widget/top_left_header_widget.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class UpdateCompanyProfile extends StatefulWidget {
  @override
  _UpdateCompanyProfileState createState() => _UpdateCompanyProfileState();
}

class _UpdateCompanyProfileState extends State<UpdateCompanyProfile> {
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
                text: "Type",
                textInputType: TextInputType.name,
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
              Row(
                children: [
                  Expanded(
                    child: RegisterTextfield(
                      text: "Mobile",
                      textInputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: RegisterTextfield(
                      text: "Intercome",
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
              SizedBox(
                height: 20,
              ),
              RegisterTextfield(
                text: "Password",
                textInputType: TextInputType.name,
              ),
              Stack(
                children: [
                  CircularBorder(
                    child: Row(
                      children: [
                        Expanded(
                          child: DocViewWidget(
                            title: "Attch BOB id Card",
                            height:
                                (MediaQuery.of(context).size.width - 100) / 2,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        )
                      ],
                    ),
                  ),
                  TopLeftHeaderWidget(text: "Attach Documents"),
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
                        width: 1,
                        color: AppColors.grey400,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        RegisterTextfield(
                          text: "Name*",
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
                        Row(
                          children: [
                            Expanded(
                              child: RegisterTextfield(
                                text: "Email*",
                                textInputType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
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
                          color: AppColors.grey600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              AddressRow(),
            ],
          ),
        ),
      ],
    );
  }
}
