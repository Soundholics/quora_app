import 'dart:convert';

import 'package:common_infra_ads/backend/apiCalls.dart';
import 'package:common_infra_ads/dataModels/DTOs/questionsForFeed.dart';
import 'package:common_infra_ads/dataModels/DTOs/searchResult.dart';
import 'package:common_infra_ads/dataModels/user.dart';
import 'package:common_infra_ads/screens/userProfile/userProfile.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/utilities/navigation/pageTransitionAnimation.dart';
import 'package:common_infra_ads/widgets/questionOnFeed.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchResultWidget extends StatelessWidget {
  AppConfig appConfig;
  final SearchResult searchResult;

  SearchResultWidget({this.searchResult});

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return InkWell(
      onTap: () async {
        // check if the profile is business profile

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        print(sharedPreferences.getString("com.quinbay.quora-accesstoken"));

        Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Authorization':
              sharedPreferences.getString("com.quinbay.quora-accesstoken")
        };

        // check if the user is a business profile or not
        http.Response response = await http.get(
            Uri.parse(appConfig.baseGatewayUrl +
                'quoraUsers/isBusinessByUserEmail/${this.searchResult.businessEmail}'),
            headers: headers);

        print(response.body);
        if (response.body.toLowerCase().toString() == false.toString()) {
          // if yes send the user to User Profile Screen

          // make a call to get user details
          // /{userEmail}
          http.Response userDetails = await http.get(
              Uri.parse(appConfig.baseGatewayUrl +
                  'quoraUsers/getUserDetailsByUserEmail/${this.searchResult.businessEmail}'),
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
                    'feed/otherProfilePage/${this.searchResult.businessEmail}'),
                headers: headers);

            print(userQuestions.body);

            List<QuestionOnFeed> questionsForProfile = List();

            jsonDecode(userQuestions.body).forEach((question) {
              questionsForProfile.add(QuestionOnFeed(
                  questionForFeed: QuestionForFeed.fromJson(question)
                    ..useremail = this.searchResult.businessEmail));
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
        } else {
          // api call to get business details
          // if false send the user to Business Profile Screen
          appConfig.businessLogic.showSnackbar(
              content:
                  "Please Visit Our Web App to View Business Profiles\n~Quora Team",
              backgroundColor: appConfig.appColors.black);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: appConfig.responsive.height(5)),
        child: Container(
          decoration:
              BoxDecoration(color: appConfig.appColors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ]),
          padding: EdgeInsets.symmetric(
              vertical: appConfig.responsive.height(15),
              horizontal: appConfig.responsive.width(20)),
          width: appConfig.responsive.widthBasedOnPercentage(97),
          child: ListTile(
            isThreeLine: false,
            title: Text((searchResult.firstname ?? searchResult.businessName)),
            subtitle:
                Text(searchResult.useremail ?? searchResult.businessEmail),
            trailing: searchResult.isPrivate ?? true
                ? Icon(
                    Icons.lock,
                    color: appConfig.appColors.quoraRed,
                  )
                : Icon(
                    Icons.lock,
                    color: Colors.transparent,
                  ),
          ),
        ),
      ),
    );
  }
}
