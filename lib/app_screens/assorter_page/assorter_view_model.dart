import 'package:diamon_assorter/app/app_repo.dart';
import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/app_helper.dart';
import 'package:diamon_assorter/util/dialog_helper.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AssorterViewModel extends BaseViewModel with AppHelper {
  List<AssorterModal> _assorterList = [];
  final _apiService = locator<ApiService>();

  bool loading = false;
  bool hasError = false;

  AppRepo _repo;

  intiData(AppRepo repo) {
    _repo = repo;
    fetchAssorterData();
  }



  List<AssorterModal> get assorterList => _assorterList;
  setAssorterList(List<AssorterModal> list) {
    _assorterList = list;
    notifyListeners();
  }

  Future getAssorterList({Function onError}) async {
    try {
      final response = await _apiService.userAssorter();
    } catch (e) {
      myPrint(e.toString());
      onError(e.toString());
    }
  }

  void onAseerterAddedClicked(
    BuildContext context,
    String name,
    String mobile,
    String email,
  ) async {
    try {
       progressDialog("Please wait...", context);
      final userId = await Prefs.userId;
      AssorterModal data = AssorterModal(
        name: name,
        mobile: mobile,
        email: email,
        userId: userId,
      );
      final response = await _apiService.addUserAssorter(data);
      _assorterList.add(response.data);
      hideProgressDialog(context);
      notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  void onEditAseertor(BuildContext context,AssorterModal data,int index) async{
    try {
      progressDialog("Please wait...", context);
      data.userId = await Prefs.userId;
      final response = await _apiService.updateUserAssorter(data);
      _assorterList[index] = response.data;

      hideProgressDialog(context);
       notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  onDeleteClicked(BuildContext context, int index, AssorterModal data) async{
     try {
      progressDialog("Please wait...", context);
      data.userId = await Prefs.userId;
      final response = await _apiService.deleteAssorter(data);
      _assorterList.removeAt(index);

      hideProgressDialog(context);
       notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      hideProgressDialog(context);
      DialogHelper.showErrorDialog(context, "Error", e.toString(),
          showTitle: true);
    }
  }

  void fetchAssorterData() async{
    try {
      loading = true;
      hasError = false;
      notifyListeners();
      final response = await _apiService.userAssorter();
      _assorterList = response.data;
      loading = false;
      notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      loading = false;
      hasError = true;
      notifyListeners();
    }
  }
}
