import 'dart:convert';

import 'package:common_infra_ads/backend/apiCalls.dart';
import 'package:common_infra_ads/backend/apiResponse.dart';
import 'package:common_infra_ads/dataModels/userDetailsForAuthorization.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/CustomTextFiled2.dart';
import 'package:common_infra_ads/widgets/button.dart';
import 'package:common_infra_ads/widgets/customTextField1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  AppConfig appConfig;

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          height: appConfig.responsive.heightBasedOnPercentage(100),
          width: appConfig.responsive.widthBasedOnPercentage(100),
          padding: EdgeInsets.only(
            left: appConfig.responsive.width(30),
            right: appConfig.responsive.width(30),
            top: appConfig.responsive.height(165),
          ),
          child: Column(
            children: [
              Text("Welcome back!",
                  style: appConfig.appTextTheme.textStyle16.copyWith(
                      fontSize: appConfig.responsive.height(40),
                      color: appConfig.appColors.quoraRed,
                      fontFamily: "Roboto")),
              sizedBox(1),
              Text("Login to Continue",
                  style: appConfig.appTextTheme.textStyle11
                      .copyWith(fontFamily: "Roboto")),
              sizedBox(35),
              buildEmailTextField,
              sizedBox(35),
              buildPasswordTextField,
              sizedBox(75),
              Button(
                title: "Sign In",
                appConfig: appConfig,
                color: appConfig.appColors.quoraRed,
                height: appConfig.responsive.height(50),
                width: appConfig.responsive.width(200),
                onTap: () async {
                  appConfig.businessLogic.login(username.text, password.text);
                },
              ),
              sizedBox(15),
              dontHaveAnAccount
            ],
          ),
        ),
      ),
    );
  }

  Widget get dontHaveAnAccount {
    return ButtonTheme(
      height: appConfig.responsive.height(50),
      minWidth: appConfig.responsive.width(200),
      child: OutlineButton(
          onPressed: () async {
            Navigator.pushReplacementNamed(appConfig.context, "/registration");
          },
          child: Text("Register"),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0))),
    );
  }

  Widget get buildPasswordTextField {
    return CustomTextField2(
      appConfig: appConfig,
      title: "Password",
      textEditingController: password,
      textInputType: TextInputType.visiblePassword,
      hintText: "••••••••••",
    );
  }

  Widget get buildEmailTextField {
    return CustomTextField1(
      appConfig: appConfig,
      title: "Email Address",
      textEditingController: username,
      textInputType: TextInputType.emailAddress,
      isDense: false,
      hintText: "Qwety@gmail.com",
    );
  }

  SizedBox sizedBox(double height, [double width = 0]) {
    return SizedBox(
        height: appConfig.responsive.height(height),
        width: appConfig.responsive.width(width ?? 0));
  }
}
