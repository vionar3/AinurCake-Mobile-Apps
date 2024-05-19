import 'package:flutter/material.dart';
import 'package:ainurcake/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => _cartItems;

  void addToCart(CartModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CartModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
