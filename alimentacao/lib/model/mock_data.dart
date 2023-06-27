import 'package:alimentacao/model/donation.dart';
import 'package:alimentacao/model/donator.dart';
import 'package:alimentacao/model/pickup_point.dart';
import 'package:alimentacao/model/receiver.dart';
import 'package:flutter/cupertino.dart';
import 'donatable_item.dart';

bool _loaded = false;
void initData() {
  if (_loaded) { return; }

    DonatableItem('Farinha', const AssetImage("assets/img/donatables/flour.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Alho', const AssetImage("assets/img/donatables/garlic.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Óleo', const AssetImage("assets/img/donatables/oil.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Azeite', const AssetImage("assets/img/donatables/olive-oil.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Cebola', const AssetImage("assets/img/donatables/onion.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Pimenta', const AssetImage("assets/img/donatables/red-chili-pepper.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Sal', const AssetImage("assets/img/donatables/salt.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Açucar', const AssetImage("assets/img/donatables/sugar.png"), ['Caixa', 'Quilo', 'Unidade']);
    DonatableItem('Tomate', const AssetImage("assets/img/donatables/tomato.png"), ['Caixa', 'Quilo', 'Unidade']);

    PickUpPoint(
      "Av. Wenceslau Braz",
      237,
      "Vila Popular",
      "Itapetininga - SP",
      -23.576778811690577,
      -48.032560104257215
    );
    PickUpPoint(
      "R. Bernardino de Campos",
      103,
      "Centro",
      "Itapetininga - SP ",
      -23.588649057086553,
      -48.05411867081792
    );
    PickUpPoint(
      "Av. Nisshimbo do Brasil",
      1008,
      "Vila Camarão",
      "Itapetininga - SP",
      -23.60400772770806,
      -48.05575517401721
    );
    PickUpPoint(
      "Av. da Saudade",
      36,
      "Vila Rio Branco", 
      "Itapetininga - SP",
      -23.590800281623032,
      -48.06527700324815
    );

    DonatorUser(
      '',
      '',
      '',
      '',
      'donator@gmail.com',
      '123'
    );

    ReceiverUser(
      '',
      '',
      '',
      '',
      '',
      'receiver@gmail.com',
      '123'
    );

    Donation({}, 0, 0, DonationStatus.delivered);
    Donation({}, 0, 1, DonationStatus.pending);
    Donation({}, 0, 3, DonationStatus.reserved);
    Donation({}, 0, 2, DonationStatus.reserved);
    Donation({}, 0, 2, DonationStatus.reserved);
    Donation({}, 0, 1, DonationStatus.pending);
    Donation({}, 0, 1, DonationStatus.delivered);
    Donation({}, 0, 0, DonationStatus.received);
    Donation({}, 0, 2, DonationStatus.reserved);
    Donation({}, 0, 0, DonationStatus.pending);
    Donation({}, 0, 3, DonationStatus.received);
    Donation({}, 0, 0, DonationStatus.reserved);
    Donation({}, 0, 0, DonationStatus.delivered);
    Donation({}, 0, 1, DonationStatus.reserved);
    Donation({}, 0, 0, DonationStatus.pending);
    Donation({}, 0, 3, DonationStatus.pending);
    Donation({}, 0, 3, DonationStatus.received);
    Donation({}, 0, 2, DonationStatus.reserved);
    
  _loaded = true;
}
