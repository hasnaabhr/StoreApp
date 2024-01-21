import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class AddProduct {
  Future<ProductModdel> addProduct(
      {required String title,
      required String price,
      required String category,
      required String image,
      required String desc}) async {
    Map<String, dynamic> data = await Api().post(
        url: 'https://fakestoreapi.com/products',
        body: {
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category,
        },
        token: '');
    return ProductModdel.fromJson(data);
  }
}
