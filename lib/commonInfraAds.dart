import 'package:common_infra_ads/utilities/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utilities/appConfig/appColors.dart';
import 'utilities/appConfig/appTheme.dart';

class CommonInfraAds extends StatefulWidget {
  final RouteGenerator routes = RouteGenerator();
  @override
  _CommonInfraAdsState createState() => _CommonInfraAdsState();
}

class _CommonInfraAdsState extends State<CommonInfraAds> {
  final AppTheme appTheme = AppTheme(appColors: AppColors());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      key: Key("CommonInfraAds"),
      debugShowCheckedModeBanner: false,
      theme: appTheme.themeData,
      title: "CommonInfraAds",
      color: appTheme.appColors.white,
      onGenerateRoute: widget.routes.generateRoute,
      initialRoute: '/',
    );
  }
}
