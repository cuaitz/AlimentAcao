import 'package:alimentacao/view/donator_register.dart';
import 'package:alimentacao/view/receiver_register.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String loginDonatorPage = '/auth/register/donator';
  static const String receiverDonatorPage = '/auth/register/receiver';

  static Map<String, Widget Function(BuildContext)> routes = {
    loginDonatorPage: (context) => const DonatorLoginScreen(),
    receiverDonatorPage: (context) => const ReceiverLoginScreen()
  };
}
