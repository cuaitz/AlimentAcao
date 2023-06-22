import 'package:alimentacao/view/home_page.dart';
import 'package:flutter/material.dart';
import 'routes.dart';
import 'model/mock_data.dart' as mock_data;

void main() {
  mock_data.initData();
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
