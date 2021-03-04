import 'package:flutter/material.dart';
import 'package:flutterprovider_deepdive/models/product.dart';

// This class tracks the products that
// the user wants to buy, and it's a [ChangeNotifier]
class Cart with ChangeNotifier {
  List<Product> products = [];

  double get total {
    return products.fold(0.0, (double currentTotal, Product nextProduct) {
      return currentTotal + nextProduct.price;
    });
  }

  void removeFromCart(Product product) {
    products.remove(product);
    notifyListeners();
  }

  void addToCart(Product product) => products.add(product);
  int cartCount() => products.length;
}