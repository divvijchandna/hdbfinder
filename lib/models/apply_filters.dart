import 'set_filters.dart';

class Filters{
  //Filter Settings
  var filterByPrice=0;
  var filterByArea=0;
  var filterByTown=0;
  var filterByModel=0;
  var filterByType=0;

  //Filter Range Parameters
  FilterRange filterRange=FilterRange();

  Filters(this.filterByPrice,this.filterByArea,this.filterByTown,this.filterByModel,this.filterByType){
    if(this.filterByPrice!=0 && this.filterByPrice!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this.filterByArea!=0 && this.filterByArea!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this.filterByTown!=0 && this.filterByTown!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this.filterByModel!=0 && this.filterByModel!=1){
      throw FormatException("Invalid Filter Setting");
    }
    if(this.filterByType!=0 && this.filterByType!=1){
      throw FormatException("Invalid Filter Setting");
    }
  }




}