import 'package:common_infra_ads/screens/dashboard/bottomNavigationScreens.dart/uaqs.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/utilities/enums.dart';
import 'package:common_infra_ads/widgets/BottomNavigationItem.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomNavigationScreens.dart/feed.dart';
import 'bottomNavigationScreens.dart/profile.dart';
import 'bottomNavigationScreens.dart/search.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AppConfig appConfig;
  DashboardScreen currentDashboardScreen;

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    currentDashboardScreen = DashboardScreen.feed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);

    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        body: dashBoardScreen,
      ),
    );
  }

  Widget get dashBoardScreen {
    // do not change the order in dashBoardScreens list
    final List<Widget> dashBoardScreens = [
      Feed(),
      Search(),
      UAQs(),
      ProfileScreen(sharedPreferences),
    ];
    return dashBoardScreens[currentDashboardScreen.index];
  }

  Widget get bottomNavigationBar {
    return BottomNavigationBar(
        elevation: 15.0,
        backgroundColor: appConfig.appColors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentDashboardScreen.index,
        onTap: (index) async {
          if (currentDashboardScreen.index != index) {
            if (currentDashboardScreen == DashboardScreen.profile) {
              this.sharedPreferences = await SharedPreferences.getInstance();
            }

            this.setState(() {
              currentDashboardScreen = DashboardScreen.values.elementAt(index);
            });
          }
        },
        items: [
          BottomNavBarItem(
            appConfig: appConfig,
            label: "Feed",
            iconAddress: "assets/icons/Home.png",
          ).build(),
          BottomNavBarItem(
            appConfig: appConfig,
            label: "Search",
            iconAddress: "assets/icons/Stats.png",
          ).build(),
          BottomNavBarItem(
            appConfig: appConfig,
            label: "UAQ's",
            iconAddress: "assets/icons/Clipboard.png",
          ).build(),
          BottomNavBarItem(
            appConfig: appConfig,
            label: "Profile",
            iconAddress: "assets/icons/Home.png",
          ).build(),
        ]);
  }
}
