import 'package:hdbfinder/services/prediction/price_predict.dart';
import 'package:hdbfinder/services/prediction/process_predict.dart';

void main() async{
  print(1);

  var input=processInput(1,1999,'bedok','2-room','01 TO 03','80','improved');
  int predict=score(input);
  double price=processOutput(predict);

  print(price);

  print(2);
  }