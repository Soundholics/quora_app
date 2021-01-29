import 'package:common_infra_ads/dataModels/question.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class UaqWidget extends StatelessWidget {
  AppConfig appConfig;
  final Question question;

  UaqWidget({@required this.question});
  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return InkWell(
      onTap: () {
        // show dialog to answer the question
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
            title: Text(
              question.questionString,
              style: TextStyle(fontFamily: "Roboto"),
            ),
            subtitle: Text(
              "Asked by " + question.useremail + "\n${question.category}",
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ),
    );
  }
}
