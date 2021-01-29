import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem {
  final String iconAddress;
  final String label;
  final AppConfig appConfig;

  BottomNavBarItem(
      {@required this.iconAddress,
      @required this.label,
      @required this.appConfig});

  BottomNavigationBarItem build() {
    return BottomNavigationBarItem(
        icon: BottomNavBarActiveIcon(
          color: appConfig.appColors.black,
          appConfig: appConfig,
          label: this.label,
        ),
        label: this.label,
        activeIcon: BottomNavBarActiveIcon(
          color: appConfig.appColors.quoraRed,
          appConfig: appConfig,
          label: this.label,
        ));
  }
}

class BottomNavBarIcon extends StatelessWidget {
  final String iconAddress;
  final AppConfig appConfig;
  final Color color;

  BottomNavBarIcon(
      {@required this.iconAddress, @required this.appConfig, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: appConfig.responsive.height(27),
        width: appConfig.responsive.width(28),
        alignment: Alignment.center,
        child: Image.asset(iconAddress));
  }
}

class BottomNavBarActiveIcon extends StatelessWidget {
  final AppConfig appConfig;
  final String label;
  final Color color;
  BottomNavBarActiveIcon(
      {@required this.appConfig, @required this.label, @required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(label,
            style: appConfig.appTextTheme.textStyle27
                .copyWith(color: this.color)));
  }
}
