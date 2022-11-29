import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_testing/ui/views/home_page/home_page.dart';
import 'package:unit_testing/ui/views/sign_in_page/sign_in_page.dart';
import 'package:unit_testing/ui/views/sign_up_page/sign_up_page.dart';
import 'package:unit_testing/ui/views/welcome_page/welcome_page.dart';

import '../constant/route_constant.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  const HomePage());
      case Routes.signInScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInPage());
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpPage());
      case Routes.welcomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WelcomePage());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}