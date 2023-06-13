import 'package:flutter/material.dart';
import '../components.dart';


class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: Components.colorGreen,
      ),
    );
  }
}
