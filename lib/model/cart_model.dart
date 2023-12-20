import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ['Avocado', '4.0', 'lib/assets/avocado.png', Colors.green],
    ['Banana', '2.50', 'lib/assets/banana.png', Colors.yellow],
    ['Chicken', '3.50', 'lib/assets/chicken.png', Colors.brown],
    ['Water', '1.5', 'lib/assets/water.png', Colors.blue],
  ];

  List _cartItems = [];
  get cartItems => _cartItems;
  get shopitems => _shopItems;

  //adding items to the carts
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
