import 'dart:convert';
import 'dart:io';

import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/modal/basic_response.dart';
import 'package:diamon_assorter/services/api_error_exception.dart';
import 'package:diamon_assorter/services/urlList.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<BasicResponse<UserData>> registerUser(UserData userData) async {
    try {
      final header = {"Content-Type": "application/json"};
      final body = json.encode(userData.toJson());
      final request = await http.post(Uri.parse(UrlList.REGISTER), body: body,headers: header);
      final jsonResponse = json.decode(request.body);
      myPrint("register response : ${request.body.toString()}");
      return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(SOMETHING_WRONG_TEXT);
    }
  }
}
