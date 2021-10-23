import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/address_data.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddressViewModel extends BaseViewModel with AppHelper {
  final _apiService = locator<ApiService>();

  List<AddressData> _addressList = [];
  bool loading = false;
  bool hasError = false;

  AppRepo _repo;

  intiData(AppRepo repo) {
    _repo = repo;
    fetchAddressData();
  }

  void setAddressList(List<AddressData> list) {
    _addressList = list;
    notifyListeners();
  }

  List<AddressData> get addressList => _addressList;

  fetchAddressData() async {
    try {
      loading = true;
      hasError = false;
      notifyListeners();
      final response = await _apiService.userAddress();
      _addressList = response.data;
      loading = false;
      notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      loading = false;
      hasError = true;
      notifyListeners();
    }
  }

  void onAddressAddedClicked(
      BuildContext context, AddressData addressData) async {
    try {
      progressDialog("Please wait...", context);
      addressData.userId = await Prefs.userId;
      final response = await _apiService.addUserAddress(addressData);
      _addressList.add(response.data);
      hideProgressDialog(context);
      notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  void onEditAddress(
      BuildContext context, AddressData addressData, int index) async {
    try {
      progressDialog("Please wait...", context);
      addressData.userId = await Prefs.userId;
      final response = await _apiService.updateUserAddress(addressData);
      _addressList[index] = response.data;

      hideProgressDialog(context);
       notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  void onDeleteAddress(
      BuildContext context, int index, AddressData addressData) async {
    try {
      progressDialog("Please wait...", context);
      addressData.userId = await Prefs.userId;
      final response = await _apiService.deleteAddrress(addressData);
      _addressList.removeAt(index);

      hideProgressDialog(context);
       notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }
}
