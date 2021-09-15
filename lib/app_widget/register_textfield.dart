import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterTextfield extends StatelessWidget {
  final String text;
  final TextInputType textInputType;
  final TextEditingController controller;
  final TextInputFormatter formatter;
  final Function onChanged;
  final String errorText;
  final bool enable;

  const RegisterTextfield(
      {Key key,
      this.text,
      this.textInputType,
      this.controller,
      this.formatter,
      this.onChanged,
      this.errorText, this.enable = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        enabled: enable,
        style: TextStyle(
          fontSize: 18,
        ),
        keyboardType: textInputType,
        onChanged: onChanged,
        // inputFormatters: [
        //   formatter
        // ],
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            labelText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            hintStyle: TextStyle(),
            errorText: errorText),
      ),
    );
  }
}
