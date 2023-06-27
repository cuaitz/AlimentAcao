import 'package:alimentacao/model/donator.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';

class DonatorRegisterScreen extends StatefulWidget {
  const DonatorRegisterScreen({super.key});

  @override
  State<DonatorRegisterScreen> createState() => _DonatorRegisterScreenState();
}

class _DonatorRegisterScreenState extends State<DonatorRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _fantasyNameController = TextEditingController();
  final TextEditingController _addressNameController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();

  void _submitForm() {
    DonatorUser(
      _businessNameController.text,
      _fantasyNameController.text,
      _addressNameController.text,
      _cnpjController.text,
      _emailController.text,
      _passwordController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Registro", backgroundColor: Components.colorPurple),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Components.colorPurple,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                    color: Components.colorPurple,
                  ),
                ),
              ),
              SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      paddedTextField("Razão social", Components.colorPurple, controller: _businessNameController),
                      paddedTextField("Nome fantasia", Components.colorPurple, controller: _fantasyNameController),
                      paddedTextField("Endereço", Components.colorPurple, controller: _addressNameController),
                      paddedTextField("CNPJ", Components.colorPurple, controller: _cnpjController),
                      paddedTextField("Email", Components.colorPurple, controller: _emailController),
                      paddedTextField("Senha", Components.colorPurple, obscureText: true, controller: _passwordController),
                      paddedTextField("Confirme sua senha", Components.colorPurple, obscureText: true, controller: _passwordConfirmationController,
                      validator: (str) {
                        if (str!.isEmpty) { return 'Preencha este campo.'; }
                        if (str != _passwordController.text) { return 'As senhas informadas não coincidem.'; }
                        return null;
                      },),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 2.5),
                        child: Components.uiButton(
                          "Cadastrar",
                          Components.colorPurple,
                          () {
                            if (_formKey.currentState!.validate()) {
                              _submitForm();
                              Navigator.pushNamed(context, Routes.loginPage);
                            }
                          }
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]
          ),
        ),
      )
    );
  }

  Widget paddedTextField(String labelText, Color themeColor, {String? Function(String?)? validator, TextEditingController? controller, Color? backgroundColor, String? hintText, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Components.uiTextField(labelText, themeColor, validator: validator, controller: controller, backgroundColor: backgroundColor, hintText: hintText, obscureText: obscureText)
    );
  }
}
