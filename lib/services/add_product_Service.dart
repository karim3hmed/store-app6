import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> AddProduct({
    required String title,
    price,
    Image,
    desc,
    category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: "https://fakestoreapi.com/products",
      body: {
        "title": title,
        "price": price,
        "description": desc,
        "image": Image,
        "category": category,
      },
    );
    return ProductModel.fromjson(data);
  }
}
