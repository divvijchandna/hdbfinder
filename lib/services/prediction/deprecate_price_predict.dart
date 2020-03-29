import 'package:flutter/material.dart';
import 'package:sklite/utils/io.dart';
import 'package:sklite/tree/tree.dart';
import 'dart:convert';

class PredictionModel{
  //DecisionTreeClassifier model;

  //PredictionModel(){
  //  loadModel("assets/treemodel.json").then((x) {
  //    this.model=DecisionTreeClassifier.fromMap(json.decode(x));
  //  });
  //}

  static Future<int> getPrice(int mm, int yyyy, String town, String flatType, String storeyRange,
      String floorArea, String flatModel) async {

    DecisionTreeClassifier tree;

    await loadModel("assets/treemodel.json").then((x) {
      tree=DecisionTreeClassifier.fromMap(json.decode(x));
    });

    double storey=double.parse(storeyRange.substring(6));

    double type=0;
    String temp=flatType.substring(0,1);
    if(temp=="1" || temp=="2" || temp=="3" || temp=="4" || temp=="5"){
      type=double.parse(temp);
    }else if(temp=="M"){
      type=5;
    }else{
      type=6;
    }

    double model=0;
    var modelList=['IMPROVED', 'NEW GENERATION', 'MODEL A', 'STANDARD', 'SIMPLIFIED',
      'MODEL A-MAISONETTE', 'APARTMENT', 'MAISONETTE', 'TERRACE',
      '2-ROOM', 'IMPROVED-MAISONETTE', 'MULTI GENERATION',
      'PREMIUM APARTMENT', 'ADJOINED FLAT', 'PREMIUM MAISONETTE',
      'MODEL A2', 'DBSS', 'TYPE S1', 'TYPE S2', 'PREMIUM APARTMENT LOFT'];
    for(int i=0;i<modelList.length;i++){
      if(flatModel.toUpperCase()==modelList[i]){
        model=i/1;
      }
    }

    double area=double.parse(floorArea);

    double townid=0;
    var townList=['ANG MO KIO', 'BEDOK', 'BISHAN', 'BUKIT BATOK', 'BUKIT MERAH',
      'BUKIT TIMAH', 'CENTRAL AREA', 'CHOA CHU KANG', 'CLEMENTI',
      'GEYLANG', 'HOUGANG', 'JURONG EAST', 'JURONG WEST',
      'KALLANG/WHAMPOA', 'MARINE PARADE', 'QUEENSTOWN', 'SENGKANG',
      'SERANGOON', 'TAMPINES', 'TOA PAYOH', 'WOODLANDS', 'YISHUN',
      'LIM CHU KANG', 'SEMBAWANG', 'BUKIT PANJANG', 'PASIR RIS',
      'PUNGGOL'];
    for(int i=0;i<townList.length;i++){
      if(town.toUpperCase()==townList[i]){
        townid=i/1;
      }
    }
    //print(tree.predict([mm/1,yyyy/1,storey,type,model,area,townid]));
    return tree.predict([mm/1,yyyy/1,storey,type,model,area,townid]);
    
  }
}