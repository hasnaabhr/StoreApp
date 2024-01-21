import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/widgets/custom_text_field.dart';
import 'package:storeapp/widgets/custome_button.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProduct extends StatefulWidget {
  static String id = 'update product';

  const UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? productName;

  String? description;

  String? image;

  String? price;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModdel product =
        ModalRoute.of(context)!.settings.arguments as ProductModdel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    description = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                ),
                const SizedBox(
                  height: 70,
                ),
                CustomButton(
                  title: 'Update',
                  onTap: () async {
                    isloading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('success');
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
    );
  }

  Future<void> updateProduct(ProductModdel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
