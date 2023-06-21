import 'package:flutter/material.dart';
import '../components.dart';


class DonatorLoginScreen extends StatelessWidget {
  const DonatorLoginScreen({super.key});

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
                  height: 520,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Components.uiTextField("Nome", Components.colorGreen),
                      Components.uiTextField("Sobrenome", Components.colorGreen),
                      Components.uiTextField("Data de nascimento", Components.colorGreen),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 178,
                            child: Components.uiTextField("CPF", Components.colorGreen),
                          ),
                          SizedBox(
                            width: 178,
                            child: Components.uiTextField("RG", Components.colorGreen),
                          ),
                        ],
                      ),
                      Components.uiTextField("Email", Components.colorGreen),
                      Components.uiTextField("Senha", Components.colorGreen, obscureText: true),
                      Components.uiTextField("Confirme sua senha", Components.colorGreen, obscureText: true),
                      Components.uiButton("Cadastrar", Components.colorGreen, () { })
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
