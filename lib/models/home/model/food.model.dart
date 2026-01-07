class FoodModel {
  int? id;
  String? name;
  String? category;
  String? image;
  double? rating;
  bool? isFavorite;
  String? description;
  int? price;
  int? calories;

  FoodModel(
      {this.id,
      this.name,
      this.category,
      this.image,
      this.rating,
      this.isFavorite,
      this.description,
      this.price,
      this.calories});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'];
    isFavorite = json['isFavorite'];
    description = json['description'];
    price = json['price'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['image'] = image;
    data['rating'] = rating;
    data['isFavorite'] = isFavorite;
    data['description'] = description;
    data['price'] = price;
    data['calories'] = calories;
    return data;
  }
}