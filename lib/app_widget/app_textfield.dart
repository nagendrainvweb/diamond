import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  AppTextfield(
      {Key key,
      this.hint,
      this.icon,
      this.obsecure,
      this.color,
      this.textColor = AppColors.blackColor,
      this.controller,
      this.errorText, this.onChanged})
      : super(key: key);

  final String hint;
  final IconData icon;
  final bool obsecure;
  final Color color;
  final Color textColor;
  final TextEditingController controller;
  final String errorText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: controller,
            obscureText: obsecure,
            style: TextStyle(color: textColor, fontSize: 18),
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: color,
              ),
              
              contentPadding:
                  EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                    color: color, width: 1.5, style: BorderStyle.solid),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                    color: color, width: 1.5, style: BorderStyle.solid),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
