import 'package:cart/Model/Products.dart';
import 'package:flutter/widgets.dart';

class ShoppingCart extends ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(
        id: 0,
        name: "Product 1",
        categoryName: "categoryName",
        imUrl:
            "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: 500,
        quantity: 1),
    ProductModel(
        id: 1,
        name: "Product 2",
        categoryName: "categoryName",
        imUrl:
            "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: 600,
        quantity: 1),
    ProductModel(
        id: 2,
        name: "Product 3",
        categoryName: "categoryName",
        imUrl:
            "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: 700,
        quantity: 1)
  ];

  ShoppingCart() {
    calculateTotalPrice();
  }
  double totalPrice = 0;

  List<int> shippingPrice = [10, 20, 50, 100];
  double paymentPrice = 0.0;

  incrementQuantity(id) {
    products[id].quantity++;
    notifyListeners();
  }

  decrementQuantity(id) {
    if (products[id].quantity > 1) products[id].quantity--;
    calculateTotalPrice();
  }

  removeProduct(id) {
    products.removeAt(id);
    calculateTotalPrice();
  }

  calculateTotalPrice() {
    totalPrice = 0;
    products.forEach((element) {
      totalPrice += element.quantity * element.price;
    });
    notifyListeners();
  }
}
