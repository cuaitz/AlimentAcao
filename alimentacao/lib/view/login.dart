import 'package:alimentacao/model/donator.dart';
import 'package:alimentacao/model/receiver.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Registro", backgroundColor: Components.colorGreen),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(25),
                  child: Image(
                    image: AssetImage('assets/img/logo/logo_1.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Components.uiTextField("Email", Components.colorGreen, controller: _loginController),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: Components.uiTextField("Senha", Components.colorGreen, obscureText: true, controller: _passwordController),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.5),
                          child: Components.uiButton(
                            "Entrar", 
                            Components.colorGreen, 
                            () {
                              if (_formKey.currentState!.validate()){
                                List<DonatorUser> donators = DonatorUser.select((user) {
                                  return user.email == _loginController.text && user.password== _passwordController.text;
                                });

                                List<ReceiverUser> receivers = ReceiverUser.select((user) {
                                  return user.email == _loginController.text && user.password== _passwordController.text;
                                });

                                if (donators.isNotEmpty) {
                                  Navigator.pushNamed(context, Routes.donatorHomePage);
                                } else if (receivers.isNotEmpty) {
                                  Navigator.pushNamed(context, Routes.receiverHomePage); 
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Aviso'),
                                        content: const Text('Usuário ou senha incorretos.'),
                                        actions: [
                                          TextButton(
                                            child: const Text('Fechar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            }
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 70),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Components.quickText("Crie uma conta", textAlign: TextAlign.right)
                        ),
                        Components.quickText(" | ", fontSize: 24),
                        SizedBox(
                          width: 150,
                          child: Components.quickText("Esqueci a senha")
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: uiLoginButton("Entrar com o Google", const AssetImage('assets/img/icon/google.png'), () { }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: uiLoginButton("Entrar com o Facebook", const AssetImage('assets/img/icon/facebook.png'), () { })
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  ElevatedButton uiLoginButton(String text, ImageProvider prefixImage, void Function() onClick) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(60),
        backgroundColor: Components.colorIce,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image(
              image: prefixImage,
              width: 50,
              height: 50,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),
          ),
        ],
      )
    );
  }
}