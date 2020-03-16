import 'set_filters.dart';

class Filters{
  //Filter Settings
  int _filterByPrice=0;
  int _filterBySize=0;
  int _filterByMRTProximity=0;
  int _filterByHealthCareProximity=0;
  int _filterByPollutionIndex=0;

  //Filter Range Parameters
  FilterRange filterRange=FilterRange();

  Filters(this._filterByPrice,this._filterBySize,this._filterByMRTProximity,this._filterByHealthCareProximity,this._filterByPollutionIndex){
    if(this._filterByPrice!=0 && this._filterByPrice!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this._filterBySize!=0 && this._filterBySize!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this._filterByMRTProximity!=0 && this._filterByMRTProximity!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this._filterByHealthCareProximity!=0 && this._filterByHealthCareProximity!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this._filterByPollutionIndex!=0 && this._filterByPollutionIndex!=1) {
      throw FormatException("Invalid Filter Setting");
    }
  }




}