import 'package:alimentacao/view/login_page.dart';
import 'package:flutter/material.dart';


class Routes {
  static String root = '/';
  static String loginPage = '/login';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginPage: (context) => const LoginPageScreen()
  };
}
