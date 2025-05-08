import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProdectServie {
  Future<List<ProductModel>> getallproduct() async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products",
    );
    List<ProductModel> Productslist = [];
    for (int i = 0; i < data.length; i++) {
      Productslist.add(ProductModel.fromjson(data[i]));
    }

    return Productslist;
  }
}

//https://fakestoreapi.com/products
