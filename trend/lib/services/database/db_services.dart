import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/models/trend_data/trend_data.dart';
import 'package:trend/services/database/i_db.dart';

@injectable
class DbServices extends ChangeNotifier {
  final IDb _db;

  //todo: check null
  TrendData _trendData = TrendData(carouselImages: [
    CarouselData(
        imgUrl:
            'https://www.enigma-mag.com/wp-content/uploads/2018/12/after-party-82.jpg')
  ]);
  TrendData get trendData => _trendData;
  DbServices(this._db);

  getTrendData() async {
    var data = await _db.getTrendData();
    print(data.carouselImages[0].imgUrl);
    _trendData = data;
    notifyListeners();
  }
}
