import 'package:alimentacao/model/donatable_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: Components.uiButton("Próximo", Colors.white, () { Navigator.pushNamed(context, Routes.donationReviewPage); }, textColor: Components.colorPurple)
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
                          return DisplayedItem(item: _donatableItems[index]);
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
}


class DisplayedItem extends StatefulWidget {
  const DisplayedItem({super.key, required this.item});

  final DonatableItem item;

  @override
  State<DisplayedItem> createState() => _DisplayedItemState();
}

class _DisplayedItemState extends State<DisplayedItem> {
  String _unit = '';
  int _amount = 0;
  late DonatableItem _item;

  @override
  void initState() {
    super.initState();
    _unit = widget.item.validUnits.first;
    _item = widget.item;
  }
  
  void updateData(String unit, int amount) {
    setState(() {
      _unit = unit;
      _amount = amount;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context, 
          builder: (context) {
            return DonatableItemPopUp(
              item: _item,
              updateData: updateData
            );
          }
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _amount == 0 ? Colors.transparent : Components.colorGreen,
                width: 4
              ),
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: _item.image,
                width: 65,
                height: 65,
              ),
            ),
          ),
          Components.quickText(_item.name, fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, textAlign: TextAlign.center)
        ],
      )
    );
  }
}


class DonatableItemPopUp extends StatefulWidget {
  const DonatableItemPopUp({super.key, required this.item, required this.updateData});

  final DonatableItem item;
  final void Function(String, int) updateData;
  
  @override
  State<DonatableItemPopUp> createState() => _DonatableItemPopUpState();
}

class _DonatableItemPopUpState extends State<DonatableItemPopUp> {
  
  late final UnitsDropdown _dropdown;
  final GlobalKey<_UnitsDropdownState> dropdownKey = GlobalKey<_UnitsDropdownState>();

  final _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dropdown = UnitsDropdown(
      key: dropdownKey,
      values: widget.item.validUnits
    );
  }

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
                image: widget.item.image,
                width: 150,
                height: 150,
              ),
              Components.quickText(widget.item.name, fontSize: 30, fontWeight: FontWeight.w700, color: Components.colorPurple),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Components.quickText("Medida:", fontSize: 24, fontWeight: FontWeight.w700, color: Components.colorPurple),
                    _dropdown,
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Components.uiTextField("Quantidade", Components.colorPurple, controller: _textFieldController),
              ),
              Components.uiButton(
                "Confirmar", 
                Components.colorPurple, () {
                  print(_textFieldController.text);
                  widget.updateData(
                    dropdownKey.currentState!.selectedValue,
                    int.parse(_textFieldController.text)
                  );
                  Navigator.pop(context); 
                }
              )
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

  void test() {}
  
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