import 'package:common_infra_ads/screens/authentication/loginScreen.dart';
import 'package:common_infra_ads/screens/authentication/registrationScreen.dart';
import 'package:common_infra_ads/screens/dashboard/dashboard.dart';
import 'package:common_infra_ads/screens/onboarding/onboarding.dart';
import 'package:common_infra_ads/screens/splashscreen/splashscreen.dart';
import 'package:common_infra_ads/utilities/navigation/pageTransitionAnimation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final List<Object> arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });

      case '/registration':
        return EnterExitRoute(enterPage: RegistrationScreen());

      case '/login':
        return EnterExitRoute(enterPage: LoginScreen());

      case '/dashboard':
        return EnterExitRoute(enterPage: Dashboard());

      case '/onboarding':
        return EnterExitRoute(enterPage: Onboarding());

      default:
        return MaterialPageRoute(builder: (context) {
          return SplashScreen();
        });
    }
  }
}
