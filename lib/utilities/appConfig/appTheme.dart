import 'package:common_infra_ads/utilities/appConfig/responsive.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';

class AppTheme {
  final AppColors appColors;
  ThemeData themeData;
  Responsive responsive;

  AppTheme({@required this.appColors}) {
    this.themeData = ThemeData(
      fontFamily: "Montserrat",
      errorColor: appColors.red,
      primaryColor: appColors.quoraRed,
      focusColor: appColors.blue,
      highlightColor: appColors.white,
      indicatorColor: appColors.quoraRed,
      scaffoldBackgroundColor: appColors.white,
      snackBarTheme: SnackBarThemeData(),
      textTheme: TextTheme(),
    );
  }
}
