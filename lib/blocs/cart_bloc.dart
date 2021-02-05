import 'dart:async';
import 'package:flutter_bloc_pattern/data/cart_service.dart';
import 'package:flutter_bloc_pattern/models/cart.dart';

class CartBloc{
  final cartStreamController=StreamController.broadcast();
  Stream get getStream=>cartStreamController.stream;

  void addToCart(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());
    //Sepette herhangi bir işlem olduğunda sepet tekrar güncellenir.
    //Sink stream'i tetikler.
  }
  void RemoveFromCart(Cart item){
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }
  List<Cart> getCart(){
    //Uygulama ilk açıldığında burası okunur.
    //Her ekleme çıkartma yaptığımızda sepet güncellenir.
    return CartService.getCart();
  }
}
final cartBloc=CartBloc();
//Tüm sistemde erişim sağlayabilmek için bu referansı oluşturduk.