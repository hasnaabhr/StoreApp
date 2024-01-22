import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/category.dart';
import 'package:storeapp/widgets/custom_category.dart';

class CategoriesPagedetails extends StatefulWidget {
  const CategoriesPagedetails({super.key, required this.categoryName});
  static String id = "CategoriesPagedetails";
  final String categoryName;

  @override
  State<CategoriesPagedetails> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPagedetails> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.white,
              ))
        ],
        backgroundColor: const Color(0xFFED7646),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 15, left: 15),
        child: FutureBuilder<List<ProductModel>>(
            future: CategoriesServices()
                .getCategoriesProduct(categoryName: widget.categoryName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> categories = snapshot.data!;
                return GridView.builder(
                    itemCount: categories.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 100),
                    itemBuilder: (context, index) {
                      return Customcatettegory(
                        category: categories[index],
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
