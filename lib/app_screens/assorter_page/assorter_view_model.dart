import 'package:diamon_assorter/modal/assorter_modal.dart';
import 'package:stacked/stacked.dart';

class AssorterViewModel extends BaseViewModel {
  List<AssorterModal> _assorterList = [];

  List<AssorterModal> get assorterList => _assorterList;
  setAssorterList(List<AssorterModal> list) {
    _assorterList = list;
    notifyListeners();
  }

   void onAseerterAddedClicked(String name, String mobile, String email) {
    assorterList.add(new AssorterModal(
        name: name, mobile: mobile, email: email, id: assorterList.length + 1));
    notifyListeners();
  }

  void onEditAseertor(AssorterModal data) {
    final index = assorterList.indexOf(data);
    assorterList[index] = data;
    notifyListeners();
  }

  onDeleteClicked(e) {}
}
