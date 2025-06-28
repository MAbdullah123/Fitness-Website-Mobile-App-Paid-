import 'package:flutter/foundation.dart';

class CartItem {
  final String image;
  final String description;
  final String detailedDescription;
  final double price;
  int quantity;
  final String? size;

  CartItem({
    required this.image,
    required this.description,
    required this.detailedDescription,
    required this.price,
    this.quantity = 1,
    this.size,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];
  int _itemCount = 0;

  List<CartItem> get items => _items;
  int get itemCount => _itemCount;

  void addToCart(CartItem item) {
    // Check if the item already exists in the cart
    final existingIndex = _items.indexWhere(
      (cartItem) => 
        cartItem.description == item.description && 
        cartItem.size == item.size
    );

    if (existingIndex != -1) {
      // If item exists, increment quantity
      _items[existingIndex].quantity += item.quantity;
    } else {
      // If item doesn't exist, add it to cart
      _items.add(item);
    }
    
    updateItemCount(_items.length);
    notifyListeners();
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      updateItemCount(_items.length);
      notifyListeners();
    }
  }

  void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _items.length && newQuantity > 0) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    updateItemCount(0);
    notifyListeners();
  }

  void updateItemCount(int count) {
    _itemCount = count;
    notifyListeners();
  }

  double getTotal() {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
} 