import 'package:flutter/material.dart';

import 'package:storeapp/models/product_model.dart';

// ignore: must_be_immutable
class Customcatettegory extends StatelessWidget {
  Customcatettegory({
    required this.category,
    Key? key,
  }) : super(key: key);
  ProductModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: const Color(0xFFED7646).withOpacity(0.2),
                  spreadRadius: 0,
                  offset: const Offset(10, 10))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.title.substring(0, 6)),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${category.price.toString()}'),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 20,
              bottom: 75,
              child: Image.network(
                category.image,
                height: 100,
                width: 100,
              ))
        ],
      ),
    );
  }
}
