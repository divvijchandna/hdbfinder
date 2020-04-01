import 'package:hdbfinder/models/house.dart';
import 'package:hdbfinder/services/search_request/data_request.dart';

void main() async{
  var h=await House.getNearestMRT("BEDOK STH AVE 1");

  print(h[0]); //Station name
  print(h[1]); //Station distance

}