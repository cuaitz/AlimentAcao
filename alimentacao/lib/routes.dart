import 'package:alimentacao/view/receiver_login.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String loginReceiverPage = '/login/receiver';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginReceiverPage: (context) => const ReceiverLoginScreen()
  };
}
