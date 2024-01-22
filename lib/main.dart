import 'package:flutter/material.dart';
import 'package:storeapp/screens/categories_page.dart';
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/screens/onboarding_screen.dart';
import 'package:storeapp/screens/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
        HomePage.id: (context) => const HomePage(),
        CategoriesPage.id: (context) => CategoriesPage(),
        UpdateProductPage.id: (context) => const UpdateProductPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingScreen.id,
      home: OnBoardingScreen(),
    );
  }
}
