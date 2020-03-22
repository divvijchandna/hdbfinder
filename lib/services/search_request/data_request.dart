import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

final resalePrice='https://data.gov.sg/api/action/datastore_search?resource_id=42ff9cfe-abe5-4b54-beda-c88f9bb438ee';
final resaleIndex='https://data.gov.sg/api/action/datastore_search?resource_id=52e93430-01b7-4de0-80df-bc83d0afed40';
final resaleMedian='https://data.gov.sg/api/action/datastore_search?resource_id=a5ddfc4d-0e43-4bfe-8f51-e504e1365e27';
final geoLoc='';
final hospitalLoc='';
final mrtLoc='';
final pollutionIndex='https://api.data.gov.sg/v1/environment/psi';
final test='https://jsonplaceholder.typicode.com/posts';


class FetchJSON{
  var jsonBody;

  FetchJSON();

  void fetch(String request) async{
    this.jsonBody=json.decode(await fetchData(request));
  }
}

Future<String> fetchData(String request) async{
  http.Response response=await http.get(
    Uri.encodeFull(request),
    headers: {
      'Accept':'application/json'
    });
  if(response.statusCode==200){
    return response.body;
  }else{
    throw Exception("Failure retrieving data.");
  }
}

