class Product {
  String? name;
  num? price;
  String? desc;
  num? ratings;
  String? image;
  int? duration;
  bool? highLight;
  int? categoryId;

  Product(this.name,
    this.price,
    this.desc,
    this.ratings,
    this.image,
    this.duration,
    this.highLight,
    this.categoryId);

  Product.fromJSON(Map<String, dynamic> jsonData) {
    name = jsonData["name"];
    price = jsonData["price"];
    desc = jsonData["desc"];
    ratings = jsonData["ratings"];
    image = jsonData["image"];
    duration = jsonData["duration"];
    highLight = jsonData["highLight"];
    categoryId = jsonData["categoryId"];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'desc': desc,
    'ratings': ratings,
    'image': image,
    'duration': duration,
    'highLight': highLight,
    'categoryId': categoryId
  };
}
