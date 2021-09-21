import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/common_pattern.dart';
import 'package:flutter/material.dart';

class AddAssorterWidget extends StatefulWidget {
  AddAssorterWidget({
    Key key,
    this.data,
    this.onSubmitClicked,
  }) : super(key: key);

  final AssorterModal data;
  final Function onSubmitClicked;

  @override
  _AddAssorterWidgetState createState() => _AddAssorterWidgetState();
}

class _AddAssorterWidgetState extends State<AddAssorterWidget> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool assNameError = false;

  bool assMobileError = false;

  bool assEmailError = false;

  @override
  void initState() {
    _nameController.text = widget.data != null ? widget.data.name : "";
    _mobileController.text = widget.data != null ? widget.data.mobile : "";
    _emailController.text = widget.data != null ? widget.data.email : "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: ListView(
        shrinkWrap: true,
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
                  text: "Name*",
                  controller: _nameController,
                  textInputType: TextInputType.name,
                  onChanged: (String value) {
                    setState(() {
                      assNameError =
                          !RegExp(CommonPattern.name_regex).hasMatch(value);
                    });
                  },
                  errorText: assNameError ? "Please Enter Valid Name" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Mobile*",
                  controller: _mobileController,
                  textInputType: TextInputType.number,
                  onChanged: (String value) {
                    setState(() {
                      assMobileError =
                          !RegExp(CommonPattern.mobile_regex).hasMatch(value);
                    });
                  },
                  errorText:
                      assMobileError ? "Please Enter Valid Mobile" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                RegisterTextfield(
                  text: "Email",
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  onChanged: (String value) {
                    setState(() {
                      assEmailError = (value.isEmpty)
                          ? false
                          : !RegExp(CommonPattern.email_regex).hasMatch(value);
                    });
                  },
                  errorText: assEmailError ? "Please Enter Valid Email" : null,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonView(
                  buttonText: "SUBMIT",
                  color: AppColors.mainLightColor,
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onSubmitClicked(_nameController.text,
                        _mobileController.text, _emailController.text);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
