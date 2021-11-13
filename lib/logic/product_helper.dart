import 'package:shop_app_midterm/data/clothes.dart';
import 'package:shop_app_midterm/models/clothes_model.dart';

class ProductHelper {
  List<Clothes> get getClothes => dummyData;

  getProductById(int findId) {
    return dummyData.firstWhere((element) => element.id == findId);
  }

  deleteProductById(int findId) {
    dummyData.removeWhere((element) => element.id == findId);
  }

  addProduct(Clothes item) {
    dummyData.add(item);
  }

  editProduct(Clothes item) {
    int idx = dummyData.indexOf(
        dummyData.firstWhere((element) => element.id == item.id));
    dummyData.replaceRange(idx, idx + 1, [item]);
  }
}
