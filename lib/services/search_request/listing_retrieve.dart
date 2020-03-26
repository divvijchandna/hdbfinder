import 'data_request.dart';
import 'package:hdbfinder/models/set_filters.dart';
import 'package:hdbfinder/models/apply_filters.dart';

class SearchListings{
  String request=resalePrice;
  Filters filters;
  String retrieveNumber='&limit=100';
  String sortBy='';
  FetchJSON listing=FetchJSON();

  SearchListings();

  void setSortBy(String sort){
    sortBy='&sort="'+sort+'"';
  }

  void setFilters(int filterByPrice, int filterByArea, int filterByTown, int filterByModel, int filterByType){
    filters=Filters(filterByPrice,filterByArea,filterByTown,filterByModel,filterByType);
  }

  void setPriceRange(int min, int max){
    filters.filterRange.maxPrice=max;
    filters.filterRange.minPrice=min;
  }

  void setAreaRange(int min, int max){
    filters.filterRange.maxArea=max;
    filters.filterRange.minArea=min;
  }

  void setTown(String name){
    filters.filterRange.town=name.toUpperCase();
  }

  void setType(String name){
    filters.filterRange.type=name.toUpperCase();
  }

  void setModel(String name){
    filters.filterRange.model=name;
  }

  void setReturnNumber(int number){
    retrieveNumber='&limit='+number.toString();
  }

  void getListingsByFilter() async{
    String query='';

    if(filters.filterByPrice==1){
      for(int i=filters.filterRange.minPrice;i<=filters.filterRange.maxPrice;i=i+1000){
        query=query+',"resale_price":'+'"'+i.toString()+'"';
      }
    }
    if(filters.filterByArea==1){
      for(int i=filters.filterRange.minArea;i<=filters.filterRange.maxArea;i++){
        query=query+',"floor_area_sqm":'+'"'+i.toString()+'"';
      }
    }
    if(filters.filterByType==1){
      query=query+',"flat_type":"'+filters.filterRange.type+'"';
    }
    if(filters.filterByModel==1){
      query=query+',"flat_model":"'+filters.filterRange.model+'"';
    }
    if(filters.filterByTown==1){
      query=query+',"town":"'+filters.filterRange.town+'"';
    }

    query=query.substring(1);
    request=request+'&q={'+query+'}';
    request=request+retrieveNumber;
    request=request+sortBy;

    print(request);

    await listing.fetch(request);
  }

  void getListingsByKeyword(String keyword) async{
    request=request+'&q='+keyword;
    request=request+retrieveNumber;

    await listing.fetch(request);
  }

}