import 'package:hdbfinder/services/search_request/data_request.dart';

class MedianResale{

  static Future<String> getMedianPrice(String location, String flatType) async {
    var f=FetchJSON();

    String request='&q={"town":"'+location+'","flat_type":"'+flatType+'"}&sort="quarter"';
    await f.fetch(resaleMedian+request);

    var price=f.jsonBody['result']['records'][f.jsonBody['result']['records'].length-1]['price'];
    
    return price;
  }


}