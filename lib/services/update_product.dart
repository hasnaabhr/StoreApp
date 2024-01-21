import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class UpdateProductService {
  Future<ProductModdel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    print('product id  = $id');
    Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
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
