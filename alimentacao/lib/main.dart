import 'package:alimentacao/view/home_page.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomePageScreen(),
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      theme: ThemeData(
        fontFamily: 'Raleway'
      ),
    )
  );
}
