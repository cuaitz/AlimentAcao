import 'package:flutter/material.dart';


class DonatableItem {
  static final List<DonatableItem> _registeredReceivers = [];

  static int _getID(DonatableItem user) {
    _registeredReceivers.add(user);
    return _registeredReceivers.length - 1;
  }
  
  static DonatableItem get(int userID) {
    return _registeredReceivers[userID];
  }

  static List<DonatableItem> getAll() {
    return _registeredReceivers;
  }

  static List<DonatableItem> select(bool Function(DonatableItem point) where) {
    return DonatableItem.getAll().where((element) => where(element)).toList();
  }

  late final int id;
  final String name;
  final ImageProvider image;
  final List<String> validUnits;

  DonatableItem(this.name, this.image, this.validUnits) {
    id = _getID(this);
    assert(validUnits.isNotEmpty, "É necessário informar pelo menos uma unidade de medida do item a ser doado.");
  }
}
