import 'dart:convert';
import 'dart:io';

import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/modal/agentData.dart';
import 'package:diamon_assorter/modal/basic_response.dart';
import 'package:diamon_assorter/services/api_error_exception.dart';
import 'package:diamon_assorter/services/urlList.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<BasicResponse<UserData>> registerUser(UserData userData) async {
    try {
      final header = {"Content-Type": "application/json"};
      final body = json.encode(userData.toJson());
      final request = await http.post(Uri.parse(UrlList.REGISTER),
          body: body, headers: header);
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

  Future<Map<String, dynamic>> fetchCityState(String pincode) async {
    try {
      myPrint("url is ${UrlList.PINCODE + pincode}");
      final request = await http.get(Uri.parse(UrlList.PINCODE + pincode));
      final jsonResponse = json.decode(request.body);
      myPrint("register response : ${request.body.toString()}");
      final Map<String, dynamic> data = new Map<String, dynamic>();
      if (jsonResponse["success"] == true) {
        final jsonData = jsonResponse['data'];
        data[Constants.CITY] = jsonData["city"];
        data[Constants.STATE] = jsonData['state'];
        return data;
      }
      throw ApiErrorException(jsonResponse['message']);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(SOMETHING_WRONG_TEXT);
    }
  }

  Future<BasicResponse<List<AgentData>>> fetchAgentList() async {
    try {
      final request = await http.get(Uri.parse(UrlList.AGENT_LIST));
      final jsonResponse = json.decode(request.body);
      myPrint(request.body);
      if (jsonResponse[Constants.SUCCESS] == true) {
        final data = jsonResponse[Constants.DATA];
        List<AgentData> list = [];
        for (var item in data) {
          list.add(AgentData.fromJson(item));
        }
        return BasicResponse.fromJson(json: jsonResponse, data: list);
      }
      throw ApiErrorException(jsonResponse['message']);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(SOMETHING_WRONG_TEXT);
    }
  }
}
