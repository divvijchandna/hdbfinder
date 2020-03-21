import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

final resalePrice='';
final resaleIndex='';
final resaleMedian='';
final geoLoc='';
final hospitalLoc='';
final mrtLoc='';
final pollutionIndex='https://api.data.gov.sg/v1/environment/psi';
final test='https://jsonplaceholder.typicode.com/posts';


class FetchJSON{
  var jsonbody;

  FetchJSON();

  void fetch(String request) async{
    this.jsonbody=json.decode(await fetchData(request));
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

