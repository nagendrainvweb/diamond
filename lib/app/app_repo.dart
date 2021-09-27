import 'package:diamon_assorter/app/locator.dart';
import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/modal/agentData.dart';
import 'package:diamon_assorter/prefrence_util/PreferencesHelper.dart';
import 'package:diamon_assorter/prefrence_util/Prefs.dart';
import 'package:diamon_assorter/services/api_services.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/foundation.dart';

class AppRepo extends ChangeNotifier {
  List<AgentData> _agentList = [];
  final _apiService = locator<ApiService>();
  bool _login = false;
  String _name;
  String _email, _number;
  UserData _userData;
  init() async {
    _login = await Prefs.login;
    _name = await Prefs.name;
    _email = await Prefs.emailId;
    _number = await Prefs.mobileNumber;
    fetchAgentList();
  }

  String get name => _name;
  void setName(String value) {
    _name = value;
  }

  String get email => _email;
  void setEmail(String value) {
    _email = value;
  }

  String get number => _number;
  void setNumber(String value) {
    _number = value;
  }

  bool get login => _login;

  List<AgentData> get agentList => _agentList;

  UserData get userData => _userData;

  void setUserData(UserData data) {
    _userData = data;
    notifyListeners();
  }

  void setAgentList(List<AgentData> list) {
    _agentList = list;
    notifyListeners();
  }

  fetchAgentList() async {
    try {
      final response = await _apiService.fetchAgentList();
      _agentList = response.data;
      notifyListeners();
    } catch (e) {
      myPrint(e.toString());
    }
  }
}
