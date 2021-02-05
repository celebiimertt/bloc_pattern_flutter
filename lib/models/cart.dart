import 'package:flutter_bloc_pattern/models/product.dart';

class Cart{
  Product product;
  int quantity;
  Cart(this.product,this.quantity);
}