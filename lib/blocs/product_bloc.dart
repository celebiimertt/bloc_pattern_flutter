import 'dart:async';

import 'package:flutter_bloc_pattern/data/product_service.dart';
import 'package:flutter_bloc_pattern/models/product.dart';

class ProductBloc{
  final productStreamController=StreamController.broadcast();
  Stream get getStream=>productStreamController.stream;

  List<Product> getAll(){
    return ProductService.getAll();
  }
}

final productBloc=ProductBloc();
//Tüm sistemde erişim sağlayabilmek için bu referansı oluşturduk.