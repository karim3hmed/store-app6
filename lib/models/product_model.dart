class ProductModel {
  final dynamic id;
  final String title;
  final String price;
  final String desc;
  final String category;
  final String image;
  final Ratingmodel? rating;

  ProductModel({
    required this.rating,
    required this.id,
    required this.title,
    required this.price,
    required this.desc,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromjson(jsondata) {
    return ProductModel(
      rating:
          jsondata['rating'] == null
              ? null
              : Ratingmodel.fromjson(jsondata['rating']),
      id: jsondata["id"],
      title: jsondata["title"],
      price: jsondata["price"].toString(), // <- convert to String
      desc: jsondata["description"],
      category: jsondata["category"],
      image: jsondata["image"],
    );
  }
}

class Ratingmodel {
  final num rate;
  final num count;

  Ratingmodel({required this.rate, required this.count});

  factory Ratingmodel.fromjson(jsondata) {
    return Ratingmodel(rate: jsondata["rate"], count: jsondata["count"]);
  }
}
