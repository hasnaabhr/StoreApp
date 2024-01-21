import 'package:storeapp/models/rating_model.dart';

class ProductModdel {
  final dynamic id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final RatingModel? rating;
  ProductModdel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating,
      required this.category});
  factory ProductModdel.fromJson(jsonData) {
    return ProductModdel(
        id: jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}
