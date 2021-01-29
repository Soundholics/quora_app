import 'package:common_infra_ads/dataModels/DTOs/questionsForFeed.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:flutter/material.dart';

class QuestionOnFeed extends StatelessWidget {
  final AppConfig appConfig;
  final QuestionForFeed questionForFeed;

  QuestionOnFeed({@required this.appConfig, @required this.questionForFeed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: go to questions page
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionForFeed.questionString,
                style: appConfig.appTextTheme.textStyle5.copyWith(
                    fontSize: appConfig.responsive.height(20),
                    color: appConfig.appColors.quoraRed),
              ),
              sizedBox(5),
              Text(
                "Asked by ${questionForFeed.useremail}",
                style: appConfig.appTextTheme.textStyle39.copyWith(
                  color: appConfig.appColors.black.withOpacity(0.4),
                  fontSize: appConfig.responsive.height(11),
                ),
              ),
              sizedBox(5),
              Text(
                questionForFeed.topAnswer,
                style: appConfig.appTextTheme.textStyle1,
              ),
              sizedBox(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Answer by ${questionForFeed.topAnswerBy}",
                    style: appConfig.appTextTheme.textStyle39.copyWith(
                      color: appConfig.appColors.black.withOpacity(0.4),
                      fontSize: appConfig.responsive.height(11),
                    ),
                  ),
                  category,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get category {
    return Container(
      height: appConfig.responsive.height(20),
      padding: EdgeInsets.all(2),
      child: Text(
        "${questionForFeed.category}",
        style: appConfig.appTextTheme.textStyle1,
      ),
      decoration: BoxDecoration(
          color: appConfig.appColors.pastelRed,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  SizedBox sizedBox(double height, [double width = 0]) {
    return SizedBox(
        height: appConfig.responsive.height(height),
        width: appConfig.responsive.width(width ?? 0));
  }
}
