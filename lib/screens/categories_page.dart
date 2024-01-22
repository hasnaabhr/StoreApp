import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/services/all_categories.dart';
import 'package:storeapp/widgets/custom_categories.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});
  static String id = "CategoriesPage";

  // Define a list of background images for each category
  final List<String> categoryBackgroundImages = [
    'images/e.jpeg',
    'images/j.jpeg',
    'images/m.jpeg',
    'images/w.jpeg',
  ];

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
            ),
          )
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
        child: FutureBuilder<List<dynamic>>(
          future: AllCategoriesServices().getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> categories = snapshot.data!;
              return GridView.builder(
                itemCount: categories.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Background Image
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(categoryBackgroundImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // CustomCardCategories
                      CustomCardCtegories(
                        category: categories[index],
                      ),
                    ],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
