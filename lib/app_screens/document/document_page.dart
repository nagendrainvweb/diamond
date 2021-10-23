import 'dart:io';

import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/document/document_viewmodel.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/button_widget.dart';
import 'package:diamon_assorter/app_widget/circular_widget.dart';
import 'package:diamon_assorter/app_widget/doc_view_widget.dart';
import 'package:diamon_assorter/app_widget/full_image_view.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    var attachHeight = (MediaQuery.of(context).size.width - 70) / 2;
    AppRepo repo = Provider.of<AppRepo>(context, listen: false);
    return ViewModelBuilder<DocumentViewModel>.reactive(
      viewModelBuilder: () => DocumentViewModel(),
      onModelReady: (DocumentViewModel model) => model.initData(repo),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            AppAppBar(
              showBackButton: true,
            ),
            SizedBox(
              height: 20,
            ),
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
                              image: model.bobCard is File
                                  ? model.bobCard.path
                                  : model.bobCard,
                              isFile: model.bobCard is File,
                              onViewImage: () {
                                Utility.pushToNext(context, ImagePreView(
                                  image: model.bobCard,
                                  isFile: model.bobCard is File,
                                ));
                              },
                              onSelectImage: () {
                                model.selectImage(
                                  context,
                                  (source) {
                                    model.pickImage(source, Constants.BOB_ID);
                                  },
                                );
                              },
                              onEditImage: () {
                                model.selectImage(
                                  context,
                                  (source) {
                                    model.pickImage(source, Constants.BOB_ID);
                                  },
                                );
                                // DialogHelper.showRemoveDialog(
                                //     context,
                                //     "Remove",
                                //     "Are you sure, want to remove document ?",
                                //     "Yes", () {
                                //   Navigator.pop(context);
                                //   model.removeImage(Constants.BOB_ID);
                                // });
                              },
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: DocViewWidget(
                              title: "Attch Aadhar card",
                              height: attachHeight,
                              image: model.aadharCard is File
                                  ? model.aadharCard.path
                                  : model.aadharCard,
                              isFile: model.aadharCard is File,
                                onViewImage: () {
                                Utility.pushToNext(context, ImagePreView(
                                  image: model.aadharCard,
                                  isFile: model.aadharCard is File,
                                ));
                              },
                              onSelectImage: () {
                                model.selectImage(
                                  context,
                                  (source) {
                                    model.pickImage(
                                        source, Constants.AADHAR_CARD);
                                  },
                                );
                              },
                              onEditImage: () {
                                model.selectImage(
                                  context,
                                  (source) {
                                    model.pickImage(
                                        source, Constants.AADHAR_CARD);
                                  },
                                );
                                //  DialogHelper.showRemoveDialog(
                                //     context,
                                //     "Remove",
                                //     "Are you sure, want to remove document ?",
                                //     "Yes", () {
                                //   Navigator.pop(context);
                                //   model.removeImage(Constants.AADHAR_CARD);
                                // });
                              },
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: DocViewWidget(
                              title: "Attch Passport",
                              height: attachHeight,
                              image: model.passportId is File
                                  ? model.passportId.path
                                  : model.passportId,
                              isFile: model.passportId is File,
                                onViewImage: () {
                                Utility.pushToNext(context, ImagePreView(
                                  image: model.passportId,
                                  isFile: model.passportId is File,
                                ));
                              },
                              onSelectImage: () {
                                model.selectImage(
                                  context,
                                  (source) {
                                    model.pickImage(source, Constants.PASSPORT);
                                  },
                                );
                              },
                              onEditImage: () {
                                model.selectImage(
                                  context,
                                  (source) {
                                    model.pickImage(source, Constants.PASSPORT);
                                  },
                                );
                                //  DialogHelper.showRemoveDialog(
                                //     context,
                                //     "Remove",
                                //     "Are you sure, want to remove document ?",
                                //     "Yes", () {
                                //   Navigator.pop(context);
                                //    model.removeImage(Constants.PASSPORT);
                                // });
                              },
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "",
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
            SizedBox(
              height: 20,
            ),
            ButtonView(
              buttonText: "Submit",
              color: AppColors.mainColor,
              onPressed: () {
                model.uploadImage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
