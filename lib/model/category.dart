class Category {
  int? id;
  String? name;
  String? image;
  Category(this.id, this.name, this.image);

  Category.fromJSON(Map<String, dynamic> jsonData){
    id = jsonData["id"];
    name = jsonData["name"];
    image = jsonData["image"];
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'image' : image
  };
}
