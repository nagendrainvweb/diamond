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
  final bool showIcon;
  final bool obsecure;
  final Function onIconClicked;

  const RegisterTextfield(
      {Key key,
      this.text,
      this.textInputType,
      this.controller,
      this.formatter,
      this.obsecure = false,
      this.showIcon = false,
      this.onChanged,
      this.errorText,
      this.enable = true,
      this.onIconClicked})
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
        obscureText: obsecure,
        onChanged: onChanged,
        // inputFormatters: [
        //   formatter
        // ],
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            labelText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: (showIcon)
                ? InkWell(
                    onTap: () {
                      onIconClicked();
                    },
                    child: Icon(
                        obsecure ? Icons.visibility : Icons.visibility_off))
                :null,
            hintStyle: TextStyle(),
            errorMaxLines: 2,
            errorText: errorText),
      ),
    );
  }
}
