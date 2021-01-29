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

  List<QuestionForFeed> questionsForFeed = List();

  @override
  Widget build(BuildContext context) {
    questionsForFeed.add(QuestionForFeed(
        useremail: "akshithchittiveli@gmail.com",
        questionId: 1,
        questionString: "What is the full form of UNO?",
        createdOn: DateTime.now().toString(),
        category: "Bollywood",
        topAnswerBy: "someone@quinbay.com",
        topAnswer:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32."));

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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QuestionOnFeed(
                      appConfig: appConfig,
                      questionForFeed: questionsForFeed[0]),
                  QuestionOnFeed(
                      appConfig: appConfig,
                      questionForFeed: questionsForFeed[0]),
                  QuestionOnFeed(
                      appConfig: appConfig,
                      questionForFeed: questionsForFeed[0]),
                  QuestionOnFeed(
                      appConfig: appConfig,
                      questionForFeed: questionsForFeed[0]),
                  QuestionOnFeed(
                      appConfig: appConfig,
                      questionForFeed: questionsForFeed[0])
                ],
              ),
            )),
      ),
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
                // api call to post the question
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
