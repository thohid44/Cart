import 'dart:convert';

class ProductModel {
  int id;
  String name;
  String categoryName;
  String imUrl;
  double price;
  int quantity;
  ProductModel({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.imUrl,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'categoryName': categoryName,
      'imUrl': imUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      categoryName: map['categoryName'] ?? '',
      imUrl: map['imUrl'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel( name: $name, categoryName: $categoryName, imUrl: $imUrl, price: $price, quantity: $quantity)';
  }
}
