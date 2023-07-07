class ProductData {
  final String name;
  final String image;
  final int quantity;
  final String size;
  final int price;

  ProductData({
    required this.image,
    required this.quantity,
    required this.size,
    required this.price,
    required this.name,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'size': size,
      'quantity': quantity,
      'image': image,
    };
  }
}
