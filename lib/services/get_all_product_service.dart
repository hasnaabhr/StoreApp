import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productslist = [];
    for (int i = 0; i < data.length; i++) {
      productslist.add(ProductModel.fromJson(data[i]));
    }
    return productslist;
  }
}
