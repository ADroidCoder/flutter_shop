import 'package:dio/dio.dart';
import 'package:flutter_shop/dao/config.dart';
import 'package:flutter_shop/model/entity_factory.dart';
import 'package:flutter_shop/model/store_entity.dart';

class HomeDao {

  static Future<StoreEntity> fetch() async {
    try {
      Response response = await Dio().get(HomeUrl);
      if (response.statusCode == 200) {
        return EntityFactory.generateOBJ<StoreEntity>(response.data);
      } else {
        throw Exception("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
