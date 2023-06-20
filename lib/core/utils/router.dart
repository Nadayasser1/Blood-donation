

import 'package:flutter/cupertino.dart';
import 'package:graduation/core/utils/routes.dart';

import '../../presentation/pages/home_view.dart';
import '../../presentation/pages/login_view.dart';
import '../../presentation/pages/onBoarding_view.dart';
import '../../presentation/pages/sign_up.dart';
import '../../presentation/pages/splash_view.dart';

Route<dynamic>? generateRoute (RouteSettings routeSettings){
  switch (routeSettings.name) {
    case Routes.splash:
      return CupertinoPageRoute(builder: (_) => const SplashView());
    case Routes.onBoarding:
      return CupertinoPageRoute(builder: (_) => const OnBoarding());
    case Routes.login:
      return CupertinoPageRoute(builder: (_) => LogInView());
    case Routes.signUp:
      return CupertinoPageRoute(builder: (_) => SignUpView());
    case Routes.home:
      return CupertinoPageRoute(builder: (_) => const HomeView());
    default:
      return CupertinoPageRoute(builder: (_) => const SplashView());
  }
}
