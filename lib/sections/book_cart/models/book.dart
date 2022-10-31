class Book {
  Book(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isFavorite;
}
