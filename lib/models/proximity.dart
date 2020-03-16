class Proximity{
  double _xCoord;
  double _yCoord;
  String _nearestMRT;
  double _distToMRT;
  double _distToSchool;

  double get xCoord => _xCoord;

  set xCoord(double value) {
    _xCoord = value;
  }

  double get yCoord => _yCoord;

  double get distToSchool => _distToSchool;

  set distToSchool(double value) {
    _distToSchool = value;
  }

  double get distToMRT => _distToMRT;

  set distToMRT(double value) {
    _distToMRT = value;
  }

  String get nearestMRT => _nearestMRT;

  set nearestMRT(String value) {
    _nearestMRT = value;
  }

  set yCoord(double value) {
    _yCoord = value;
  }


}