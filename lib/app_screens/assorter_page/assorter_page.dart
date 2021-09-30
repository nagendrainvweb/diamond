import 'package:diamon_assorter/app_screens/assorter_page/assorter_view_model.dart';
import 'package:diamon_assorter/app_widget/add_assorter_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/register/view/agentRegistration.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AssorterPage extends StatefulWidget {
  const AssorterPage({Key key}) : super(key: key);

  @override
  _AssorterPageState createState() => _AssorterPageState();
}

class _AssorterPageState extends State<AssorterPage> {
  _showBottomDialog(
      BuildContext context, AssorterViewModel model, AssorterModal data) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        isScrollControlled: true,
        builder: (context) {
          return AddAssorterWidget(
            data: data,
            onSubmitClicked: (name, mobile, email) {
              if (data == null) {
                model.onAseerterAddedClicked(name, mobile, email);
              } else {
                data.name = name;
                data.mobile = mobile;
                data.email = email;
                model.onEditAseertor(data);
              }
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssorterViewModel>.reactive(
      viewModelBuilder: () => AssorterViewModel(),
      builder: (_, model, child) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final data = AssorterModal();
            _showBottomDialog(context, model, null);
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            AppAppBar(
              showBackButton: true,
            ),
            Expanded(
                child: (model.assorterList.isNotEmpty)
                    ? MediaQuery.removeViewPadding(
                        context: context,
                        removeTop: true,
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                              itemCount: model.assorterList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                    child: AssorterRow(
                                  data: model.assorterList[index],
                                  onDeleteClicked: () => model
                                      .onDeleteClicked(model.assorterList[index]),
                                  onEditClicked: () => _showBottomDialog(
                                      context, model, model.assorterList[index]),
                                ));
                              }),
                        ),
                      )
                    : Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You don't have any assorter right now\nPlease add Assorter",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.grey700, fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                size: 80,
                                color: AppColors.grey600,
                              )
                            ],
                          ),
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
