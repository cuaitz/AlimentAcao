import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class PickUpPoint extends GeoPoint {
  static final List<PickUpPoint> _registeredPoints = [];

  static int _getID(PickUpPoint user) {
    _registeredPoints.add(user);
    return _registeredPoints.length - 1;
  }
  
  static PickUpPoint get(int userID) {
    return _registeredPoints[userID];
  }

  static List<PickUpPoint> getAll() {
    return _registeredPoints;
  }

  static PickUpPoint? getByLatLng(double latitude, double longitude) {
    PickUpPoint? output;
    getAll().forEach((point) {
      if (point.latitude == latitude && point.longitude == longitude) {
        output = point;
      }
    });

    return output;
  }

  late final int id;
  String roadName;
  int number;
  String neighborhood;
  String city;

  PickUpPoint(this.roadName, this.number, this.neighborhood , this.city, latitude, longitude): super(latitude: latitude, longitude: longitude) {
    id = _getID(this);
  }
}
