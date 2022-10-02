import 'package:cart/state/shopping_cart.dart';
import 'package:flutter/material.dart';

import 'package:cart/Model/Products.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;
  ProductItem({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                Text("${productModel.name}"),
                Container(
                  height: 100,
                  width: 100,
                  child: Image.network(productModel.imUrl),
                ),
                Text("${productModel.categoryName}"),
                Consumer<ShoppingCart>(
                  builder: (context, value, state) => InkWell(
                    onTap: () {
                      context
                          .read<ShoppingCart>()
                          .removeProduct(productModel.id);
                    },
                    child: const Text(
                      "Remove",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            Text("${productModel.price * productModel.quantity}"),
            Container(
                child: Row(children: [
              Consumer<ShoppingCart>(
                  builder: (context, value, state) => ElevatedButton(
                      onPressed: () {
                        value.incrementQuantity(productModel.id);
                      },
                      child: Icon(Icons.add))),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${productModel.quantity}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Consumer<ShoppingCart>(
                builder: (context, value, state) => IconButton(
                    onPressed: () {
                      value.decrementQuantity(productModel.id);
                    },
                    icon: Icon(Icons.remove)),
              )
            ]))
          ]),
        ),
      ),
    );
  }
}
