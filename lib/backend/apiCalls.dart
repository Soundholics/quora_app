import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:common_infra_ads/dataModels/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'apiResponse.dart';

abstract class ApiCalls {
  final Duration timeout;
  final String baseAuthUrl = "http://10.177.2.29:9005/";
  final String baseGatewayUrl = "http://10.177.2.29:8760/";

  ApiCalls(this.timeout);
}

class AuthenticationApi extends ApiCalls {
  AuthenticationApi(Duration timeout) : super(timeout);

  Future<ApiResponse> login(
      {String username, String password, int counter = 0}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (counter >= 5) {
      return ApiResponse(
          success: false, error: "Failed to retrieve data upon retries.");
    }

    String bodyJson = jsonEncode({
      "username": username,
      "password": password,
      "client": "quora-mobile",
    });

    http.Response response;

    try {
      response = await http.post(Uri.parse(baseAuthUrl + 'auth/authenticate'),
          headers: headers, body: bodyJson);
    } catch (e) {
      return ApiResponse(
          success: false,
          error: "Error Response Code: " + response.statusCode.toString());
    }

    if (response.statusCode != 200) {
      return ApiResponse(
          success: false,
          error: "Error Response Code: " + response.statusCode.toString());
    }

    var decodedResponse;

    try {
      decodedResponse = jsonDecode(response.body);
      print("Submit Business Enquiry Response: " + decodedResponse.toString());
    } catch (e) {
      return ApiResponse(
          success: false, error: "Invalid Server Response: " + e.toString());
    }
    //Return List of States
    if (ApiResponse.isMapParsble(decodedResponse)) {
      return ApiResponse(
          success: decodedResponse["success"],
          data: decodedResponse["data"],
          error: decodedResponse["error"].toString());
    } else {
      return ApiResponse(success: false, error: "Invalid Server Response");
    }
  }

  Future<ApiResponse> register(
      {String username,
      String password,
      String firstname,
      String lastname,
      List<String> interests,
      int counter = 0}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (counter >= 5) {
      return ApiResponse(
          success: false, error: "Failed to retrieve data upon retries.");
    }

    String bodyJson = jsonEncode({
      "username": username,
      "password": password,
      "roles": ["quora-public"],
      "interests": interests,
      "client": "quora-mobile",
    });

    http.Response response;

    try {
      response = await http.post(Uri.parse(baseAuthUrl + 'auth/register'),
          headers: headers, body: bodyJson);
    } catch (e) {
      return ApiResponse(
          success: false,
          error: "Error Response Code: " + response.statusCode.toString());
    }

    if (response.statusCode != 200) {
      return ApiResponse(
          success: false,
          error: "Error Response Code: " + response.statusCode.toString());
    }

    var decodedResponse;

    try {
      decodedResponse = jsonDecode(response.body);
      print(decodedResponse.toString());
    } catch (e) {
      return ApiResponse(
          success: false, error: "Invalid Server Response: " + e.toString());
    }
    //Return List of States
    if (ApiResponse.isMapParsble(decodedResponse)) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setString("com.quinbay.quora-accesstoken",
          decodedResponse['data']['jwt'].toString());

      print("Register with quora is getting triggered");

      return registerWithQuora(
          username: username, firstname: firstname, lastname: lastname);
    } else {
      return ApiResponse(success: false, error: "Invalid Server Response");
    }
  }

  Future<ApiResponse> registerWithQuora(
      {String username,
      String firstname,
      String lastname,
      int counter = 0}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    print(sharedPreferences.getString("com.quinbay.quora-accesstoken"));

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          sharedPreferences.getString("com.quinbay.quora-accesstoken")
    };

    if (counter >= 5) {
      return ApiResponse(
          success: false, error: "Failed to retrieve data upon retries.");
    }

    String bodyJson = jsonEncode({
      "userName": username,
      "firstName": firstname,
      "lastName": lastname,
      "isPrivate": false,
      "associateBusinessEmail": "",
      "photoUrl": "",
    });

    http.Response response;

    try {
      response = await http.post(
          Uri.parse(baseGatewayUrl + 'quoraUsers/addUser'),
          headers: headers,
          body: bodyJson);
    } catch (e) {
      return ApiResponse(
          success: false,
          error: "Error Response Code: " + response.statusCode.toString());
    }

    if (response.statusCode != 200) {
      return ApiResponse(
          success: false,
          error: "Error Response Code: " + response.statusCode.toString());
    }

    var decodedResponse;

    try {
      decodedResponse = jsonDecode(response.body);
      print(decodedResponse.toString());
    } catch (e) {
      return ApiResponse(
          success: false, error: "Invalid Server Response: " + e.toString());
    }
    //Return List of States
    if (decodedResponse != null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.setString(
          "com.quinbay.quora-user", jsonEncode(decodedResponse));

      return ApiResponse(
          success: true, data: User.fromJson(decodedResponse), error: "");
    } else {
      return ApiResponse(success: false, error: "Invalid Server Response");
    }
  }
}
