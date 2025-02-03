class ProductModel {
  int id;
  String title;
  num price;
  String description;
  String? category;
  String image;
  RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    required this.image,
    required this.rating,
  });
}

class RatingModel {
  num rate;
  int count;

  RatingModel({
    required this.rate,
    required this.count,
  });
}
