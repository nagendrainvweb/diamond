import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/assorter_page/assorter_view_model.dart';
import 'package:diamon_assorter/app_widget/add_assorter_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/customErrorWidget.dart';
import 'package:diamon_assorter/app_widget/custom_empty_widget.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/register/view/agentRegistration.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AssorterPage extends StatefulWidget {
  const AssorterPage({Key key}) : super(key: key);

  @override
  _AssorterPageState createState() => _AssorterPageState();
}

class _AssorterPageState extends State<AssorterPage> {
  _showBottomDialog(BuildContext context, AssorterViewModel model,
      AssorterModal data, Function onSubmitClicked) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right:  Radius.circular(20),  )),
        isScrollControlled: true,
        builder: (context) {
          return AddAssorterWidget(
              data: data, onSubmitClicked: onSubmitClicked);
        });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<AppRepo>(context, listen: false);
    return ViewModelBuilder<AssorterViewModel>.reactive(
      viewModelBuilder: () => AssorterViewModel(),
      onModelReady: (AssorterViewModel model) => model.intiData(repo),
      builder: (_, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showBottomDialog(context, model, null, (name, mobile, email) {
              model.onAseerterAddedClicked(context, name, mobile, email);
              // } else {
              //   data.name = name;
              //   data.mobile = mobile;
              //   data.email = email;
              //   model.onEditAseertor(data);
              // }
            });
            // model.getAssorterList(onError: (e) {
            //   DialogHelper.showErrorDialog(context, "Error", e);
            // });
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            AppAppBar(
              showBackButton: true,
            ),
            Expanded(
                child: (model.loading)
                    ? Center(child: CircularProgressIndicator())
                    : (model.hasError)
                        ? CustomErrorWidget(
                            text: Constants.SOMETHING_WRONG,
                            buttonText: "Retry",
                            onRetryClicked: () {
                              model.fetchAssorterData();
                            })
                        : model.assorterList.isNotEmpty
                            ? MediaQuery.removeViewPadding(
                                context: context,
                                removeTop: true,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ListView.builder(
                                      itemCount: model.assorterList.length,
                                      itemBuilder: (_, index) {
                                        return Column(
                                          children: [
                                            Container(
                                                child: AssorterRow(
                                              data: model.assorterList[index],
                                              onDeleteClicked: () {
                                                DialogHelper.showRemoveDialog(
                                                    context,
                                                    "Remove",
                                                    "Are you sure, want to delete Assorter ?",
                                                    "Yes", () {
                                                  Navigator.pop(context);
                                                  model.onDeleteClicked(
                                                      context,
                                                      index,
                                                      model
                                                          .assorterList[index]);
                                                });
                                              },
                                              onEditClicked: () =>
                                                  _showBottomDialog(
                                                      context,
                                                      model,
                                                      model.assorterList[index],
                                                      (name, mobile, email) {
                                                model.assorterList[index].name =
                                                    name;
                                                model.assorterList[index]
                                                    .mobile = mobile;
                                                model.assorterList[index]
                                                    .email = email;
                                                myPrint("i am clicked");
                                                model.onEditAseertor(
                                                    context,
                                                    model.assorterList[index],
                                                    index);
                                              }),
                                            )),
                                            SizedBox(
                                              height: 5,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                              )
                            : CustomEmptyWidget(
                                text:
                                    "You don't have any assorter right now\nPlease add Assorter",
                              ))
          ],
        ),
      ),
    );
  }
}
