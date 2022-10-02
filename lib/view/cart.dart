import 'package:cart/state/shopping_cart.dart';
import 'package:cart/view/Product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Page"),
        ),
        body: Consumer<ShoppingCart>(builder: (context, value, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.products.length,
                    itemBuilder: (context, index) =>
                        ProductItem(productModel: value.products[index])),
              ),
              Consumer<ShoppingCart>(builder: (context, value, state) {
                return Container(
                  child: Text(
                    "Total Price:${value.totalPrice}",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        }));
  }
}
