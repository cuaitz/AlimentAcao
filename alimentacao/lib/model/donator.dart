import 'user_profile.dart';


class DonatorUser extends UserProfile {
  static final List<DonatorUser> _registeredDonators = [];

  static int _getID(DonatorUser user) {
    _registeredDonators.add(user);
    return _registeredDonators.length - 1;
  }
  
  static DonatorUser get(int userID) {
    return _registeredDonators[userID];
  }

  static List<DonatorUser> getAll() {
    return _registeredDonators;
  }

  late final int id;
  final String businessName;
  final String fantasyName;
  final String address;
  final String cnpj;

  DonatorUser(this.businessName, this.fantasyName, this.address, this.cnpj, email, password): super(email, password) {
    id = _getID(this);
  }
}
