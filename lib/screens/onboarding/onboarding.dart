import 'package:common_infra_ads/utilities/appConfig/appConfig.dart';
import 'package:common_infra_ads/widgets/button.dart';
import 'package:common_infra_ads/widgets/onboardingTile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class Onboarding extends StatelessWidget {
  AppConfig appConfig;

  Color color = Colors.red;

  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    appConfig = AppConfig(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: appConfig.responsive.heightBasedOnPercentage(100),
          width: appConfig.responsive.widthBasedOnPercentage(100),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: appConfig.responsive.width(38),
            right: appConfig.responsive.width(38),
            bottom: appConfig.responsive.height(32),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              pages,
              sizedBox(25),
              pageIndicator,
              sizedBox(60),
              getStartedButton,
              sizedBox(13),
              alreadyHaveAnAccount,
            ],
          ),
        ),
      ),
    );
  }

  Widget get pages {
    return Container(
      height: appConfig.responsive.height(398),
      width: appConfig.responsive.width(287),
      alignment: Alignment.center,
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: [
          OnboardingPage(
            imageFilePath: "assets/images/driveWebsiteVisits.jpg",
            title: "DRIVE WEBSITE VISITS",
            description:
                "Grow online sales, bookings or mailing list signups with online ads that direct people to your website.",
            appConfig: appConfig,
          ),
          OnboardingPage(
            imageFilePath: "assets/images/getMorePhoneCalls.jpg",
            title: "GET MORE PHONE CALLS",
            description:
                "Increase customer calls with ads that feature your phone number and a click-to-call button.",
            appConfig: appConfig,
          ),
          OnboardingPage(
            imageFilePath: "assets/images/increaseShopVisits.jpg",
            title: "INCREASE SHOP VISITS",
            description:
                "Get more customers in the door with business ads that help people find your company on the map",
            appConfig: appConfig,
          ),
        ],
      ),
    );
  }

  Widget get getStartedButton {
    return Button(
      title: "Get Started",
      onTap: () {
        Navigator.pushReplacementNamed(appConfig.context, '/registration');
      },
      appConfig: appConfig,
      color: appConfig.appColors.quoraRed,
    );
  }

  Widget get alreadyHaveAnAccount {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(appConfig.context, "/login");
      },
      child: Text("Already have an account? Login Here",
          style: appConfig.appTextTheme.textStyle1),
    );
  }

  SizedBox sizedBox(double height, [double width = 0]) {
    return SizedBox(
        height: appConfig.responsive.height(height),
        width: appConfig.responsive.width(width ?? 0));
  }

  Widget get pageIndicator {
    return Container(
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: WormEffect(
          dotColor: appConfig.appColors.grey,
          activeDotColor: appConfig.appColors.quoraRed,
          dotHeight: appConfig.responsive.height(13),
          dotWidth: appConfig.responsive.width(13),
        ),
      ),
    );
  }
}
