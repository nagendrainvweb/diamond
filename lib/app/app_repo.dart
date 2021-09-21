import 'package:diamon_assorter/app/locator.dart';
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
  init() async {
    _login = await Prefs.login;
    fetchAgentList();
  }

  bool get login => _login;

  List<AgentData> get agentList => _agentList;

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
