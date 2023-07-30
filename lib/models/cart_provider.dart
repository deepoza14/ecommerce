import 'package:flutter/foundation.dart';
import 'package:masysecommerce/models/cart_database.dart';

class CartProvider with ChangeNotifier {
  double _subtotal = 0; // Variable to hold the subtotal

  double get subtotal => _subtotal;

  Future<List<Map<String, dynamic>>> getCartItems() async {
    return await CartDatabase.getCartItems();
  }

  void calculateSubtotal(List<Map<String, dynamic>> cartItems) {
    double tempSubtotal = 0;
    for (var item in cartItems) {
      int quantity = item['quantity'] ?? 1;
      double price = item['price'] is String
          ? double.tryParse(item['price'].replaceAll(',', '')) ?? 0
          : (item['price'] ?? 0).toDouble();
      tempSubtotal += price * quantity;
    }

    _subtotal = tempSubtotal;
    notifyListeners();
  }

  void incrementQuantity(String title, int quantity) async {
    await CartDatabase.updateCartItemQuantity(title, quantity);
    notifyListeners();
  }

  void decrementQuantity(String title, int quantity) async {
    await CartDatabase.updateCartItemQuantity(title, quantity);
    notifyListeners();
  }

  void removeItemFromCart(String title, double price, int quantity) {
    CartDatabase.removeFromCart(title);
    _subtotal -= price * quantity;
    notifyListeners();
  }
}
