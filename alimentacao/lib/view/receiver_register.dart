import 'package:alimentacao/model/receiver.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';

class ReceiverRegisterScreen extends StatefulWidget {
  const ReceiverRegisterScreen({super.key});

  @override
  State<ReceiverRegisterScreen> createState() => _ReceiverRegisterScreenState();
}

class _ReceiverRegisterScreenState extends State<ReceiverRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ReceiverUser(
        _firstNameController.text,
        _lastNameController.text,
        _birthDateController.text,
        _cpfController.text,
        _rgController.text,
        _emailController.text,
        _passwordController.text
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Registro", backgroundColor: Components.colorGreen),
      body: SingleChildScrollView(
        child: Center(
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
                        color: Components.colorGreen,
                        width: 2
                      ),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 100,
                      color: Components.colorGreen,
                    ),
                  ),
                ),
                SizedBox(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        paddedTextField("Nome", Components.colorGreen, controller: _firstNameController),
                        paddedTextField("Sobrenome", Components.colorGreen, controller: _lastNameController),
                        paddedTextField("Data de nascimento", Components.colorGreen, controller: _birthDateController),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 178,
                                child: Components.uiTextField("CPF", Components.colorGreen, controller: _cpfController),
                              ),
                              SizedBox(
                                width: 178,
                                child: Components.uiTextField("RG", Components.colorGreen, controller: _rgController),
                              ),
                            ],
                          ),
                        ),
                        paddedTextField("Email", Components.colorGreen, controller: _emailController),
                        paddedTextField("Senha", Components.colorGreen, obscureText: true, controller: _passwordController),
                        paddedTextField("Confirme sua senha", Components.colorGreen, obscureText: true, controller: _passwordConfirmationController, validator: (str) {
                          if (str!.isEmpty) { return 'Preencha este campo.'; }
                          if (str != _passwordController.text) { return 'As senhas informadas não coincidem.'; }
                          return null;
                        },),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 2.5),
                          child: Components.uiButton(
                            "Cadastrar",
                            Components.colorGreen,
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
