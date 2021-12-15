class Category {
  final int id;
  final String name;
  final String image;
  const Category({required this.id, required this.name, required this.image});
  
  // ignore: constant_identifier_names
  static const DATA_CATEGORIES = [
    Category(
      id: 1, 
      name: 'Pizza', 
      image: 'assets/images/pizza(1).png', 
    ),
    Category(
      id: 2, 
      name: 'Bugger', 
      image: 'assets/images/bugger(2).png', 
    ),
    Category(
      id: 3, 
      name: 'Ramen', 
      image: 'assets/images/pizza(1).png',
    ),
    Category(
      id: 4, 
      name: 'Pizza', 
      image: 'assets/images/pizza(1).png', 
    ),
  ];

}
