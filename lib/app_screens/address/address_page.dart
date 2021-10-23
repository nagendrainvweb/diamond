import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app_screens/address/address_viewmodel.dart';
import 'package:diamon_assorter/app_widget/address_form_widget.dart';
import 'package:diamon_assorter/app_widget/address_row_widget.dart';
import 'package:diamon_assorter/app_widget/app_appbar.dart';
import 'package:diamon_assorter/app_widget/customErrorWidget.dart';
import 'package:diamon_assorter/app_widget/custom_empty_widget.dart';
import 'package:diamon_assorter/app_widget/register_textfield.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/register/registerViewModel/registerViewModel.dart';
import 'package:diamon_assorter/util/app_color.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  _showBottomDialog(BuildContext context, AddressViewModel model,
      AddressData data, onSubmitclicked) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right:  Radius.circular(20),  )),
        isScrollControlled: true,
        builder: (context) {
          return AddressFormWidget(
              data: data, onSubmitClicked: onSubmitclicked);
        });
  }

  @override
  Widget build(BuildContext context) {
    final repo = Provider.of<AppRepo>(context, listen: false);
    return ViewModelBuilder<AddressViewModel>.reactive(
      viewModelBuilder: () => AddressViewModel(),
      onModelReady: (AddressViewModel model) => model.intiData(repo),
      builder: (_, model, chid) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        floatingActionButton: (repo.role.toLowerCase() == Constants.COMPANY.toLowerCase() || model.addressList.isEmpty? FloatingActionButton(
          onPressed: () {
            _showBottomDialog(context, model, null, (AddressData addressData) {
              model.onAddressAddedClicked(context, addressData);
            });
          },
          child: const Icon(Icons.add),
        ):Container()),
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
                              model.fetchAddressData();
                            })
                        : model.addressList.isNotEmpty
                            ? MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ListView.builder(
                                    itemCount: model.addressList.length,
                                    itemBuilder: (_, index) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20),
                                            AddressRow(
                                              data: model.addressList[index],
                                              enableFeild: false,
                                              onDeleteClicked: () {
                                                DialogHelper.showRemoveDialog(
                                                    context,
                                                    "Remove",
                                                    "Are you sure, want to delete Address ?",
                                                    "Yes", () {
                                                  Navigator.pop(context);
                                                  model.onDeleteAddress(
                                                      context,
                                                      index,
                                                      model.addressList[index]);
                                                });
                                              },
                                              onEditClicked: () {
                                                _showBottomDialog(
                                                    context,
                                                    model,
                                                    model.addressList[index],
                                                    (AddressData data) {
                                                  model.onEditAddress(
                                                      context, data, index);
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : CustomEmptyWidget(
                                text:
                                    "You don't have any Address right now\nPlease add Address",
                              )),
          ],
        ),
      ),
    );
  }
}
