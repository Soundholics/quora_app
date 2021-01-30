import 'package:common_infra_ads/dataModels/user.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/questionOnFeed.dart';
import 'package:flutter/material.dart';

// check if following

// Questions

// User Details

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({@required this.user, this.questionsForFeed});

  final User user;
  final List<QuestionOnFeed> questionsForFeed;

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.useremail),
        centerTitle: true,
      ),
      body: Container(
        height: appConfig.responsive.heightBasedOnPercentage(100),
        width: appConfig.responsive.widthBasedOnPercentage(100),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: widget.questionsForFeed,
          ),
        ),
      ),
    );
  }
}
