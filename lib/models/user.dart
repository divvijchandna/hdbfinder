class User{
  int _userID;
  String _givenName;
  String _lastName;
  String _address;
  int _postcode;

  int get userID => _userID;

  set userID(int value) {
    _userID = value;
  }

  String get givenName => _givenName;

  set givenName(String value) {
    _givenName = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  int get postcode => _postcode;

  set postcode(int value) {
    _postcode = value;
  }


}