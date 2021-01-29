import 'package:common_infra_ads/backend/apiCalls.dart';
import 'package:common_infra_ads/backend/apiResponse.dart';
import 'package:common_infra_ads/dataModels/DTOs/questionsForFeed.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/button.dart';
import 'package:common_infra_ads/widgets/customTextField1.dart';
import 'package:common_infra_ads/widgets/questionOnFeed.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  AppConfig appConfig;
  _Backend backend = _Backend();

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // show dialog to post question
          showDialog(
              context: context, builder: (context) => PostQuestionDialog());
        },
        tooltip: "Post Question",
        focusColor: appConfig.appColors.quoraRed,
        backgroundColor: appConfig.appColors.quoraRed,
        child: Icon(
          Icons.add,
          color: appConfig.appColors.white,
          size: appConfig.responsive.height(30),
        ),
      ),
      body: SafeArea(
          child: Container(
        height: appConfig.responsive.heightBasedOnPercentage(100),
        width: appConfig.responsive.widthBasedOnPercentage(100),
        padding: EdgeInsets.only(
            left: appConfig.responsive.width(10),
            right: appConfig.responsive.width(10),
            top: appConfig.responsive.height(10)),
        child: FutureBuilder(
          initialData: backend.questionsForFeed,
          future: backend.fetchQuestionForFeed(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: snapshot.data,
                  ));
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(appConfig.appColors.quoraRed),
                ),
              );
            }
          },
        ),
      )),
    );
  }
}

class PostQuestionDialog extends StatefulWidget {
  @override
  _PostQuestionDialogState createState() => _PostQuestionDialogState();
}

class _PostQuestionDialogState extends State<PostQuestionDialog> {
  AppConfig appConfig;

  final TextEditingController question = TextEditingController();

  String selectedCategory = "Bollywood";
  _Backend backend = _Backend();

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return Dialog(
      child: Container(
        alignment: Alignment.center,
        height: appConfig.responsive.heightBasedOnPercentage(44),
        width: appConfig.responsive.widthBasedOnPercentage(95),
        decoration: BoxDecoration(color: appConfig.appColors.white),
        padding: EdgeInsets.symmetric(
            horizontal: appConfig.responsive.width(25),
            vertical: appConfig.responsive.height(17)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sizedBox(25),
            CustomTextField1(
              appConfig: appConfig,
              textEditingController: question,
              title: "Question",
              textInputType: TextInputType.text,
              maxLines: 6,
            ),
            sizedBox(25),
            DropdownButton<String>(
              value: selectedCategory,
              items: <String>[
                'Bollywood',
                'Sports',
                'Science',
                'Maths',
                'Technology'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
            ),
            sizedBox(25),
            Button(
              title: "Post Question",
              appConfig: appConfig,
              color: appConfig.appColors.quoraRed,
              width: appConfig.responsive.width(180),
              height: appConfig.responsive.height(45),
              onTap: () async {
                appConfig.businessLogic.showProgressIndicator();

                ApiResponse apiResponse =
                    await backend.postQuestion(question.text, selectedCategory);

                if (apiResponse.success) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  appConfig.businessLogic.showSnackbar(
                      content: "Question Posted Successfully",
                      backgroundColor: appConfig.appColors.pastelGreen,
                      icon: appConfig.businessLogic.appIcons.success);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  appConfig.businessLogic.showSnackbar(
                      content: "Failed to add question",
                      backgroundColor: appConfig.appColors.pastelRed,
                      icon: appConfig.businessLogic.appIcons.error);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  SizedBox sizedBox(double height, [double width = 0]) {
    return SizedBox(
        height: appConfig.responsive.height(height),
        width: appConfig.responsive.width(width ?? 0));
  }
}

class _Backend {
  FeedApi feedApi = FeedApi(Duration(seconds: 2));

  List<QuestionOnFeed> questionsForFeed = List();

  Future<List<QuestionOnFeed>> fetchQuestionForFeed() async {
    ApiResponse apiResponse = await feedApi.populateUserFeed();

    print("object");
    apiResponse.data.forEach((question) {
      print(question.toString());
      questionsForFeed.add(
          QuestionOnFeed(questionForFeed: QuestionForFeed.fromJson(question)));
    });

    return questionsForFeed;
  }

  Future<ApiResponse> postQuestion(
      String questionString, String category) async {
    ApiResponse apiResponse = await feedApi.postQuestion(
        questionString: questionString, category: category);

    return apiResponse;
  }
}
