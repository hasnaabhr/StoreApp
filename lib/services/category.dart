import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModdel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products/category/$categoryName',
        token: '');

    List<ProductModdel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModdel.fromJson(data[i]),
      );
    }

    return productsList;
  }
}
