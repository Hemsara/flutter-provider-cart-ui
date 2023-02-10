import 'package:cart_ui/models/cart_model.dart';
import 'package:cart_ui/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _cart = [];
  final double _shoppingCost = 10.0;

  double get shoppingCost => _shoppingCost;
  double get totalPrice => getTotalPrice();

  List<CartModel> get cart => _cart;

  void addToCart(ProductModel p) {
    var contain = _cart.where((element) => element.product.id == p.id);
    if (contain.isEmpty) {
      _cart.add(CartModel(product: p, quantity: 1));
    } else {
      contain.first.quantity += 1;
    }
    notifyListeners();
  }

  void deleteItem(String id) {
    _cart.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void incrementQty(String id) {
    CartModel item = _cart.where((element) => element.id == id).first;
    item.quantity++;
    notifyListeners();
  }

  void decrementQty(String id) {
    CartModel item = _cart.where((element) => element.id == id).first;

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cart.remove(item);
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double p = 0;
    for (var element in cart) {
      p += element.product.price * element.quantity;
    }
    return p;
  }
}
