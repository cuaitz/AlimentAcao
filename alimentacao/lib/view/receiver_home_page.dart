import 'package:alimentacao/model/donation.dart';
import 'package:alimentacao/model/pickup_point.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';



class ReceiverHomePageScreen extends StatefulWidget {
  const ReceiverHomePageScreen({super.key});

  @override
  State<ReceiverHomePageScreen> createState() => _ReceiverHomePageScreenState();
}

class _ReceiverHomePageScreenState extends State<ReceiverHomePageScreen> {
  List<Donation> donations = Donation.getAll();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Alimenta Ação", backgroundColor: Components.colorGreen),
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
                  "Reservar doação",
                  Colors.white,
                  () async {
                    await Navigator.pushNamed(context, Routes.availableDonations);
                    setState(() {
                      donations = Donation.getAll();
                    });
                  },
                  textColor: Components.colorGreen
                ),
              ],
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Components.quickText(
                  "Doações",
                  color: Components.colorGreen,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffdddddd),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: buildList(donations),
                  )
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  Widget buildList(List<Donation> donations) {
    if (donations.isNotEmpty) {
      return ListView.builder(
        itemCount: donations.length,
        itemBuilder: (context, index) {
          return donationCard(donations[index]);
        }
      );
    } else {
      return Center(child: Components.quickText("Não há nada para ver aqui...", color: Components.colorGreen, fontSize: 24, fontWeight: FontWeight.w700, textAlign: TextAlign.center));
    }
  }

  Widget donationCard(Donation donation) {
    PickUpPoint pickUpPoint = PickUpPoint.get(donation.pickUpPointID);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Components.colorGreen
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Components.quickText("Pendente", color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Components.quickText("Entregar doação em:", color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
              Components.quickText("${pickUpPoint.roadName}, ${pickUpPoint.number}", color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}