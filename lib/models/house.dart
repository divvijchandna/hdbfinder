import 'package:hdbfinder/services/search_request/data_request.dart';
import 'package:hdbfinder/models/mrt_stations.dart';
import 'dart:math';

class House{
  var date;
  var town;
  var type;
  var block;
  var street;
  var storeyRange;
  var area;
  var model;
  var lease;
  var price;

  House(this.date, this.town, this.type, this.block, this.street,
      this.storeyRange, this.area, this.model, this.lease, this.price);

  static Future<List<Object>> getNearestMRT(String streetName) async{
    FetchJSON f=FetchJSON();

    String q=streetName;

    q=q+' singapore';
    
    q=q.replaceAll(" ", "+");

    print(q);

    String request='https://geocode.search.hereapi.com/v1/geocode?q='+q+'&apikey=EFmEhbk0_IgqxIS1gBOdECT4lK-nMWo-r9Y6pZi--lI&limit=5';
    print(request);
    await f.fetch(request);

    print(f.jsonBody['items'][0]['position']);

    var coordlat=f.jsonBody['items'][0]['position']['lat'];
    var coordlon=f.jsonBody['items'][0]['position']['lng'];


    print(23);

    String station="";
    double minDistance=1111111;
    for(int i=0;i<stations.length;i++){
      double d2r=3.14159265/180;
      double r=6371;
      double lat1=coordlat*d2r;
      double lon1=coordlon*d2r;
      double lat2=stations[i][1];
      double lon2=stations[i][2];
      lon2=lon2*d2r;
      lat2=lat2*d2r;

      double dlat=lat2-lat1;
      double dlon=(lon2-lon1)*cos(lat1);

      double distance=sqrt(dlat*dlat+dlon*dlon);
      if(distance<minDistance){
        minDistance=distance;
        station=stations[i][0];
      }
    }
    return [station,minDistance];
  }

  List<Object> getNearestMedical() {
    //Temporary
    return ["TemporaryHosp",-1]; //name and distance
  }
}
