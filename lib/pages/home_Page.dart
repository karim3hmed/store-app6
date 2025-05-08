import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_prodect_servie.dart';
import 'package:store_app/widgets/custom_Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Trend"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.cartPlus), onPressed: () {}),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProdectServie().getallproduct(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              List<ProductModel> products = snapshots.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) {
                  return customcard(product: products[index]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
