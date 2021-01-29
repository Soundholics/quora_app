import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);

    appConfig.businessLogic.splashScreenBackgroundTasks();

    return Scaffold(
      body: Container(
        height: appConfig.responsive.heightBasedOnPercentage(100),
        width: appConfig.responsive.widthBasedOnPercentage(100),
        color: appConfig.appColors.quoraRed,
        alignment: Alignment.center,
        child: logo,
      ),
    );
  }

  Widget get logo {
    return SizedBox(
      height: appConfig.responsive.heightBasedOnPercentage(35),
      child: Image.asset("assets/logo/quora.jpg"),
    );
  }
}
