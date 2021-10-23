import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key key,
    this.text,
    this.onRetryClicked, this.buttonText,
  }) : super(key: key);

  final String text;
  final Function onRetryClicked;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.info_outline_rounded,
                size: 80, color: AppColors.grey600),
            SizedBox(
              height: 10,
            ),
            Text(text,
                style: TextStyle(color: AppColors.blackLight, fontSize: 18)),
            SizedBox(
              height: 60,
            ),
           
            ButtonView(
                buttonText: buttonText,
                onPressed:onRetryClicked,
                color: AppColors.mainColor),
          ],
        ),
      ),
    );
  }
}
