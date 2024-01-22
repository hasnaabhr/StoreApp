import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widgets/custom_text_field.dart';
import 'package:storeapp/widgets/custome_button.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productname, desc, image;

  String? price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update product",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: const Color(0xFFED7646),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    hintText: 'product name',
                    onChanged: (data) {
                      productname = data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'description',
                    onChanged: (data) {
                      desc = data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    inputType: TextInputType.number,
                    hintText: 'price',
                    onChanged: (data) {
                      price = data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    hintText: 'image',
                    onChanged: (data) {
                      image = data;
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButon(
                    text: 'Update',
                    onTap: () async {
                      isloading = true;
                      setState(() {});

                      try {
                        await updateproduct(product);
                        print('success');
                        setState(() {
                          Navigator.pushNamed(context, HomePage.id);
                        });
                      } catch (e) {
                        print(e.toString());
                      }
                      isloading = false;
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateproduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
        id: product.id,
        title: productname == null ? product.title : productname!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
