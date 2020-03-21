import 'package:hdbfinder/services/search_request/data_request.dart';

class PollutionIndex{
  String status;
  String timestamp;
  var readings=new List(6);

  PollutionIndex();

  void fetch() async{
    var f=FetchJSON();
    await f.fetch(pollutionIndex);

    this.status=f.jsonbody['api_info']['status'];
    this.timestamp=f.jsonbody['items'][0]['update_timestamp'];

    for(int i=0;i<6;i++){
      readings[i]=PollutionZone(
          f.jsonbody['region_metadata'][i]['name'],
          f.jsonbody['region_metadata'][i]['label_location']['latitude'],
          f.jsonbody['region_metadata'][i]['label_location']['longitude'],
          f.jsonbody['items'][0]['readings']['pm10_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['pm25_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['o3_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['co_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['so2_sub_index'][f.jsonbody['region_metadata'][i]['name']]
      );
    }
  }

  void fetchByDate(String year, String month, String day) async{
    var f=FetchJSON();
    await f.fetch(pollutionIndex+'?'+year+'-'+month+'-'+day);
    https://api.data.gov.sg/v1/environment/psi?date=2020-01-10

    this.status=f.jsonbody['api_info']['status'];
    this.timestamp=f.jsonbody['items'][0]['update_timestamp'];

    for(int i=0;i<6;i++){
      readings[i]=PollutionZone(
          f.jsonbody['region_metadata'][i]['name'],
          f.jsonbody['region_metadata'][i]['label_location']['latitude'],
          f.jsonbody['region_metadata'][i]['label_location']['longitude'],
          f.jsonbody['items'][0]['readings']['pm10_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['pm25_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['o3_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['co_sub_index'][f.jsonbody['region_metadata'][i]['name']],
          f.jsonbody['items'][0]['readings']['so2_sub_index'][f.jsonbody['region_metadata'][i]['name']]
      );
    }
  }
}

class PollutionZone{
  String name;
  double latitude;
  double longitude;
  double pm10;
  double pm25;
  double o3;
  double co;
  double so2;

  PollutionZone(this.name, this.latitude, this.longitude, this.pm10,
      this.pm25, this.o3, this.co, this.so2);
}