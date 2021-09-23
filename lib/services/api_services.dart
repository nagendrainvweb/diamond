import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:diamon_assorter/modal/UserData.dart';
import 'package:diamon_assorter/modal/agentData.dart';
import 'package:diamon_assorter/modal/basic_response.dart';
import 'package:diamon_assorter/modal/login_response_data.dart';
import 'package:diamon_assorter/modal/register_response_data.dart';
import 'package:diamon_assorter/services/api_error_exception.dart';
import 'package:diamon_assorter/services/urlList.dart';
import 'package:diamon_assorter/util/constants.dart';
import 'package:diamon_assorter/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<BasicResponse<RegisterResponseData>> registerUser(
      UserData userData) async {
    try {
      final header = {"Content-Type": "application/json"};
      final body = json.encode(userData.toJson());
      myPrint("body is " + body.toString());
      final request = await http.post(Uri.parse(UrlList.REGISTER),
          body: body, headers: header);
      myPrint("register response : ${request.body.toString()}");
      final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == true) {
        return BasicResponse<RegisterResponseData>.fromJson(
            json: jsonResponse,
            data: RegisterResponseData.fromJson(jsonResponse));
      }
      throw ApiErrorException(jsonResponse[Constants.MESSAGE]);
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      myPrint(e.toString());
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
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
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<List<AgentData>>> fetchAgentList() async {
    try {
      myPrint(" url is " + UrlList.AGENT_LIST);
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
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<List<String>>> fileUpload(List<File> file) async {
    //create multipart request for POST or PATCH method
    final uri = Uri.parse(UrlList.UPLOAD_IMAGE);
    var request = http.MultipartRequest(
      "POST",
      uri,
    );
    //add text fields
    // request.fields[Constants.USERID] = user_id;
    // request.fields[UrlConstants.APP_VERSION] = appversion;
    // request.fields[UrlConstants.DEVICE] = device;
    //create multipart using filepath, string or bytes
    for (var item in file) {
      var pic = await http.MultipartFile.fromPath("image[]", item.path);
      //add multipart to request
      request.files.add(pic);
    }

    //request.headers.addAll(header);

    try {
      var response = await request.send();

      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print(responseString);

      final responseJson = json.decode(responseString);
      if (responseJson[Constants.STATUS] == true) {
        final data = responseJson[Constants.DATA];
        List<String> list = [];
        for (var item in data) {
          list.add(item.toString());
        }
        return BasicResponse<List<String>>.fromJson(
            json: responseJson, data: list);
      }
      throw ApiErrorException(responseJson[Constants.MESSAGE]);
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on TimeoutException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      myPrint(e.toString());
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<LoginResponseData>> loginUser(String username, String password) async {
    try {
      final body = {"email": username, "password": password};
      final request = await http.post(Uri.parse(UrlList.LOGIN), body: body);
      myPrint("login response : ${request.body.toString()}");
      final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == true) {
        return BasicResponse<LoginResponseData>.fromJson(
            json: jsonResponse, data: LoginResponseData.fromJson(jsonResponse));
      }
      throw ApiErrorException(jsonResponse[Constants.MESSAGE]);

      //  return BasicResponse.fromJson(json: jsonResponse, data: "");
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }

  Future<BasicResponse<String>> forgortPassword(String email) async {
    try {
      final body = {"email": email};
      final request = await http.post(Uri.parse(UrlList.FORGOT_PASSWORD), body: body);
      myPrint("login response : ${request.body.toString()}");
     final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == true) {
        return BasicResponse.fromJson(json: jsonResponse, data: "");
      }
     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);

      
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }
  Future<BasicResponse<String>> checkUser(String email) async {
    try {
      final body = {"email": email};
      final request = await http.post(Uri.parse(UrlList.CHECK_USER), body: body);
      myPrint("login response : ${request.body.toString()}");
     final jsonResponse = json.decode(request.body);
      if (jsonResponse[Constants.STATUS] == true) {
        return BasicResponse.fromJson(json: jsonResponse, data: "");
      }
     throw ApiErrorException(jsonResponse[Constants.MESSAGE]);

      
    } on SocketException catch (e) {
      throw ApiErrorException(NO_INTERNET_CONN);
    } on Exception catch (e) {
      // sendMail(UrlList.SEND_OTP, SOMETHING_WRONG_TEXT);
      throw ApiErrorException(e.toString());
    }
  }
}
