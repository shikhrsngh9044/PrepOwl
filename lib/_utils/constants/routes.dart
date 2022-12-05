import 'package:get/get_navigation/get_navigation.dart';
import 'package:prepowl/modules/onboarding/view/onboarding_view.dart';

import '../../modules/login/view/login_screen.dart';
import '../../modules/register/view/register_page.dart';
import '../../modules/welcome/welcome.dart';

class RouteNames {
  static const String loginPage = "/login";
  static const String signupPage = "/signup";
  static const String mainHome = "/main_home";
  static const String homePage = "/home_page";
  static const String onboarding = "/onboarding";
  static const String register = "/register";
}

final publicPages = [
  GetPage(name: '/', page: () => const Welcome()),
  GetPage(name: RouteNames.loginPage, page: () => const Login()),
  GetPage(name: RouteNames.onboarding, page: () => const Onboarding()),
  GetPage(name: RouteNames.register, page: () => const RegisterScreen())
];

final authorizedPages = [
  GetPage(name: RouteNames.homePage, page: () => const Welcome()),
];
