import 'package:alimentacao/view/donator_login.dart';
import 'package:alimentacao/view/receiver_login.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String loginDonatorPage = '/login/donator';
  static const String receiverDonatorPage = '/login/receiver';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginDonatorPage: (context) => const DonatorLoginScreen(),
    receiverDonatorPage: (context) => const ReceiverLoginScreen()
  };
}
