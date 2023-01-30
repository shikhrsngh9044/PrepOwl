import 'package:get/get_navigation/get_navigation.dart';
import 'package:prepowl/modules/doubt/view/widget/doubt_detail.dart';
import 'package:prepowl/modules/doubt/view/widget/edit_doubt.dart';

import '../../modules/dashboard/view/dashboard_view.dart';
import '../../modules/instruction_and_test/view/instruction_and_test_view.dart';
import '../../modules/doubt/view/widget/my_doubt.dart';
import '../../modules/doubt/view/doubt_ui.dart';
import '../../modules/login/view/login_screen.dart';
import '../../modules/onboarding/view/onboarding_view.dart';
import '../../modules/register/view/register_page.dart';
import '../../modules/test_report/view/test_report_view.dart';
import '../../modules/welcome/welcome.dart';

class RouteNames {
  static const String loginPage = "/login";
  static const String signupPage = "/signup";
  static const String mainHome = "/main_home";
  static const String homePage = "/home_page";
  static const String onboarding = "/onboarding";
  static const String register = "/register";
  static const String dashboard = "/dashboard";
  static const String instructionAndTest = "/instructionAndTest";
  static const String testReport = "/testReport";
  static const String doubtdetail = "/doubtdetail";
  static const String addmydoubt = "/addmydoubt";
  static const String editDoubt = "/editdoubt";
  static const String doubtPage = "/doubtPage";
}

final publicPages = [
  GetPage(name: '/', page: () => const Welcome()),
  GetPage(name: RouteNames.loginPage, page: () => const Login()),
  GetPage(name: RouteNames.register, page: () => const RegisterScreen()),
  GetPage(name: RouteNames.onboarding, page: () => const Onboarding()),
  GetPage(name: RouteNames.dashboard, page: () => const Dashboard()),
  GetPage(
    name: RouteNames.instructionAndTest,
    page: () => const InstructionAndTest(),
  ),
  GetPage(
    name: RouteNames.testReport,
    page: () => const TestReport(),
  ),
  GetPage(name: RouteNames.doubtdetail, page: () => DoubtDetail()),
  GetPage(name: RouteNames.addmydoubt, page: () => const AddMyDoubt()),
  GetPage(name: RouteNames.editDoubt, page: () => const EditDoubt()),
  GetPage(name: RouteNames.doubtPage, page: () => const DoubtScreen()),
];

final authorizedPages = [
  GetPage(name: RouteNames.homePage, page: () => const Welcome()),
];
