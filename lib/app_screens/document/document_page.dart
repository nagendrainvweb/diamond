import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
import 'package:diamon_assorter/app_widget/doc_view_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    var attachHeight = (MediaQuery.of(context).size.width - 70) / 2;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          AppAppBar(
            showBackButton: true,
          ),
          SizedBox(height: 20,),
         Container(
           padding: EdgeInsets.symmetric(
             horizontal: 20,
             vertical: 20,
           ),
           child: Stack(
              children: [
                CircularBorder(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: DocViewWidget(
                            title: "Attch BOB id Card",
                            height: attachHeight,
                            // file: model.idCard,
                            onSelectImage: () {
                              // model.selectImage(
                              //   context,
                              //   (source) {
                              //     model.pickImage(source, Constants.BOB_ID);
                              //   },
                              // );
                            },
                            onDeleteImage: () {
                              // model.removeImage(Constants.BOB_ID);
                            },
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: DocViewWidget(
                            title: "Attch Aadhar card",
                            height: attachHeight,
                            // file: model.aadharCard,
                            onSelectImage: () {
                              // model.selectImage(
                              //   context,
                              //   (source) {
                              //     model.pickImage(source, Constants.AADHAR_CARD);
                              //   },
                              // );
                            },
                            onDeleteImage: () {
                              // model.removeImage(Constants.AADHAR_CARD);
                            },
                          )),
                          
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                              child: DocViewWidget(
                            title: "Attch Passport",
                            height: attachHeight,
                            // file: model.passport,
                            onSelectImage: () {
                              // model.selectImage(
                              //   context,
                              //   (source) {
                              //     model.pickImage(source, Constants.PASSPORT);
                              //   },
                              // );
                            },
                            onDeleteImage: () {
                              // model.removeImage(Constants.PASSPORT);
                            },
                          )),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              "",
                            ),  ),
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
                    "Attach Documents",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
         ),
          SizedBox(height:20,),
         ButtonView(
           buttonText:"Submit",
           color: AppColors.mainColor,
           onPressed: (){},
         ),
        ],
      ),
    );
  }
}
