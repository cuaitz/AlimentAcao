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

  late final int id;
  final String name;
  final ImageProvider image;
  final List<String> validUnits;

  DonatableItem(this.name, this.image, this.validUnits) {
    id = _getID(this);
  }
}
