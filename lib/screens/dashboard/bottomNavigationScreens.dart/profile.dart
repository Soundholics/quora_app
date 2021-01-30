import 'dart:convert';

import 'package:common_infra_ads/backend/apiCalls.dart';
import 'package:common_infra_ads/backend/apiResponse.dart';
import 'package:common_infra_ads/dataModels/DTOs/questionsForFeed.dart';
import 'package:common_infra_ads/dataModels/DTOs/userEngagement.dart';
import 'package:common_infra_ads/dataModels/user.dart';
import 'package:common_infra_ads/screens/userProfile/userProfile.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/utilities/enums.dart';
import 'package:common_infra_ads/utilities/navigation/pageTransitionAnimation.dart';
import 'package:common_infra_ads/widgets/engagementDetailsHolder.dart';
import 'package:common_infra_ads/widgets/profileOptions.dart';
import 'package:common_infra_ads/widgets/questionOnFeed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  ProfileScreen(this.sharedPreferences);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppConfig appConfig;

  String accessToken = "";
  ProfileVisibility profileVisibility = ProfileVisibility.public;
  User user = User();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences sharedPreferences = widget.sharedPreferences;
    accessToken = sharedPreferences.getString("com.quinbay.quora-accesstoken");
    user = User.fromJson(
        jsonDecode(sharedPreferences.getString("com.quinbay.quora-user")));

    if (user.isPrivate ?? false) {
      profileVisibility = ProfileVisibility.private;
    }
    appConfig = AppConfig(context);
    return Scaffold(
      body: Container(
        height: appConfig.responsive.heightBasedOnPercentage(100),
        width: appConfig.responsive.widthBasedOnPercentage(100),
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            top: appConfig.responsive.heightBasedOnPercentage(15)),
        child: Column(
          children: [
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
            onTap: () {
              // dialog to edit profile and api call upon click

              appConfig.businessLogic.showSnackbar(
                  content: "Feature would be available soon!\n~Quora Team",
                  backgroundColor: appConfig.appColors.black);
            },
          ),
          seperatorHorizontal,
          ProfileOption(
            title: "Question History",
            appConfig: appConfig,
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();

              print(
                  sharedPreferences.getString("com.quinbay.quora-accesstoken"));

              Map<String, String> headers = {
                'Content-Type': 'application/json',
                'Authorization':
                    sharedPreferences.getString("com.quinbay.quora-accesstoken")
              };
              http.Response userDetails = await http.get(
                  Uri.parse(appConfig.baseGatewayUrl +
                      'quoraUsers/getUserDetailsByUserEmail/${this.user.useremail}'),
                  headers: headers);

              User user = User.fromJson(jsonDecode(userDetails.body));

              print(userDetails.body);

              // check if user is private

              if (user.isPrivate) {
                // if true send directly to profile
                Navigator.push(
                    context,
                    EnterExitRoute(
                        enterPage: UserProfileScreen(
                      user: user,
                    )));
              } else {
                // if false
                // make a call to get user questions
                http.Response userQuestions = await http.get(
                    Uri.parse(appConfig.baseGatewayUrl +
                        'feed/otherProfilePage/${this.user.useremail}'),
                    headers: headers);

                print(userQuestions.body);

                List<QuestionOnFeed> questionsForProfile = List();

                jsonDecode(userQuestions.body).forEach((question) {
                  questionsForProfile.add(QuestionOnFeed(
                      questionForFeed: QuestionForFeed.fromJson(question)
                        ..useremail = "You"));
                });

                // feed/otherProfilePage/useremail //get //QuestionFeedDto
                // send the user to profile
                Navigator.push(
                    context,
                    EnterExitRoute(
                        enterPage: UserProfileScreen(
                      user: user,
                      questionsForFeed: questionsForProfile,
                    )));
              }
            },
          ),
          seperatorHorizontal,
          ProfileOption(
            title: "Answer History",
            appConfig: appConfig,
            onTap: () {
              // api call to get the answers and push to new screen
              appConfig.businessLogic.showSnackbar(
                  content: "Feature would be available soon!\n~Quora Team",
                  backgroundColor: appConfig.appColors.black);
            },
          ),
          seperatorHorizontal,
          ProfileOption(
            title: "Logout",
            appConfig: appConfig,
            onTap: () {
              // logout api call and In app Logout business logic
              appConfig.businessLogic.logout();
            },
          ),
        ],
      ),
    );
  }

  Widget get engagementBanner {
    _Backend backend = _Backend();

    return FutureBuilder(
        initialData: backend.userEngagement,
        future: backend.fetchUserEngagement(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error Reaching Servers");
          }
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(appConfig.appColors.quoraRed),
              ),
            );
          } else if (snapshot.hasData) {
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
                        value: "${backend.userEngagement.followers}",
                        units: "",
                        appConfig: appConfig,
                      ),
                      EngagementHolder(
                        title: "Following",
                        value: "${backend.userEngagement.followings}",
                        units: "",
                        appConfig: appConfig,
                      ),
                    ],
                  ),
                  seperatorHorizontal,
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation(appConfig.appColors.quoraRed),
              ),
            );
          }
        });
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
        onValueChanged: (index) async {
          setState(() {
            if (index == ProfileVisibility.public.index &&
                profileVisibility.index != ProfileVisibility.public.index) {
              profileVisibility = ProfileVisibility.public;
              user.isPrivate = false;

              appConfig.businessLogic.changeProfileVisibility();

              // trigger an api to change the value
            }
            if (index == ProfileVisibility.private.index &&
                profileVisibility.index != ProfileVisibility.private.index) {
              profileVisibility = ProfileVisibility.private;
              user.isPrivate = true;

              appConfig.businessLogic.changeProfileVisibility();
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

class _Backend {
  UserEngagement userEngagement = UserEngagement();
  ProfileApi profileApi = ProfileApi(Duration(seconds: 5));

  Future<UserEngagement> fetchUserEngagement() async {
    ApiResponse apiResponse = await profileApi.getEngagementStats();

    userEngagement = apiResponse.data;
    return userEngagement;
  }
}
