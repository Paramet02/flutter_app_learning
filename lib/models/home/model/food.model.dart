class foodmodel {
  int? id;
  String? name;
  String? category;
  String? image;
  double? rating;
  bool? isFavorite;
  String? description;
  int? price;
  int? calories;

  foodmodel(
      {this.id,
      this.name,
      this.category,
      this.image,
      this.rating,
      this.isFavorite,
      this.description,
      this.price,
      this.calories});

  foodmodel.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['isFavorite'] = this.isFavorite;
    data['description'] = this.description;
    data['price'] = this.price;
    data['calories'] = this.calories;
    return data;
  }
}