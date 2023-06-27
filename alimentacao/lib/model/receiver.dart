import 'user_profile.dart';


class ReceiverUser extends UserProfile {
  static final List<ReceiverUser> _registeredReceivers = [];

  static int _getID(ReceiverUser user) {
    _registeredReceivers.add(user);
    return _registeredReceivers.length - 1;
  }
  
  static ReceiverUser get(int userID) {
    return _registeredReceivers[userID];
  }

  static List<ReceiverUser> getAll() {
    return _registeredReceivers;
  }

  static List<ReceiverUser> select(bool Function(ReceiverUser point) where) {
    return ReceiverUser.getAll().where((element) => where(element)).toList();
  }

  late final int id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String cpf;
  final String rg;

  ReceiverUser(this.firstName, this.lastName, this.birthDate, this.cpf, this.rg, email, password): super(email, password) {
    id = _getID(this);
  }
}
