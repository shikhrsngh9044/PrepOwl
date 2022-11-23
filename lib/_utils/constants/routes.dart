import 'package:get/get_navigation/get_navigation.dart';

import '../../modules/dashboard/view/dashboard.dart';
import '../../modules/login/view/login_screen.dart';
import '../../modules/onboarding/view/onboarding_view.dart';
import '../../modules/welcome/welcome.dart';

class RouteNames {
  static const String loginPage = "/login";
  static const String signupPage = "/signup";
  static const String onboarding = "/onboarding";
  static const String mainHome = "/main_home";
  static const String homePage = "/home_page";
  static const String dashboard = "/dashboard";
}

final publicPages = [
  GetPage(name: '/', page: () => const Welcome()),
  GetPage(name: RouteNames.loginPage, page: () => const Login()),
  GetPage(name: RouteNames.dashboard, page: () => const Dashboard()),
  GetPage(name: RouteNames.onboarding, page: () => const Onboarding()),
];

final authorizedPages = [
  GetPage(name: RouteNames.homePage, page: () => const Welcome()),
];
