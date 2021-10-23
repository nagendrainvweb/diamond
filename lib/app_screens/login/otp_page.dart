import 'package:diamon_assorter/app_screens/login/login_viewModel.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key key, this.otp, this.onVerifyClicked, this.onResendClicked})
      : super(key: key);

  final String otp;
  final Function onVerifyClicked;
  final Function onResendClicked;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otpController = TextEditingController();

  int _timer = 0;

  bool otpError = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _timer = 20;
    startTimer();
  }

  startTimer() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (_timer != 0) {
        setState(() {
          _timer--;
        });
        startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Please Enter OTP",
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                RegisterTextfield(
                  controller: otpController,
                  text: "Enter OTP",
                  textInputType: TextInputType.number,
                  icon: Icons.lock_outline_rounded,
                  obsecure: false,
                  errorText: otpError ? "Please Enter Valid OTP" : null,
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _timer != 0 ? null : widget.onResendClicked,
                        child: Text((_timer != 0)
                            ? "Resend after $_timer seconds"
                            : "Resend OTP"))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonView(
                  color: AppColors.mainColor,
                  buttonText: "Verify",
                  onPressed: () {
                    if (otpController.text == widget.otp) {
                      Navigator.pop(context);
                      widget.onVerifyClicked();
                    } else {
                      setState(() {
                        otpError = true;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
