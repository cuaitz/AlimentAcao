import 'package:alimentacao/view/login_page.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(
    MaterialApp(
      home: const LoginPageScreen(),
      debugShowCheckedModeBanner: false,
      routes: Routes.routes
    )
  );
}
