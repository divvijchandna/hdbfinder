import 'package:hdbfinder/models/house.dart';
import 'package:hdbfinder/services/search_request/data_request.dart';

class HDBListing{
  var listing;

  HDBListing(FetchJSON f){
    this.listing=List(f.jsonBody['result']['records'].length);

    for(int i=0; i<f.jsonBody['result']['records'].length; i++){
      listing[i]=House(
          f.jsonBody['result']['records'][i]['month'],
          f.jsonBody['result']['records'][i]['town'],
          f.jsonBody['result']['records'][i]['flat_type'],
          f.jsonBody['result']['records'][i]['block'],
          f.jsonBody['result']['records'][i]['street_name'],
          f.jsonBody['result']['records'][i]['storey_range'],
          f.jsonBody['result']['records'][i]['floor_area_sqm'],
          f.jsonBody['result']['records'][i]['flat_model'],
          f.jsonBody['result']['records'][i]['remaining_lease'],
          f.jsonBody['result']['records'][i]['resale_price']
      );
    }
  }
}