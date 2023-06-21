import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';


class ReceiverRegisterScreen extends StatelessWidget {
  const ReceiverRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Registro", backgroundColor: Components.colorPurple),
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
                  height: 520,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Components.uiTextField("Razão social", Components.colorPurple),
                      Components.uiTextField("Nome fantasia", Components.colorPurple),
                      Components.uiTextField("Endereço", Components.colorPurple),
                      Components.uiTextField("CNPJ", Components.colorPurple),
                      Components.uiTextField("Email", Components.colorPurple),
                      Components.uiTextField("Senha", Components.colorPurple, obscureText: true),
                      Components.uiTextField("Confirme sua senha", Components.colorPurple, obscureText: true),
                      Components.uiButton("Cadastrar", Components.colorPurple, () { })
                    ],
                  ),
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}
