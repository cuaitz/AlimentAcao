import 'package:flutter/material.dart';
import 'package:alimentacao/components.dart';
import 'package:alimentacao/routes.dart';


class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Home"),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Image(
                        image: AssetImage('assets/img/logo/logo_1.png'),
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Components.h1("Alimenta Ação", textAlign: TextAlign.left),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Components.p("Organização que visa reduzir o desperdício de alimentos e melhorar a alimentação de pessoas em situação de vulnerabilidade social.", textAlign: TextAlign.left),
                    ),
                    paddedAssetImage('assets/img/donation0.png'),
                    Components.h1("Como é feito?", textAlign: TextAlign.left),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Components.p("Nós recolhemos alimentos que já perderam valor de prateleira no comércio e indústria, mas ainda estão aptos para consumo, e os distribuímos onde são mais necessários. No lugar de descartar legumes, massas, frutas, entre outros, os parceiros doam os excedentes à ONG que repassa tudo às entidades sociais cadastradas no projeto. Essa distribuição permite a complementação nutricional de refeições servidas para milhares de crianças, jovens, adultos e idosos na cidade de Itapetininga, todos os dias.", textAlign: TextAlign.left),
                    ),
                  ]
                )
              ),
              paddedAssetImage('assets/img/donation1.png'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Components.h1("Alimentando a\ninclusão social", textAlign: TextAlign.right),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Components.p("Nossas ações tratam em conjunto o problema da fome e da exclusão social. A distribuição dos alimentos satisfaz a necessidade básica, enquanto as ações educativas promovem um maior aproveitamento dos nutrientes fornecidos, possibilitando uma alimentação mais saborosa e balanceada. A melhoria na saúde favorece o desenvolvimento psicomotor das pessoas assistidas, criando condições para sua inserção na sociedade e no setor produtivo. O ciclo da fome é interrompido, o ciclo da inclusão social é favorecido.", textAlign: TextAlign.right),
                    ),
                    SizedBox(
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Components.uiButton(
                            "Quero fazer doações",
                            Components.colorGreen,
                            () {
                              Navigator.pushNamed(context, Routes.loginDonatorPage);
                            }
                          ),
                          Components.uiButton(
                            "Quero receber doações",
                            Components.colorGreen,
                            () {
                              Navigator.pushNamed(context, Routes.receiverDonatorPage);
                            }
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Components.footer()
            ],
          ),
        ),
      ),
    );
  }


  Padding paddedAssetImage(String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Image(
        image: AssetImage(path),
      )
    );
  }
}
