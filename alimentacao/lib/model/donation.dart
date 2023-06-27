class Donation {
  static final List<Donation> _registereDonations = [];

  static int _getID(Donation user) {
    _registereDonations.add(user);
    return _registereDonations.length - 1;
  }
  
  static Donation get(int userID) {
    return _registereDonations[userID];
  }

  static List<Donation> getAll() {
    return _registereDonations;
  }

  static List<Donation> select(bool Function(Donation point) where) {
    return Donation.getAll().where((element) => where(element)).toList();
  }

  late final int id;
  final Map<int, dynamic> donationItems;
  final int donatorID;
  final int pickUpPointID;

  Donation(this.donationItems, this.donatorID, this.pickUpPointID) {
    id = _getID(this);
  }
}
