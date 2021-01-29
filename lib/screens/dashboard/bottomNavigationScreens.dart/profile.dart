import 'dart:convert';

import 'package:common_infra_ads/dataModels/user.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/utilities/enums.dart';
import 'package:common_infra_ads/widgets/engagementDetailsHolder.dart';
import 'package:common_infra_ads/widgets/profileOptions.dart';
import 'package:flutter/cupertino.dart';
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
  ProfileVisibility profileVisibility = ProfileVisibility.public;
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

    if (user.isPrivate) {
      profileVisibility = ProfileVisibility.private;
    }

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
              ? [
                  fetchProfile,
                ]
              : [
                  userImage,
                  sizedBox(15),
                  userName,
                  sizedBox(1),
                  engagementBanner,
                  profileVisibilityBanner,
                  sizedBox(15),
                  profileOptionsBanner,
                ],
        ),
      ),
    );
  }

  Widget get profileOptionsBanner {
    return Container(
      width: appConfig.responsive.widthBasedOnPercentage(85),
      height: appConfig.responsive.height(200),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: appConfig.responsive.width(20),
        vertical: appConfig.responsive.height(13),
      ),
      decoration: BoxDecoration(
        color: appConfig.appColors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ProfileOption(
            title: "Edit Profile",
            appConfig: appConfig,
            onTap: () {},
          ),
          seperatorHorizontal,
          ProfileOption(
            title: "Question History",
            appConfig: appConfig,
            onTap: () {},
          ),
          seperatorHorizontal,
          ProfileOption(
            title: "Answer History",
            appConfig: appConfig,
            onTap: () {},
          ),
          seperatorHorizontal,
          ProfileOption(
            title: "Logout",
            appConfig: appConfig,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget get fetchProfile {
    return Center(
      child: MaterialButton(
        onPressed: () {
          setState(() {});
        },
        child: Text("Chick Here to Refresh"),
      ),
    );
  }

  Widget get engagementBanner {
    return Container(
      height: appConfig.responsive.height(127),
      width: appConfig.responsive.width(331),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: appConfig.responsive.height(10),
          horizontal: appConfig.responsive.width(20)),
      decoration: BoxDecoration(
          color: appConfig.appColors.white,
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          seperatorHorizontal,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EngagementHolder(
                title: "Followers",
                value: "500",
                units: "",
                appConfig: appConfig,
              ),
              EngagementHolder(
                title: "Following",
                value: "200",
                units: "",
                appConfig: appConfig,
              ),
            ],
          ),
          seperatorHorizontal,
        ],
      ),
    );
  }

  Widget get profileVisibilityBanner {
    final profileVisibilityChildren = <int, Widget>{
      ProfileVisibility.public.index: SizedBox(
        height: appConfig.responsive.height(42),
        child: Center(
            child: Text("Public", style: TextStyle(fontFamily: "Roboto"))),
      ),
      ProfileVisibility.private.index: SizedBox(
        height: appConfig.responsive.height(42),
        child: Center(
            child: Text("Private", style: TextStyle(fontFamily: "Roboto"))),
      )
    };
    return Container(
      width: appConfig.responsive.width(177),
      child: CupertinoSlidingSegmentedControl(
        backgroundColor: Colors.grey[100],
        thumbColor: appConfig.appColors.quoraRed,
        groupValue: profileVisibility.index,
        children: profileVisibilityChildren,
        onValueChanged: (index) {
          setState(() {
            if (index == ProfileVisibility.public.index) {
              profileVisibility = ProfileVisibility.public;
              user.isPrivate = false;

              // trigger an api to change the value
            } else {
              profileVisibility = ProfileVisibility.private;
              user.isPrivate = true;

              // trigger an api to change the value
            }
          });
        },
      ),
    );
  }

  Widget get seperatorHorizontal {
    return Container(
      color: appConfig.appColors.black.withOpacity(0.5),
      height: appConfig.responsive.height(0.5),
      width: appConfig.responsive.width(297),
    );
  }

  Widget get engagementCard {
    return Center(
      child: Container(
        height: appConfig.responsive.height(100),
        width: appConfig.responsive.widthBasedOnPercentage(85),
        decoration: BoxDecoration(
          color: appConfig.appColors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget get userName {
    return Column(
      children: [
        Text(
          "${user.firstname}" + " " + " ${user.lastname}",
          style: appConfig.appTextTheme.textStyle3
              .copyWith(color: appConfig.appColors.quoraRed),
        ),
        sizedBox(1),
        Text("${user.useremail}",
            style: appConfig.appTextTheme.textStyle36.copyWith(
                fontSize: appConfig.responsive.height(14),
                fontWeight: FontWeight.normal,
                color: appConfig.appColors.black.withOpacity(0.4),
                fontFamily: "Roboto")),
      ],
    );
  }

  Widget get userImage {
    print(user.firstname);
    print(accessToken);

    return Image.asset(
      "assets/images/signUp.png",
    );
  }

  SizedBox sizedBox(double height, [double width = 0]) {
    return SizedBox(
        height: appConfig.responsive.height(height),
        width: appConfig.responsive.width(width ?? 0));
  }
}
