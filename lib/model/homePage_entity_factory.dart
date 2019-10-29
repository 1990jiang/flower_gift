import './homePage_model_entity.dart';

class HomePageDataFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomePageModelEntity") {
      return HomePageModelEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}