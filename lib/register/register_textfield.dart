import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterTextfield extends StatelessWidget {
  final String text;
  final TextInputType textInputType;
  final TextEditingController controller;
  final TextInputFormatter formatter;

  const RegisterTextfield(
      {Key key, this.text, this.textInputType, this.controller, this.formatter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 18,
        ),
        keyboardType: TextInputType.name,
        inputFormatters: [
          formatter
        ],
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
        ),
      ),
    );
  }
}
