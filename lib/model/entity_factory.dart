import 'goods_entity.dart';
import 'store_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "StoreEntity") {
      return StoreEntity.fromJson(json) as T;
    } else if (T.toString() == "GoodsEntity"){
      return GoodsEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
