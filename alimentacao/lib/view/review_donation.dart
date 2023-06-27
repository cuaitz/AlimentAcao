import 'package:alimentacao/model/donatable_item.dart';
import 'package:alimentacao/model/donation.dart';
import 'package:alimentacao/model/pickup_point.dart';
import 'package:alimentacao/view/map_page.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';

class ReviewDonationScreen extends StatefulWidget {
  const ReviewDonationScreen({super.key, required this.donationItems});
  
  final Map<int, dynamic> donationItems;

  @override
  State<ReviewDonationScreen> createState() => _ReviewDonationScreenState();
}

class _ReviewDonationScreenState extends State<ReviewDonationScreen> {
  String buttonText = 'Selecionar';
  int? pickUpPointID;

  @override
  Widget build(BuildContext context) {
    final List<int> itemsID = widget.donationItems.keys.toList();
    final List<dynamic> itemsData = widget.donationItems.values.toList();

    return Scaffold(
      appBar: Components.appBar("Doação", backgroundColor: Components.colorLightPurple),
      bottomNavigationBar: Container(
        color: Components.colorPurple,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Components.quickText("Ponto de coleta:", fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white, textAlign: TextAlign.left),
                Components.uiButton(buttonText, Colors.white, () async {

                  pickUpPointID = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const  PickUpLocationScreen())
                  );
                  setState(() {
                    if (pickUpPointID != null) {
                      PickUpPoint point = PickUpPoint.get(pickUpPointID!);
                        buttonText = "${point.roadName}, ${point.number}";
                    }
                  });
                }, textColor: Components.colorPurple),

                Components.uiButton("Finalizar", Colors.white, () {
                  if (pickUpPointID != null) {
                    Donation(widget.donationItems, 0, pickUpPointID!, DonationStatus.pending);
                    Navigator.popUntil(context, ModalRoute.withName(Routes.donatorHomePage));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Aviso'),
                          content: const Text('Escolha um ponto de coleta.'),
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
                }, textColor: Components.colorPurple),
              ],
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Components.colorPurple,
                  height: 120,
                  width: double.infinity,
                  child: Center(
                    child: Components.h1("Revise sua doação", color: Colors.white, textAlign: TextAlign.center)
                  )
                ),
                Expanded(
                  child: Container(
                    width: 400,
                    color: Components.colorLightPurple,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                      child: ListView.builder(
                        itemCount: itemsID.length,
                        itemBuilder: (context, index) {
                          return listItem(
                            DonatableItem.get(itemsID[index]),
                            itemsData[index]['amount'],
                            itemsData[index]['unit']
                          );
                        }
                      )
                    ),
                  ),
                ),
              ],
            )
          ),
        )
      )
    );
  }


  Padding listItem(DonatableItem item, int amount, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image(
                image: item.image,
                width: 75, 
                height: 75,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Components.quickText(item.name, fontSize: 24, fontWeight: FontWeight.w700, color: Components.colorPurple),
                  Components.quickText("Quantidade: $amount $unit(s)", fontSize: 18, fontWeight: FontWeight.w700, color: Components.colorPurple)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}