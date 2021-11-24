import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/models/package/package.dart';
import 'package:trend/models/trend_data/trend_data.dart';
import 'package:trend/services/auth/i_auth.dart';
import 'package:trend/services/database/i_db.dart';

@Injectable(as: IDb)
class Db implements IDb {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<Packages> getPackages() {
    // TODO: implement getPackages
    throw UnimplementedError();
  }

  @override
  Future<TrendData> getTrendData() async {
    var collection =
        await _firestore.collection('/trendData/carouselData/images').get();
    List<CarouselData> carList = [];
    collection.docs.forEach((element) {
      carList.add(CarouselData.fromJson(element.data()));
    });
    // print(collection.id);
    return TrendData(carouselImages: carList);
  }
}
