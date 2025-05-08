import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getcategoriesproduct({
    required String categoryname,
  }) async {
    List<dynamic> data = await Api().get(
      url: "https://fakestoreapi.com/products/category/$categoryname",
    );

    List<ProductModel> Productslist = [];
    for (int i = 0; i < data.length; i++) {
      Productslist.add(ProductModel.fromjson(data[i]));
    }
    return Productslist;
  }
}
