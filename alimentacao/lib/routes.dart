import 'package:alimentacao/view/donation_page.dart';
import 'package:alimentacao/view/donator_home_page.dart';
import 'package:alimentacao/view/donator_register.dart';
import 'package:alimentacao/view/login.dart';
import 'package:alimentacao/view/map_page.dart';
import 'package:alimentacao/view/receiver_register.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String donatorRegisterPage = '/auth/register/donator';
  static const String receiverRegisterPage = '/auth/register/receiver';
  static const String loginPage = '/auth/login';

  static const String donatorHomePage = '/donate/home';
  static const String donationPage = '/donate';
  static const String donationMapPage = '/donate/map';

  static Map<String, Widget Function(BuildContext)> routes = {
    donatorRegisterPage: (context) => const DonatorRegisterScreen(),
    receiverRegisterPage: (context) => const ReceiverRegisterScreen(),
    loginPage: (context) => const LoginScreen(),

    donatorHomePage: (context) => const DonatorHomePageScreen(),
    donationPage: (context) => DonationScreen(),
    donationMapPage: (context) => const PickUpLocationScreen()
  };
}
