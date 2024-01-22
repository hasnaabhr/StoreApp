import 'package:flutter/material.dart';

import 'package:storeapp/screens/category_details.dart';

// ignore: must_be_immutable
class CustomCardCtegories extends StatelessWidget {
  CustomCardCtegories({
    required this.category,
    Key? key,
  }) : super(key: key);
  dynamic category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoriesPagedetails(
                  categoryName: category.toString(),
                )));
      },
      child: Column(
        children: [
          Text(
            (category.toString()),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
