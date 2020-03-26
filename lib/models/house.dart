import 'apply_filters.dart';

class House{
  int _houseID;
  String _houseNo;
  String _street;
  String _locality;
  String _nearestMRT;
  double _size;

  House(this._houseID,this._houseNo,this._street,this._locality,this._nearestMRT,this._size) {
    //Data safety measures
  }

  set houseID(int value) {
    _houseID = value;
  }


  set houseNo(String value) {
    _houseNo = value;
  }

  set street(String value) {
    _street = value;
  }

  set locality(String value) {
    _locality = value;
  }

  set nearestMRT(String value) {
    _nearestMRT = value;
  }

  set size(double value) {
    _size = value;
  }

  String get houseNo => _houseNo;

  String get street => _street;

  String get locality => _locality;

  String get nearestMRT => _nearestMRT;

  double get size => _size;

  int get houseID => _houseID;
}
