import 'package:common_infra_ads/dataModels/userDetailsForAuthorization.dart';
import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/CustomTextFiled2.dart';
import 'package:common_infra_ads/widgets/button.dart';
import 'package:common_infra_ads/widgets/customTextField1.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  AppConfig appConfig;

  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController firstname = TextEditingController();

  final TextEditingController lastname = TextEditingController();
  final TextEditingController bio = TextEditingController();

  final List<String> interests = List();

  bool category1 = false;

  bool category2 = false;

  bool category3 = false;

  bool category4 = false;

  bool category5 = false;

  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          height: appConfig.responsive.heightBasedOnPercentage(100),
          width: appConfig.responsive.widthBasedOnPercentage(100),
          padding: EdgeInsets.only(
            left: appConfig.responsive.width(30),
            right: appConfig.responsive.width(30),
            top: appConfig.responsive.height(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("Create Account",
                    style: appConfig.appTextTheme.textStyle16.copyWith(
                        fontSize: appConfig.responsive.height(30),
                        color: appConfig.appColors.quoraRed,
                        fontFamily: "Roboto")),
              ),
              sizedBox(15),
              CustomTextField1(
                appConfig: appConfig,
                title: "Username",
                textEditingController: username,
                textInputType: TextInputType.emailAddress,
                isDense: false,
                hintText: "Qwety@gmail.com",
              ),
              sizedBox(15),
              CustomTextField2(
                appConfig: appConfig,
                title: "Password",
                textEditingController: password,
                textInputType: TextInputType.visiblePassword,
                hintText: "••••••••••",
              ),
              sizedBox(15),
              CustomTextField1(
                appConfig: appConfig,
                title: "Firstname",
                textEditingController: firstname,
                textInputType: TextInputType.name,
                isDense: false,
                hintText: "Stevenson",
              ),
              sizedBox(15),
              CustomTextField1(
                appConfig: appConfig,
                title: "Lastname",
                textEditingController: lastname,
                textInputType: TextInputType.name,
                isDense: false,
                hintText: "Smith",
              ),
              sizedBox(15),
              CustomTextField1(
                appConfig: appConfig,
                title: "Bio",
                textEditingController: bio,
                textInputType: TextInputType.text,
                isDense: false,
                hintText: "Profile Bio",
              ),
              sizedBox(15),
              categoryChips,
              sizedBox(30),
              Center(child: signUpButton),
              sizedBox(15),
              Center(child: alreadyHaveAnAccount)
            ],
          ),
        ),
      ),
    );
  }

  Widget get categoryChips {
    final chips = [
      FilterChip(
          label: Text(
            "Bollywood",
            style: TextStyle(fontFamily: "Roboto"),
          ),
          selected: category1,
          onSelected: (value) {
            setState(() {
              if (category1) {
                interests.remove("Bollywood");
                category1 = false;
              } else {
                interests.add("Bollywoord");
                category1 = true;
              }
            });
          }),
      FilterChip(
          label: Text(
            "Maths",
            style: TextStyle(fontFamily: "Roboto"),
          ),
          selected: category2,
          onSelected: (value) {
            setState(() {
              if (category2) {
                interests.remove("Maths");
                category2 = false;
              } else {
                interests.add("Maths");
                category2 = true;
              }
            });
          }),
      FilterChip(
          label: Text(
            "Science",
            style: TextStyle(fontFamily: "Roboto"),
          ),
          selected: category3,
          onSelected: (value) {
            setState(() {
              if (category3) {
                interests.remove("Science");
                category3 = false;
              } else {
                interests.add("Science");
                category3 = true;
              }
            });
          }),
      FilterChip(
          label: Text(
            "Sports",
            style: TextStyle(fontFamily: "Roboto"),
          ),
          selected: category4,
          onSelected: (value) {
            setState(() {
              if (category4) {
                interests.remove("Sports");
                category4 = false;
              } else {
                interests.add("Sports");
                category4 = true;
              }
            });
          }),
      FilterChip(
          label: Text(
            "Technology",
            style: TextStyle(fontFamily: "Roboto"),
          ),
          selected: category5,
          onSelected: (value) {
            setState(() {
              if (category5) {
                interests.remove("Technology");
                category5 = false;
              } else {
                interests.add("Technology");
                category5 = true;
              }
            });
          })
    ];

    return Wrap(children: [
      for (final chip in chips)
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: appConfig.responsive.width(1)),
          child: chip,
        )
    ]);
  }

  Widget get alreadyHaveAnAccount {
    return ButtonTheme(
      height: appConfig.responsive.height(50),
      minWidth: appConfig.responsive.width(200),
      child: OutlineButton(
          onPressed: () {
            Navigator.pushReplacementNamed(appConfig.context, "/login");
          },
          child: Text("Already have an Account!"),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0))),
    );
  }

  Widget get signUpButton {
    return Button(
      title: "Register",
      appConfig: appConfig,
      color: appConfig.appColors.quoraRed,
      height: appConfig.responsive.height(50),
      width: appConfig.responsive.width(220),
      onTap: () async {
        // registration business logic

        await appConfig.businessLogic.register(username.text, password.text,
            interests, firstname.text, lastname.text, bio.text);

        Navigator.pushReplacementNamed(appConfig.context, "/dashboard");
      },
    );
  }

  Widget get registerButton {
    return Button(
      title: "Sign in with Quinbay",
      onTap: () {
        // create account api call

        Navigator.pushNamedAndRemoveUntil(
            appConfig.context, "/dashboard", (route) => false);
      },
      appConfig: appConfig,
    );
  }

  SizedBox sizedBox(double height, [double width = 0]) {
    return SizedBox(
        height: appConfig.responsive.height(height),
        width: appConfig.responsive.width(width ?? 0));
  }
}
