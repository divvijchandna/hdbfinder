import 'package:hdbfinder/services/search_request/data_request.dart';
import 'package:hdbfinder/models/pollution_index.dart';

class PollutionIndex{
  var status;
  var timestamp;
  var readings=new List(6);

  PollutionIndex();

  void fetch() async{
    var f=FetchJSON();
    await f.fetch(pollutionIndex);

    this.status=f.jsonBody['api_info']['status'];
    this.timestamp=f.jsonBody['items'][0]['update_timestamp'];

    for(int i=0;i<6;i++){
      readings[i]=PollutionZone(
          f.jsonBody['region_metadata'][i]['name'],
          f.jsonBody['region_metadata'][i]['label_location']['latitude'],
          f.jsonBody['region_metadata'][i]['label_location']['longitude'],
          f.jsonBody['items'][0]['readings']['pm10_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['pm25_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['o3_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['co_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['so2_sub_index'][f.jsonBody['region_metadata'][i]['name']]
      );
    }
  }

  void fetchByDate(String year, String month, String day) async{
    var f=FetchJSON();
    await f.fetch(pollutionIndex+'?'+year+'-'+month+'-'+day);

    this.status=f.jsonBody['api_info']['status'];
    this.timestamp=f.jsonBody['items'][0]['update_timestamp'];

    for(int i=0;i<6;i++){
      readings[i]=PollutionZone(
          f.jsonBody['region_metadata'][i]['name'],
          f.jsonBody['region_metadata'][i]['label_location']['latitude'],
          f.jsonBody['region_metadata'][i]['label_location']['longitude'],
          f.jsonBody['items'][0]['readings']['pm10_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['pm25_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['o3_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['co_sub_index'][f.jsonBody['region_metadata'][i]['name']],
          f.jsonBody['items'][0]['readings']['so2_sub_index'][f.jsonBody['region_metadata'][i]['name']]
      );
    }
  }
}
