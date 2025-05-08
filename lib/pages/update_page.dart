import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/my_button.dart';
import 'package:store_app/widgets/my_textfield.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  static String id = "updatepage";

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

String? productname, decs, image;
int? price;

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    // pass info with product
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(title: Text("update Product"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextfield(
            hintText: "product name",
            onChanged: (data) {
              productname = data;
            },
          ),
          SizedBox(height: 10),
          MyTextfield(
            keyboardType: TextInputType.number,
            hintText: "price",
            onChanged: (data) {
              price = int.parse(data);
            },
          ),
          SizedBox(height: 10),
          MyTextfield(
            hintText: "image",
            onChanged: (data) {
              image = data;
            },
          ),
          SizedBox(height: 10),
          MyTextfield(
            hintText: "description",
            onChanged: (data) {
              decs = data;
            },
          ),
          SizedBox(height: 30),
          MyButton(
            text: "Update ",
            onTap: () async {
              try {
                await uodateproduct(product);
              } catch (e) {
                print(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }

  Future<void> uodateproduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productname == null ? product.title : productname!,
      price: price == null ? product.price.toString() : price.toString(),
      desc: decs == null ? product.desc : decs!,
      image: image == null ? product.image : image!,
      id: product.id,
      category: product.category,
    );
  }
}
