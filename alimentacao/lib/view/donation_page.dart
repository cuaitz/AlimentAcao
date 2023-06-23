import 'package:alimentacao/model/donatable_item.dart';
import 'package:flutter/material.dart';
import '../components.dart';
import '../routes.dart';


class DonationScreen extends StatelessWidget {
  DonationScreen({super.key});

  final List<DonatableItem> _donatableItems = DonatableItem.getAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appBar("Doação", backgroundColor: Components.colorLightPurple),
      bottomNavigationBar: Container(
        color: Components.colorPurple,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Components.uiButton("Próximo", Colors.white, () { Navigator.pushNamed(context, Routes.donationMap); }, textColor: Components.colorPurple)
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 120,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Components.colorPurple,
                  height: 120,
                  width: double.infinity,
                  child: Center(
                    child: Components.h1("O que está doando?", color: Colors.white, textAlign: TextAlign.center)
                  )
                ),
                Expanded(
                  child: Container(
                    width: 400,
                    color: Components.colorLightPurple,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemCount: _donatableItems.length,
                        itemBuilder: (context, index) {
                          return itemDisplay(_donatableItems[index], context);
                        },
                      ),
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

  GestureDetector itemDisplay(DonatableItem item, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context, 
          builder: (context) {
            return DonatableItemPopUp(item: item);
          }
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: item.image,
                width: 80,
                height: 80,
              ),
            ),
          ),
          Components.quickText(item.name, fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, textAlign: TextAlign.center)
        ],
      )
    );
  }
}

class DonatableItemPopUp extends StatelessWidget {
  const DonatableItemPopUp({super.key, required this.item});

  final DonatableItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image(
                image: item.image,
                width: 150,
                height: 150,
              ),
              Components.quickText(item.name, fontSize: 30, fontWeight: FontWeight.w700, color: Components.colorPurple),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Components.quickText("Medida:", fontSize: 24, fontWeight: FontWeight.w700, color: Components.colorPurple),
                    UnitsDropdown(values: item.validUnits),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Components.uiTextField("Quantidade", Components.colorPurple),
              ),
              Components.uiButton("Confirmar", Components.colorPurple, (){ Navigator.pop(context); })
            ],
          ),
        )
      ),
    );
  }
}

class UnitsDropdown extends StatefulWidget {
  const UnitsDropdown({super.key, required this.values});

  final List<String> values;

  @override
  State<UnitsDropdown> createState() => _UnitsDropdownState();
}

class _UnitsDropdownState extends State<UnitsDropdown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.values.first;

  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      iconEnabledColor: Components.colorPurple,
      style: const TextStyle(
        color: Components.colorPurple,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Raleway'
      ),
      value: selectedValue,
      items: widget.values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),

      onChanged: (String? value) {
        setState(() {
          selectedValue = value!;
        });
      }
    );
  }
}