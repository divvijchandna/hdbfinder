import 'data_request.dart';
import 'package:hdbfinder/models/set_filters.dart';
import 'package:hdbfinder/models/apply_filters.dart';

class SearchListings{
  String request=resalePrice;
  Filters filters;
  String retrieveNumber='&limit=10';
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

  Future<void> getListingsByFilter() async{
    int pricerange=((filters.filterRange.maxPrice-filters.filterRange.minPrice)/1000).round();
    int arearange=filters.filterRange.maxArea-filters.filterRange.minArea+1;

    List<String> queries=List(arearange*pricerange);

    int k=0;

    for(int i=filters.filterRange.minArea;i<=filters.filterRange.maxArea;i=i+2){
      for(int j=filters.filterRange.minPrice;j<filters.filterRange.maxPrice;j=j+5000){
        String query='';
        if(filters.filterByType==1){
          query=query+',"flat_type":"'+filters.filterRange.type+'"';
        }
        if(filters.filterByModel==1){
          query=query+',"flat_model":"'+filters.filterRange.model+'"';
        }
        if(filters.filterByTown==1){
          query=query+',"town":"'+filters.filterRange.town+'"';
        }
        query=query+',"resale_price":'+'"'+j.toString()+'"';
        query=query+',"floor_area_sqm":'+'"'+i.toString()+'"';
        query=query.substring(1);

        query=request+'&q={'+query+'}';
        query=query+retrieveNumber;
        query=query+sortBy;

        queries[k]=query;
        k++;
      }
    }
    var tempListing=FetchJSON();

    await listing.fetch(queries[0]);

    for(int i=1;i<queries.length;i++){
      await tempListing.fetch(queries[i]);

      print(queries[i]);
      print(tempListing.jsonBody['result']['records']);

      listing.jsonBody['result']['records'].addAll(tempListing.jsonBody['result']['records']);
    }

    print(listing.jsonBody['result']['records']);
  }

  Future<void> getListingsByFilterdeprecate() async{
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
    print(request.length);

    await listing.fetch(request);

    print(listing.jsonBody['result']['records']);
  }

  Future<void> getListingsByKeyword(String keyword) async{
    request=request+'&q='+keyword;
    request=request+retrieveNumber;

    await listing.fetch(request);
  }

}