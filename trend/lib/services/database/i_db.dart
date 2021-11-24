import 'package:trend/models/package/package.dart';
import 'package:trend/models/trend_data/trend_data.dart';

abstract class IDb {
  ///get  home data
  Future<TrendData> getTrendData();
  Future<Packages> getPackages();
}
