import 'package:common_infra_ads/backend/apiCalls.dart';
import 'package:common_infra_ads/backend/apiResponse.dart';
import 'package:common_infra_ads/dataModels/question.dart';

import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/uaqWidget.dart';

import 'package:flutter/material.dart';

class UAQs extends StatelessWidget {
  AppConfig appConfig;
  _Backend backend = _Backend();

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          height: appConfig.responsive.heightBasedOnPercentage(100),
          width: appConfig.responsive.widthBasedOnPercentage(100),
          child: FutureBuilder(
              initialData: backend.unansweredQuestions,
              future: backend.fetchUnansweredQuestions(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        "Can't reach our servers at the moment, please try after some time"),
                  );
                } else if (backend.unansweredQuestions.length == 0) {
                  return Center(
                    child: Text(
                        "No Questions Available at the moment! Try again later"),
                  );
                } else if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: backend.unansweredQuestions),
                  );
                }
              }),
        ),
      ),
    );
  }
}

class _Backend {
  UaqsApi uaqsApi = UaqsApi(Duration(seconds: 5));

  List<UaqWidget> unansweredQuestions = List();

  Future<List<UaqWidget>> fetchUnansweredQuestions() async {
    ApiResponse apiResponse = await uaqsApi.getUnansweredQuestions();

    apiResponse.data.forEach((unansweredQuestion) {
      print(unansweredQuestion.toString());
      unansweredQuestions
          .add(UaqWidget(question: Question.fromJson(unansweredQuestion)));
    });

    return unansweredQuestions;
  }
}
