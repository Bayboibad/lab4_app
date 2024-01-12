class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  @override
  String toString() {
    return 'Product{id: $id, title: $title, description: $description, price: $price, '
        'discountPercentage: $discountPercentage, rating: $rating, stock: $stock, '
        'brand: $brand, category: $category, thumbnail: $thumbnail, images: $images}';
  }
}
