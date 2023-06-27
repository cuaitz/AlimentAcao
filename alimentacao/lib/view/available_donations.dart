import 'package:alimentacao/model/donation.dart';
import 'package:alimentacao/model/pickup_point.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';



class AvailableDonationsScreen extends StatefulWidget {
  const AvailableDonationsScreen({super.key});

  @override
  State<AvailableDonationsScreen> createState() => _AvailableDonationsScreen();
}

class _AvailableDonationsScreen extends State<AvailableDonationsScreen> {
  List<PickUpPoint> pickUpPoints = PickUpPoint.getAll();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Reservar doação", backgroundColor: Components.colorGreen),
      bottomNavigationBar: Container(
        color: Components.colorGreen,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Components.uiButton(
                  "Confirmar",
                  Colors.white,
                  () {},
                  textColor: Components.colorGreen
                ),
              ],
            )
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Components.quickText(
                "Pontos com doações",
                color: Components.colorGreen,
                fontSize: 32,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center
              ),
            ),
            SizedBox(
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: buildList(pickUpPoints),
              )
            )
          ],
        ),
      )
    );
  }

  Widget buildList(List<PickUpPoint> pickUpPoints) {
    if (pickUpPoints.isNotEmpty) {
      return ListView.builder(
        itemCount: pickUpPoints.length,
        itemBuilder: (context, index) {
          return donationCard(pickUpPoints[index]);
        }
      );
    } else {
      return Center(child: Components.quickText("Não há nada para ver aqui...", color: Components.colorGreen, fontSize: 24, fontWeight: FontWeight.w700, textAlign: TextAlign.center));
    }
  }

  Widget donationCard(PickUpPoint pickUpPoint) {
    
    int donationCounter = Donation.select((donation) {
      return donation.pickUpPointID == pickUpPoint.id;
    }).length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Components.colorGreen,
            width: 3
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Components.quickText("${pickUpPoint.roadName}, ${pickUpPoint.number}", color: Components.colorGreen, fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Components.colorGreen
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Components.quickText("$donationCounter Doações", color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}