
import 'dart:convert';
import 'package:alquran/models/surahs.dart';
import 'package:flutter/services.dart' show rootBundle;
//...
class Services{

//   String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
// final jsonResult = json.decode(data);

static const String quranPath='assets/json/quran.json';

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    return rootBundle.loadString(assetsPath)
        .then((jsonStr)  {
          return jsonDecode(jsonStr);
        });
  }


Future<List<Surahs>> fetchSurahs()async{
  print('in fetch');
  var quran = await parseJsonFromAssets(quranPath);  
  Map<String,dynamic> jsonData = quran['data'];
  List<Surahs> surahs = List<Surahs>(114);
  for(int i=0 ; i<=10;i++){
    print(jsonData['surahs'][i]['name']);
    surahs.add(
     Surahs.fromMap(jsonData['surahs'][i])
   );
  }
  print('end');
  print(Surahs.fromMap(jsonData['surahs'][0]).name);
  return surahs ;
} 



}