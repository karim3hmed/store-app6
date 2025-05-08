import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_page.dart';

class customcard extends StatelessWidget {
  const customcard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdatePage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withValues(alpha: 0.4),
                  spreadRadius: 1,
                  offset: Offset(10, 10),
                ),
              ],
            ),

            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.substring(0, 15),
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r"$"
                        "${product.price}",
                        style: TextStyle(fontSize: 16),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 32,
            left: 32,
            bottom: 100,
            child: Image(
              image: NetworkImage(product.image),
              height: 65,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
