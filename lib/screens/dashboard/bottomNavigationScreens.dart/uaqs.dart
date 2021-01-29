import 'package:common_infra_ads/dataModels/question.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/uaqWidget.dart';
import 'package:flutter/material.dart';

class UAQs extends StatelessWidget {
  AppConfig appConfig;

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          height: appConfig.responsive.heightBasedOnPercentage(100),
          width: appConfig.responsive.widthBasedOnPercentage(100),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021")),
                UaqWidget(
                    appConfig: appConfig,
                    question: Question(
                        category: "Bollywood",
                        questionId: 1,
                        questionString:
                            "Why can't we use floating action button with containers in flutter?",
                        useremail: "tarun@gmail.com",
                        isAnswered: false,
                        createdOn: "Feb 2021"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
