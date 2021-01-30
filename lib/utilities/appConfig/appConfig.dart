import 'package:common_infra_ads/businessLogic/businessLogic.dart';
import 'package:common_infra_ads/utilities/appConfig/appTextTheme.dart';
import 'package:common_infra_ads/utilities/appConfig/responsive.dart';
import 'package:flutter/material.dart';

import 'appColors.dart';

class AppConfig {
  // This class is used to access the objects of classes dealing with the overall configutation of the app
  // Do not make any changes in this class unless absolutely necessary as changes cna reflect on the whole app

  final BuildContext context;
  final AppColors appColors = AppColors();
  BusinessLogic businessLogic;
  Responsive responsive;
  AppTextTheme appTextTheme;
  AppConfig(this.context) {
    businessLogic = BusinessLogic(context);
    responsive = Responsive(context);
    appTextTheme = AppTextTheme(responsive, appColors);
  }

  // Update the App Version code upon deployment
  final String appVersion = "v 0.0.1 -a";
  final String baseAuthUrl = "http://10.177.2.29:9005/";
  final String baseGatewayUrl = "http://10.177.2.29:8760/";
}
