import 'package:common_infra_ads/backend/apiCalls.dart';
import 'package:common_infra_ads/backend/apiResponse.dart';
import 'package:common_infra_ads/utilities/appConfig/appColors.dart';
import 'package:common_infra_ads/utilities/appConfig/appIcons.dart';
import 'package:common_infra_ads/utilities/appConfig/responsive.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessLogic {
  final BuildContext context;

  BusinessLogic(this.context);

  // Colors for snackbars
  final Color errorRed = AppColors().pastelRed;
  final Color errorText = AppColors().red;
  final Color successText = AppColors().thickGreen;
  final Color successGreen = AppColors().pastelGreen;

  // icons for snackbars
  final AppIcons appIcons = AppIcons();

  Future splashScreenBackgroundTasks() {
    // FUNCTION TO RUN IN BACKROUND ON APP WAKE

    return Future.delayed(Duration(seconds: 1)).whenComplete(
      () async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        final bool appLaunchedForFirstTime =
            sharedPreferences.getBool("com.quinbay.quora-applaunchkey") ?? true;

        final String accessToken =
            sharedPreferences.getString("com.quinbay.quora-accesstoken");

        if (appLaunchedForFirstTime) {
          // IF THE APP IS LAUNCHED FOR THE FIRST TIME SEND USER TO ONBOARDING SCREEN
          sharedPreferences.setBool("com.quinbay.quora-applaunchkey", false);

          Navigator.pushReplacementNamed(context, "/onboarding");
        } else {
          // CHECK IF AN ACCESS TOKEN IS AVAILABLE IN LOCAL STORAGE

          if (accessToken != null) {
            // GO TO DASHBOARD
            Navigator.pushReplacementNamed(context, "/dashboard");
          } else {
            // GO TO LOGIN SCREEN
            Navigator.pushReplacementNamed(context, "/login");
          }
        }
      },
    );
  }

  Future<void> login(String username, String password) async {
    AuthenticationApi authenticationApi =
        AuthenticationApi(Duration(seconds: 15));

    // show progress bar
    showProgressIndicator();
    ApiResponse apiResponse =
        await authenticationApi.login(username: username, password: password);

    if (apiResponse.success) {
      Navigator.pop(context);

      // call local quora service to see if user is registered

      // save jwt token in sharedpref

      showSnackbar(
          backgroundColor: successGreen,
          textColor: successText,
          icon: appIcons.success,
          content: "welcome back $username!");

      Future.delayed(Duration(milliseconds: 3000)).whenComplete(() {
        Navigator.pushReplacementNamed(context, '/dashboard');
      });
    } else {
      Navigator.pop(context);

      showSnackbar(
          backgroundColor: errorRed,
          textColor: errorText,
          icon: appIcons.error,
          content: apiResponse.error);
    }
  }

  void showProgressIndicator() {
    showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) {
          return Container(
            height: 50.0,
            width: 50.0,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors().blue),
            ),
          );
        });
  }

  Future<void> logout() async {
    AuthenticationApi authenticationApi =
        AuthenticationApi(Duration(seconds: 15));

    // show progress bar
    showProgressIndicator();

    ApiResponse logoutResponse = await authenticationApi.logout();

    if (logoutResponse.success) {
      // logout from app locally

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      sharedPreferences.remove("com.quinbay.quora-accesstoken");
      sharedPreferences.remove("com.quinbay.quora-user");

      Future.delayed(Duration(milliseconds: 3000)).whenComplete(() {
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      });
    } else {
      Navigator.pop(context);
      showSnackbar(
          backgroundColor: errorRed,
          textColor: errorText,
          icon: appIcons.error,
          content: logoutResponse.error);
    }
  }

  Future<void> register(
      String username,
      String password,
      List<String> interests,
      String firstname,
      String lastname,
      String bio) async {
    AuthenticationApi authenticationApi =
        AuthenticationApi(Duration(seconds: 15));

    // show progress bar
    showProgressIndicator();
    ApiResponse apiResponse = await authenticationApi.register(
        username: username,
        password: password,
        interests: interests,
        firstname: firstname,
        lastname: lastname);

    if (apiResponse.success) {
      Navigator.pop(context);

      showSnackbar(
          backgroundColor: successGreen,
          textColor: successText,
          icon: appIcons.success,
          content: "welcome $username!");

      Future.delayed(Duration(milliseconds: 3000)).whenComplete(() {
        Navigator.pushReplacementNamed(context, '/dashboard');
      });
    } else {
      Navigator.pop(context);

      showSnackbar(
          backgroundColor: errorRed,
          textColor: errorText,
          icon: appIcons.error,
          content: apiResponse.error);
    }
  }

  void showSnackbar(
      {@required String content,
      Duration duration,
      @required Color backgroundColor,
      Icon icon,
      Color textColor}) {
    Flushbar(
      messageText: Text(
        content,
        style: TextStyle(
            fontFamily: "Roboto", color: textColor ?? AppColors().white),
        textAlign: TextAlign.left,
      ),
      icon: Theme(
          data: ThemeData(
              iconTheme: IconThemeData(color: textColor ?? AppColors().white)),
          child: icon ?? appIcons.settings),
      backgroundColor: backgroundColor ?? AppColors().black,
      duration: duration ?? Duration(milliseconds: 2000),
      flushbarPosition: FlushbarPosition.BOTTOM,
      maxWidth: Responsive(context).width(267),
      margin: EdgeInsets.only(bottom: 35),
      blockBackgroundInteraction: true,
      padding: EdgeInsets.all(11),
      borderRadius: 5.0,
    )..show(context);
  }
}
