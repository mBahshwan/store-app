import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/cupertino.dart';

class Cart extends ChangeNotifier {
  List<Product> _product = [];
  int price = 0;
  void add(Product product) {
    _product.add(product);
    price += product.price!.toInt();
    notifyListeners();
  }

  int get count => _product.length;
  int get totalPrice => price;
}
