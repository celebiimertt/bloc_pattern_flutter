import 'package:flutter_bloc_pattern/models/cart.dart';

class CartService{
  static List<Cart> cartItems=new List<Cart>();
  static CartService _singLeton=CartService._internal();
  CartService._internal();
  factory CartService(){
    return _singLeton;
  }

  static void addToCart(Cart item){
      cartItems.add(item);
  }
  static void removeFromCart(Cart item){
    cartItems.remove(item);
  }
  static List<Cart> getCart(){
    return cartItems;
  }

}