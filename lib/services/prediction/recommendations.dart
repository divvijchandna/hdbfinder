import 'package:hdbfinder/services/database.dart';
import 'package:hdbfinder/services/search_request/data_request.dart';
import 'package:hdbfinder/services/search_request/listing_retrieve.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class Recommendations{
  SearchListings recommend=SearchListings();
  var jsonRecommendations;

  Recommendations();

  void getRecommendations() async{
    try{
      final FirebaseUser user = await FirebaseAuth.instance.currentUser();
      final String uid = user.uid.toString();

      DatabaseService d=DatabaseService(uid:uid);

      var l=await d.getSavedListings();

      print(1);

      int minArea=int.parse(l[0]['floor_area_sqm']);
      int maxArea=int.parse(l[0]['floor_area_sqm']);
      int minPrice=int.parse(l[0]['resale_price']);
      int maxPrice=int.parse(l[0]['resale_price']);

      print(2);

      var r=Random();

      int c=r.nextInt(l.length-1);
      String flatType=l[c]['flat_type'];

      c=r.nextInt(l.length-1);
      String town=l[c]['town'];

      print(3);

      for(int i=0;i<l.length;i++){
        if(int.parse(l[i]['resale_price'])>maxPrice){
          maxPrice=int.parse(l[i]['resale_price']);
        }
        if(int.parse(l[i]['resale_price'])<minPrice){
          minPrice=int.parse(l[i]['resale_price']);
        }
        if(int.parse(l[i]['floor_area_sqm'])>maxArea){
          maxArea=int.parse(l[i]['floor_area_sqm']);
        }
        if(int.parse(l[i]['floor_area_sqm'])<minArea){
          minArea=int.parse(l[i]['floor_area_sqm']);
        }
      }

      recommend.setFilters(1, 1, 1, 0, 1);
      recommend.setPriceRange(minPrice, minPrice+40000);
      recommend.setSortBy('resale_price');
      recommend.setAreaRange(maxArea-30, maxArea);
      recommend.setTown(town);
      recommend.setType(flatType);
      await recommend.getListingsByFilter();
      jsonRecommendations=recommend.listing.jsonBody;

    }catch(Exception){
      await recommend.getListingsByKeyword('');
      jsonRecommendations=recommend.listing.jsonBody;
    }
  }

}