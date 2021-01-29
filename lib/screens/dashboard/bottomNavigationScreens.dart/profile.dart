import 'dart:convert';

import 'package:common_infra_ads/dataModels/user.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppConfig appConfig;
  SharedPreferences sharedPreferences;
  String accessToken = "";
  User user = User();

  @override
  initState() {
    getSharedpreferencesInstance();
    super.initState();
  }

  void getSharedpreferencesInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString("com.quinbay.quora-accesstoken");
    user = User.fromJson(
        jsonDecode(sharedPreferences.getString("com.quinbay.quora-user")));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return Scaffold(
      body: Container(
        height: appConfig.responsive.heightBasedOnPercentage(100),
        width: appConfig.responsive.widthBasedOnPercentage(100),
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            top: appConfig.responsive.heightBasedOnPercentage(15)),
        child: Column(
          children: user.firstname == null
              ? []
              : [
                  userImage,
                ],
        ),
      ),
    );
  }

  Widget get userImage {
    print(user.firstname);
    print(accessToken);

    return Image.asset(
      "assets/images/signUp.png",
    );
  }
}
