import 'package:flutter/cupertino.dart';
import 'donatable_item.dart';

bool _loaded = false;
void initData() {
  if (_loaded) { return; }

    DonatableItem('Farinha', const AssetImage("assets/img/donatables/flour.png"), []);
    DonatableItem('Alho', const AssetImage("assets/img/donatables/garlic.png"), []);
    DonatableItem('Óleo', const AssetImage("assets/img/donatables/oil.png"), []);
    DonatableItem('Azeite', const AssetImage("assets/img/donatables/olive-oil.png"), []);
    DonatableItem('Cebola', const AssetImage("assets/img/donatables/onion.png"), []);
    DonatableItem('Pimenta', const AssetImage("assets/img/donatables/red-chili-pepper.png"), []);
    DonatableItem('Sal', const AssetImage("assets/img/donatables/salt.png"), []);
    DonatableItem('Açucar', const AssetImage("assets/img/donatables/sugar.png"), []);
    DonatableItem('Tomate', const AssetImage("assets/img/donatables/tomato.png"), []);

  _loaded = true;
}
